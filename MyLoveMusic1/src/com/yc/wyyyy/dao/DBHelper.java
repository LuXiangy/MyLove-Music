package com.yc.wyyyy.dao;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.yc.wyyyy.util.LogUtils;

/**
 * 数据库连接帮助类 Class.forName();的作用是加载一个驱动类的对象 但这个对象在整个应用中只需实例化一次即可
 * 时机：当应用程序启动时，即加载Class.forName() ------>解决方案：将这句代码放到静态块中
 *
 */
public class DBHelper<T> {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static DataSource dataSource;

	// 保证数据库驱动要在应用程序加载之前加载起来
	static {
		try {
			Class.forName(MyProperties.getInstance().getProperty("driverName"));

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("系统安全退出");
			System.exit(0);
		}
	}

	/**
	 * 获取连接 因为写在DBHelper类中的字符串最后会变成字节码，这样数据库连接的参数是不能再修改的
	 * ->将这些参数能配置（即不会编程字节码）--->即将这些参数写到一个.properties 的文件中
	 * ->.properties文件实际上就是一个键值对 如何读取.properties文件 方案一：使用流 FileInputstream()
	 * 更好的方案二：使用 集合中的load(InputStream instream) ->通过get(key)来取值
	 * ->写一个单例类读取.properties 文件的内容
	 * 
	 */
	public Connection getCon() {

		Connection con = null;
		String url = MyProperties.getInstance().getProperty("url");
		String userName = MyProperties.getInstance().getProperty("userName");
		String password = MyProperties.getInstance().getProperty("password");

		try {
			con = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			LogUtils.error(e);
		}

		// try {
		// Context initCtx = new InitialContext();
		// Context envCtx = (Context) initCtx.lookup("java:comp/env");
		// DataSource ds = (DataSource)envCtx.lookup("jdbc/mysql");
		// con = ds.getConnection();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		return con;
	}

	/**
	 * 用于update,insert,delete 或ddl操作的方法
	 * 
	 * @param sql
	 *            :可以带问号
	 * @param params
	 *            : 是？对应的参数值列表
	 * @return 受影响的行数 可以是增.删.改
	 * @throws SQLException
	 */
	public int update(String sql, List<Object> params) throws SQLException {
		Connection con = getCon();
		PreparedStatement pstmt = null;
		int result = -1;

		try {
			pstmt = doPreparedStatement(sql, params, con);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			LogUtils.error(e);
			throw e;
		} finally {
			try {
				closeAll(null, pstmt, con);
			} catch (SQLException e) {
				LogUtils.error(e);
				throw e;
			}
		}
		return result;

	}

	private PreparedStatement doPreparedStatement(String sql,
			List<Object> params, Connection con) throws SQLException {
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		if (params != null && params.size() > 0) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(i + 1, params.get(i));
			}
		}
		return pstmt;
	}

	/**
	 * 查找cls反射类中所有的set方法
	 */
	private List<Method> findAllSetMethod(Class<T> cls) {
		List<Method> list = new ArrayList<Method>();
		Method[] ms = cls.getMethods();
		for (Method m : ms) {
			if (m.getName().startsWith("set")) {
				list.add(m);
			}
		}
		return list;
	}

	public List<T> findMultiObject(String sql, List<Object> params, Class<T> cls)
			throws InstantiationException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		// 先调用select得到List<Map>
		List<Map<String, String>> listmap = select(sql, params);
		List<T> listT = new ArrayList<T>();
		if (listmap != null && listmap.size() > 0) {
			for (Map<String, String> map : listmap) {
				// 将map转为T对象
				T t = parseMapToT(map, cls);
				listT.add(t);
			}
		}
		return listT;

	}

	public List<T> select(String sql, List<Object> params, Class<T> cls)
			throws InstantiationException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		// 先调用下面的select,得到List<Map>
		List<Map<String, String>> listMap = select(sql, params);
		List<T> listT = new ArrayList<T>();
		if (listMap != null && listMap.size() > 0) {
			for (Map<String, String> map : listMap) {
				// 将Map转换为T对象
				T t = parseMapToT(map, cls);
				listT.add(t);
			}
		}
		return listT;
	}

	/**
	 * 将Map类型转换为T对象
	 */
	private T parseMapToT(Map<String, String> map, Class<T> cls)
			throws InstantiationException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		T t = cls.newInstance();// ->会自动调用一个类中的无参构造方法.相当于(new 了一个type) Type p =
								// new Type();
		// 从cls中取出所有的setXXX方法
		List<Method> setMethods = findAllSetMethod(cls);// 获取所有的setXXXX方法
		for (Map.Entry<String, String> entry : map.entrySet()) {// entry 包括一个键
																// 和一组值
			String key = entry.getKey();// ID TAME PID
			String value = entry.getValue();// 1 军事家 0
			// 循环setMethods方法列表，依次找到setId(int) setTname(String) setPid(int)
			for (Method m : setMethods) {
				// 每找到一个方法，则激活方法
				String methodName = "set" + key; // setID setTNAME setPID
				if (methodName.equalsIgnoreCase(m.getName())) {
					// 是这个方法，则激活
					// 将value 转类型
					// 查出这个m中的参数类型
					Class c = m.getParameterTypes()[0];
					String parameterType = c.getName();
					if ("int".equals(parameterType)
							|| "java.lang.Integer".equals(parameterType)) {
						int v = Integer.parseInt(value);
						m.invoke(t, v);// t.setID(1)
					} else if ("float".equals(parameterType)
							|| "java.lang.Float".equals(parameterType)) {
						float v = Float.parseFloat(value);
						m.invoke(t, v);
					} else if ("double".equals(parameterType)
							|| "java.lang.Double".equals(parameterType)) {
						double v = Double.parseDouble(value);
						m.invoke(t, v);
					} else {
						m.invoke(t, value);
					}

				}
			}
		}
		return t;
	}

	public List<Map<String, String>> select(String sql, List<Object> params) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Connection con = getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = doPreparedStatement(sql, params, con);
			// 查询
			rs = pstmt.executeQuery();
			// 通过rs了解查询出来的结果有几个列组成 ->结果集的元数据 metadata
			ResultSetMetaData rsmd = rs.getMetaData();
			// 取出结果集中的列名
			List<String> columnNames = new ArrayList<String>();
			// getColumnCount() 结果集中的列的数量
			for (int i = 0; i < rsmd.getColumnCount(); i++) {
				// 从rsmd中取出下标为i的列名
				String columnLabelName = rsmd.getColumnLabel(i + 1);
				columnNames.add(columnLabelName);
			}
			while (rs.next()) {
				Map<String, String> rowMap = new HashMap<String, String>();
				// 在循环columnName取各列列名
				for (String cn : columnNames) {
					String value = rs.getString(cn);
					rowMap.put(cn, value);
				}
				list.add(rowMap);
			}
		} catch (SQLException e) {
			LogUtils.error(e);
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (SQLException e) {
				LogUtils.error(e);
			}
		}

		return list;
	}

	private void doParams(PreparedStatement pstmt, List<Object> params)
			throws SQLException {
		if (params != null && params.size() > 0) {
			for (int i = 0; i < params.size(); i++) {
				// 所有的参数都当成了字符串在处理, 如果参数是其它类型就不行 ( photo, text )
				// TODO: 将来这里有可能要增加要处理的数据类型
				pstmt.setString(i + 1, params.get(i) + "");
			}
		}
	}

	/**
	 * 聚合函数查询
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public int doSelect(String sql, List<Object> params) {
		int result = 0;
		Connection con = getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			doParams(pstmt, params);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con)
			throws SQLException {
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (con != null) {
			con.close();
		}
	}

	/**
	 * 聚合函数的查询
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public int findDouble(String sql, List<Object> params) {
		Connection con = getCon();
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			/* setParams(pstmt,params); */
			this.setValues(pstmt, params);// 给执行语句赋值
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * 从ResultSet中取出列名 包装成一个方法
	 * 
	 * @throws SQLException
	 */
	public List<String> getColumnName(ResultSet rs) throws SQLException {
		if (rs == null) {
			return null;
		}
		List<String> columnList = new ArrayList<String>();
		ResultSetMetaData rsmd = rs.getMetaData();
		for (int i = 0; i < rsmd.getColumnCount(); i++) {
			columnList.add(rsmd.getColumnLabel(i + 1));
		}
		return columnList;
	}

	private void setParams(List<String> params, PreparedStatement pstmt)
			throws SQLException { // 设参
		if (params != null && params.size() > 0) {
			for (int i = 1; i <= params.size(); i++) {
				pstmt.setString(i, params.get(i - 1));
			}
		}
	}

	public Long selectFun(String sql, List<Object> params) {
		long result = 0;
		Connection con = getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			doParams(pstmt, params);
			// 查询
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * 关闭的方法
	 */
	public void closeAll(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}

	/**
	 * 设置PreparedStatement对象的sql语句中的参数？
	 */
	public void setValues(PreparedStatement pstmt, List<Object> params) {
		if (pstmt != null && params != null && params.size() > 0) {
			String type = null;
			for (int i = 0; i < params.size(); i++) {
				Object o = params.get(i);
				try {
					if (o != null) {
						type = o.getClass().getName();
						if ("javax.sql.rowset.serial.SerialBlob".equals(type)) {
							pstmt.setBlob(i + 1, (Blob) params.get(i));
						} else if ("java.lang.Integer".equals(type)) {
							pstmt.setInt(i + 1,
									Integer.parseInt(String.valueOf(o)));
						} else {
							pstmt.setString(i + 1, String.valueOf(o));
						}
					} else {
						pstmt.setString(i + 1, "");
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void setValues(PreparedStatement pstmt, Object... objs) {
		if (pstmt != null && objs != null && objs.length > 0) {
			String type = null;
			for (int i = 0, len = objs.length; i < len; i++) {
				Object o = objs[i];
				try {
					if (o != null) {
						type = o.getClass().getName();
						if ("javax.sql.rowset.serial.SerialBlob".equals(type)) {
							pstmt.setBlob(i + 1, (Blob) o);
						} else if ("java.lang.Integer".equals(type)) {
							pstmt.setInt(i + 1,
									Integer.parseInt(String.valueOf(o)));
						} else {
							pstmt.setString(i + 1, String.valueOf(o));
						}
					} else {
						pstmt.setString(i + 1, "");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 聚合查询
	 * 
	 * @param sql
	 *            ：聚合查询语句
	 * @param params
	 *            ：参数列表，用来替换sql中的?（占位符）
	 * @return list:结果集
	 */

	public List<String> find(String sql, List<Object> params) {
		List<String> list = new ArrayList<String>();
		con = getCon();
		try {
			pstmt = con.prepareStatement(sql); // 预编译对象
			setValues(pstmt, params); // 设置参数
			rs = pstmt.executeQuery(); // 执行查询

			ResultSetMetaData md = rs.getMetaData(); // 结果集的元数据，它反映了结果集的信息
			int count = md.getColumnCount(); // 取出结果集中列的数量

			if (rs.next()) {
				for (int i = 1; i <= count; i++) {
					list.add(rs.getString(i));
				}
			}
		} catch (SQLException e) {
			LogUtils.info(e.toString());
		} finally {
			closeAll(con, pstmt, rs);
		}
		return list;
	}

	public List<String> find(String sql, Object... params) {
		List<String> list = new ArrayList<String>();
		con = getCon();
		try {
			pstmt = con.prepareStatement(sql); // 预编译对象
			setValues(pstmt, params); // 设置参数
			rs = pstmt.executeQuery(); // 执行查询

			ResultSetMetaData md = rs.getMetaData(); // 结果集的元数据，它反映了结果集的信息
			int count = md.getColumnCount(); // 取出结果集中列的数量

			if (rs.next()) {
				for (int i = 1; i <= count; i++) {
					list.add(rs.getString(i));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			LogUtils.info(e.toString());
		} finally {
			closeAll(con, pstmt, rs);
		}
		return list;
	}

	/**
	 * 查询单个表
	 * 
	 * @param <T>
	 *            泛型：即你要得到的集合中存的对象的类型
	 * @param sql
	 *            : 查询语句，可以含有?
	 * @param params
	 *            : ?所对应的参数值的集合
	 * @param c
	 *            ： 泛型类型所对应的反射对象
	 * @return ：存储了对象的集合
	 * @throws SQLException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws NumberFormatException
	 */
	public <T> List<T> find(String sql, Class<T> c, List<Object> params)
			throws InstantiationException, IllegalAccessException,
			NumberFormatException, IllegalArgumentException,
			InvocationTargetException {
		if (params == null) {
			return find(sql, c);
		} else {
			return find(sql, c, params.toArray());
		}
	}

	private Set<String> getMethodName(Set<String> keys) {
		Set<String> result = new HashSet<String>();
		for (String key : keys) {
			String newName = key.substring(0, 1).toUpperCase()
					+ key.substring(1);
			result.add("set" + newName);
		}
		return result;
	}

	public <T> List<T> find(String sql, Class<T> c, Object... params)
			throws InstantiationException, IllegalAccessException,
			NumberFormatException, IllegalArgumentException,
			InvocationTargetException {
		List<Map<String, Object>> listMap = finds(sql, params);
		List<T> list = new ArrayList<T>(); // 要返回的结果的集合

		T t = null;

		if (listMap == null || listMap.size() <= 0) {
			return list;
		}

		// 取出键
		Map<String, Object> map = listMap.get(0); // 取出的是一个map的键值对的形式
		Set<String> keys = map.keySet(); // 这里取出的是map键值对中的键名

		// 将键名拼接上set ，变成要找的方法名
		Set<String> methodNames = getMethodName(keys); // set键名
		Method[] ms = c.getMethods();
		for (Map<String, Object> m : listMap) {
			t = (T) c.newInstance(); // 创建反射类的实例化对象Product
			// 循环所有的方法，查到 与methodNames 中的相同的方法
			for (Method method : ms) {
				for (String mn : methodNames) { // setResadmin
					if (method.getName().equals(mn)) {
						// 激活这个method 用invoke
						String keyname = mn.substring(3, 4).toLowerCase()
								+ mn.substring(4);

						String typeName = method.getParameterTypes()[0]
								.getName();

						if ("java.lang.Integer".equals(typeName)
								|| "int".equals(typeName)) {
							method.invoke(t,
									Integer.parseInt(m.get(keyname).toString()));
						} else if ("java.lang.Double".equals(typeName)
								|| "double".equals(typeName)) {
							method.invoke(t, Double.parseDouble(m.get(keyname)
									.toString()));
						} else if ("java.lang.Float".equals(typeName)
								|| "float".equals(typeName)) {
							method.invoke(t,
									Float.parseFloat(m.get(keyname).toString()));
						} else if ("java.lang.Long".equals(typeName)
								|| "long".equals(typeName)) {
							method.invoke(t,
									Long.parseLong(m.get(keyname).toString()));
						} else {
							method.invoke(t, m.get(keyname).toString());
						}
						break;
					}
				}
			}
			list.add(t);
		}

		return list;
	}

	/**
	 * 查询操作
	 * 
	 * @param sql
	 *            ：要执行的查询语句
	 * @param params
	 *            ：查询语句中，对用占位符?的值
	 * @return：返回满足条件的所有数据
	 */
	public List<Map<String, Object>> finds(String sql, List<Object> params) {
		if (params == null) {
			return finds(sql);
		} else {
			return finds(sql, params.toArray());
		}
	}

	/**
	 * 查询操作
	 * 
	 * @param sql
	 *            ：要执行的查询语句
	 * @param params
	 *            ：查询语句中，对用占位符?的值
	 * @return：返回满足条件的所有数据
	 */
	public List<Map<String, Object>> finds(String sql, Object... objs) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		try {
			con = this.getCon();
			pstmt = con.prepareStatement(sql);

			this.setValues(pstmt, objs);// 给占位符赋值

			rs = pstmt.executeQuery();// 获取结果集

			// 获取返回结果中的列的列名
			ResultSetMetaData rsmd = rs.getMetaData();
			int colLen = rsmd.getColumnCount(); // 获取结果集中列的数量
			String[] colNames = new String[colLen];

			for (int i = 0; i < colLen; i++) {// 取出每个列的列名存放到数组中
				colNames[i] = rsmd.getColumnName(i + 1);
			}

			Map<String, Object> map = null;
			String typeName;
			Object obj;
			while (rs.next()) {// 循环取值，每循环一次就是一条记录，存放到一个map中
				map = new HashMap<String, Object>();
				for (int i = 0; i < colLen; i++) { // 循环取出每个列的值
					obj = rs.getObject(colNames[i]);
					if (obj != null) {
						typeName = obj.getClass().getSimpleName();
						if ("BLOB".equals(typeName)) {
							Blob blob = rs.getBlob(colNames[i]);
							byte[] bt = null;
							BufferedInputStream bis = null;
							try {
								bis = new BufferedInputStream(
										blob.getBinaryStream());
								bt = new byte[(int) blob.length()];
								bis.read(bt);
								map.put(colNames[i], bt);
							} catch (IOException e) {
								e.printStackTrace();
							} finally {
								if (bis != null) {
									try {
										bis.close();
									} catch (Exception e) {
										e.printStackTrace();
									}
								}
							}
						} else {
							map.put(colNames[i], rs.getString(colNames[i]));
						}
					} else {
						map.put(colNames[i], ""); // 以当前列的列名为键，以当前列的值为值
					}
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(con, pstmt, rs);
		}
		return list;
	}

}

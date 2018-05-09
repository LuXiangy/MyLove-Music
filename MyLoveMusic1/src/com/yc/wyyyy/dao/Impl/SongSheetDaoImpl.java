package com.yc.wyyyy.dao.Impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.yc.wyyyy.bean.SongSheet;
import com.yc.wyyyy.dao.DBHelper;
import com.yc.wyyyy.dao.ISongSheetDao;

public class SongSheetDaoImpl implements ISongSheetDao{

	@Override
	public int add(String ssname, String usid) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values(?,?,'0',0,0,0,0,0,0,'../fileUploadPath/1511018777745_5704.jpg',1)";
		List<Object> params = new ArrayList<Object>();
		params.add(ssname);
		params.add(usid);
		return db.update(sql, params);
	}
	public List<SongSheet> findById(String ssid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		DBHelper db=new DBHelper();
		String sql="select * from songSheet where ssname=? and status!=0";
		List<Object>params = new ArrayList<Object>();
		params.add(ssid);
		List<SongSheet> list=db.select(sql, params,SongSheet.class);
		return list;
	}
	public SongSheet findById(Integer ssid){
		DBHelper db=new DBHelper();
		String sql="select * from songSheet where ssid=? and status!=0";
		List<Object>params = new ArrayList<Object>();
		params.add(ssid);
		List<SongSheet> list=db.select(sql, params);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	@Override
	public List<SongSheet> find(Integer pageNo, Integer pageSize,Integer usid) {
		DBHelper db=new DBHelper();
		String sql="select * from songSheet where status!=0 ";
		List<Object> params= new ArrayList<Object>();
		if(usid != 0 && usid !=null && !"".equals(usid)){
			sql+=" and usid = ? ";
			params.add(usid);
		}
		sql+=" group by ssname order by usid limit ?,?";
		/*params.add(usid);*/
		params.add((pageNo-1)*pageSize);
		params.add(pageSize);
		return db.select(sql, params);
	}
	@Override
	public List<SongSheet> Mfind(Integer pageNo, Integer pageSize) {
		DBHelper db=new DBHelper();
		String sql="select * from songSheet where status!=0 and usid = 1 ";
		List<Object> params= new ArrayList<Object>();
		sql+=" group by ssname order by usid limit ?,?";
		params.add((pageNo-1)*pageSize);
		params.add(pageSize);
		return db.select(sql, params);
	}
	public List<SongSheet> find(Map<String,String> map,Integer pageNo,Integer pageSize,Integer usid){
		DBHelper db=new DBHelper();
		String sql="select * from songSheet  where status!=0 and usid = ? ";
		List<Object> params=new ArrayList<Object>();
		params.add(usid);
		if(map!=null && map.size()>0){//说明要做条件查询
			Set<String> keys=map.keySet();
			for(String key:keys){
				sql+=" and "+key+"?";//sql+=" where status!=0 and sname like ? and stid=?"
				params.add(map.get(key));
			}
		}
		sql+=" GROUP BY ssname order by ssid limit ?,? ";
		params.add((pageNo-1)*pageSize);
		params.add(pageNo*pageSize);
		/*System.out.println(sql);*/
		return db.select(sql, params);
	}
	@Override
	public int total(Map<String,String> map) {
		DBHelper db=new DBHelper();
		String sql="select count(DISTINCT ssname) total from songSheet where status!=0";
		List<Object> params=new ArrayList<Object>();
		if(map!=null && map.size()>0){
			Set<String> keys=map.keySet();
			for(String key:keys){
				sql+=" and "+key+" ?";//sql+=" where status!=0 and sname like ? and stid=?"
				params.add(map.get(key));
			}
		}
		return db.findDouble(sql, params);
	}

	@Override
	public int update(SongSheet songSheet) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="update songSheet set ssname=?,languages=?,style=?,scene=?,emotion=?,theme=?,photo=? where ssid=?";
		List<Object> params =new ArrayList<Object> ();
		params.add(songSheet.getSsname());
		params.add(songSheet.getLanguages());
		params.add(songSheet.getStyle());
		params.add(songSheet.getScene());
		params.add(songSheet.getEmotion());
		params.add(songSheet.getTheme());
		params.add(songSheet.getPhoto());
		params.add(songSheet.getSsid());
		return db.update(sql, params);
	}
	
	//收藏歌单
	public int update(String song,String ssname,String photo,String usid) throws SQLException {
		DBHelper db=new DBHelper();
//		String sql="update songSheet set song=song||? where ssid=?";
		//String sql = "insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status)values(?,?,?,0,0,0,0,0,0,?,1)";
		String sql = "update songsheet e set song=CONCAT(e.song,?) where ssname like ? ";
		List<Object> params =new ArrayList<Object> ();
		params.add(","+song);
		params.add(ssname);
		return db.update(sql, params);
	}

	@Override
	public int delete(String usid,String ssid) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="update songSheet set status=0 where usid=? and ssid=?";
		List<Object> params =new ArrayList<Object> ();
		params.add(usid);
		params.add(ssid);
		return db.update(sql, params);
		
	}

	@Override
	public int ClickRate(String usid, String ssid) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="update songSheet set ClickRate=ClickRate+1 where usid=? and ssid=?";
		List<Object> params =new ArrayList<Object> ();
		params.add(usid);
		params.add(ssid);
		return db.update(sql, params);
	}

	@Override
	public List<SongSheet> find(String usid) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db=new DBHelper();
		String sql="select * from songSheet where usid=? and status!=0 group by ssname";
		List<Object> params =new ArrayList<Object> ();
		params.add(usid);
		List<SongSheet> list = db.find(sql, SongSheet.class,params);
		return list;
	}

	@Override
	public int total(String usid) {
		DBHelper db=new DBHelper();
		String sql="select count(DISTINCT ssname) from songSheet where usid=? and status!=0";
		List<Object> params =new ArrayList<Object> ();
		params.add(usid);
		return db.findDouble(sql, params);
	}
	//将歌曲添加到歌单中
	@Override
	public int insertSong(String str) throws SQLException {
		DBHelper db = new DBHelper();
		String sql1= "select s.sid song from song s where saddr = ?";
		List<Object> par = new ArrayList<Object>();
		par.add(str);
		List<String> list = db.find(sql1, par);
		String song = list.get(0);
		String sql = "insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('默认歌单',6,?,0,0,0,0,0,0,'../fileUploadPath/1511018055237_12.jpg',1);";
		List<Object> params = new ArrayList<Object>();
		params.add(song);
		return db.update(sql, params);
	}
	//找寻默认歌单下是否存在该歌曲
	@Override
	public int finSong(String addr) throws Exception {
		DBHelper db = new DBHelper();
		String sql = "select ss.song,s.saddr from songsheet ss left join song s on  ss.song = s.sid where  ssname='默认歌单' and s.saddr  =? ";
		List<Object> params = new ArrayList<Object>();
		params.add(addr);
		List<String> list = db.find(sql, params);
		if(list.size()>0){
			return Integer.parseInt(list.get(0));
		}else{
			return 0;
		}
	}
	//歌单下的歌曲
	@Override
	public List<SongSheet> songSheetSong(String ssname,String usid) throws Exception {
		DBHelper db = new DBHelper();
		String sql = "select *from songsheet where ssname like  ? ";
		List<Object> params = new ArrayList<Object>();
		params.add(ssname);
		if(usid!=null&&!"".equals(usid)){
			sql+= " and usid = ?";
			params.add(usid);
		}
		List<SongSheet> list = db.find(sql,SongSheet.class, params);
		return list;
	}
	//根据ssid下查找歌单
	public List<SongSheet> findSongSsname(String ssid) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		DBHelper db = new DBHelper();
		int sid  = Integer.parseInt(ssid);
		String sql = "select *from songsheet where ssid = ? ";
		List<Object> params = new ArrayList<Object>();
		params.add(sid);
		List<SongSheet> list = db.find(sql,SongSheet.class, params);
		return list;
	}
	//查找所有歌单信息
	@Override
	public List<SongSheet> findAll(Integer pageNo, Integer pageSize) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		String sql = "select *from songsheet limit ?,?";
		List<Object> params = new ArrayList<Object>();
		params.add((pageNo-1)*pageSize);
		params.add(pageSize);
		List<SongSheet> list = db.find(sql,SongSheet.class,params);
		return list;
	}
}

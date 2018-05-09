package com.yc.wyyyy.dao.Impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import com.yc.wyyyy.bean.Song;
import com.yc.wyyyy.biz.ISongBiz;
import com.yc.wyyyy.biz.impl.SongBizImpl;
import com.yc.wyyyy.dao.DBHelper;
import com.yc.wyyyy.dao.ISongDao;

public class SongDaoImpl implements ISongDao {

	@Override
	public int add(Song song) throws SQLException {
		DBHelper db = new DBHelper();
		String sql = "insert into song(sname,singerId,saddr,lyric,clickRate,longs,languages,style,photo,status) values(?,?,?,?,0,?,?,?,?,1)";
		List<Object> params = new ArrayList<Object>();
		params.add(song.getSname());
		params.add(song.getSingerId());
		params.add(song.getSaddr());
		params.add(song.getLyric());
		params.add(song.getLongs());
		params.add(song.getLanguages());
		params.add(song.getStyle());
		params.add(song.getPhoto());
		return db.update(sql, params);

	}

	public List<Song> findAll() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		String sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s on singerId=s.sid where o.status!=0  and o.sid >1 and o.sid < 200";
		return db.select(sql, null,Song.class);
	}

	public List<Song> findBySelf() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		String sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.lyric lyric,o.sid sid from song o join singer s on singerId=s.sid where o.status!=0  and o.sid >21 and o.sid < 200";
		return db.select(sql, null,Song.class);
	}

	public List<Song> findByClick() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		String sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.lyric lyric,o.sid sid from song o join singer s on singerId=s.sid where o.status!=0  and o.sid >31 and o.sid < 200";
		return db.select(sql, null,Song.class);
	}

	public List<Song> findSong(String sid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		String sql = "select s.sname singerName,o.sname sname,o.longs longs,o.saddr saddr,o.sid sid,o.photo photo,o.lyric lyric from song o join singer s on singerId=s.sid  where  o.status != 0 and o.sid= ?";
		List<Object> params = new ArrayList<Object>();
		params.add(sid);
		return db.select(sql, params,Song.class);
	}

	@Override
	public List<Song> find(Map<String, String> map, Integer pageNo,
			Integer pageSize) {
		DBHelper db = new DBHelper();
		// map.put("sname like","%张%"); map.put("stid=","10")
		String sql = "select * from song where status!=0 ";
		List<Object> params = new ArrayList<Object>();
		if (map != null && map.size() > 0) {// 说明要做条件查询
			Set<String> keys = map.keySet();
			for (String key : keys) {
				sql += " and " + key + "?";// sql+=" where status!=0 and sname like ? and stid=?"
				params.add(map.get(key));
			}
		}
		sql += " order by sid limit ?,?";
		params.add((pageNo - 1) * pageSize);
		params.add(pageSize);
		return db.select(sql, params);
	}

	@Override
	public int total(Map<String, String> map) {
		DBHelper db = new DBHelper();
		String sql = "select count(sid) from song where status!=0";
		List<Object> params = new ArrayList<Object>();
		if (map != null && map.size() > 0) {
			Set<String> keys = map.keySet();
			for (String key : keys) {
				sql += " and " + key + " ?";// sql+=" where status!=0 and sname like ? and stid=?"
				params.add(map.get(key));
			}
		}
		return db.findDouble(sql, params);
	}

	@Override
	public int update(Song song) throws SQLException {
		DBHelper db = new DBHelper();
		String sql = "update song set sname=?,singerId=?,saddr=?,lyric=?,longs=?,languages=?,style=?,photo=? where sid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(song.getSname());
		params.add(song.getSingerId());
		params.add(song.getSaddr());
		params.add(song.getLyric());
		params.add(song.getLongs());
		params.add(song.getLanguages());
		params.add(song.getStyle());
		params.add(song.getPhoto());
		params.add(song.getSid());
		return db.update(sql, params);
	}

	@Override
	public int update(String sid) throws SQLException {
		DBHelper db = new DBHelper();
		String sql = "update song set clickRate=clickRate+1 where sid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(sid);
		return db.update(sql, params);
	}

	@Override
	public int delete(String sid) throws SQLException {
		DBHelper db = new DBHelper();
		String sql = "update song set status=0 where sid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(sid);
		return db.update(sql, params);
	}

	@Override
	public List<Song> findAllSongName()
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		String sql = "select DISTINCT sname from song where status!=0";
		return db.select(sql, null,Song.class);
	}

	@Override
	public List<Song> findAllSongByContext(String type, String context)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
				DBHelper db = new DBHelper();
				String sql=null;
				 if("歌曲".equals(type.trim())){//查询歌曲（按歌曲名字）
				 sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid  from song o join singer s on singerId=s.sid where o.status!=0  and o.sname = ?"; 
				 }else if("歌手".equals(type.trim())){//查询歌手（按歌手名字）
					sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid  from song o join singer s on singerId=s.sid where o.status!=0  and s.sname = ?";
				}else if("歌曲类型".equals(type.trim())){//按类型查找（按类型查找）
				 sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s join styleinfo s1 on singerId=s.sid  and style=s1.sid where o.status!=0  and o.style = (select sid from styleInfo s where s.sname = ?)";
				} 
				
				List<Object> params = new ArrayList<Object>();
				params.add(context); 
				 return db.select(sql, params,Song.class);

	}

/*	public List<Song> defaultSong(String ssname,String ssid,String usid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		List<Song> list = null;
		List<Object> params = new ArrayList<Object>();
		if(ssname==null||"".equals(ssname)){
			String sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s on singerId=s.sid  join songsheet ss on ss.song=o.sid  join userinfo ui on ui.usid = ss.usid  where o.status!=0 and ssname='默认歌单' ";
			if(usid !=null&&!"".equals(usid)){
				sql+=" and ui.usid = ?";
				params.add(usid);
			}
			list = db.select(sql, params,Song.class);
		}else{
			String sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s on singerId=s.sid  join songsheet ss on ss.song=o.sid  join userinfo ui on ui.usid = ss.usid  where o.status!=0 and ssname=?";
			params.add(ssname);
			if(usid !=null&&!"".equals(usid)){
				sql+=" and ui.usid = ?";
				params.add(usid);
			}
			list = db.select(sql, params,Song.class);
		}
		return list;
	}*/
	
	public List<Song> defaultSong(String[] allSong,String ssname,String usid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		List<Song> list = null;
		List<Object> params = new ArrayList<Object>();
		if(ssname==null||"".equals(ssname)){
			String sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s on singerId=s.sid  join songsheet ss on ss.song=o.sid  join userinfo ui on ui.usid = ss.usid  where o.status!=0 and ssname='默认歌单' ";
			if(usid !=null&&!"".equals(usid)){
				sql+=" and ui.usid = ?";
				params.add(usid);
			}
			list = db.select(sql, params,Song.class);
		}else{
			String sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s on singerId=s.sid where o.status!=0 ";
				for(int i = 0;i<allSong.length;i++){
						if(i==0){
							sql+=" and o.sid =?";
							params.add(allSong[i]);
						}else{
							sql+=" or o.sid =?";
							params.add(allSong[i]);
						}
				}
			list = db.select(sql, params,Song.class);
		}
		return list;
	}
	@Override
	public Song FindSongsByidAndName(Integer singerId, String songName) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		String sql = "select sname from song where singerId=? and sname=? ";
		List<Object> params = new ArrayList<Object>();
		params.add(singerId);
		params.add(songName);
		List<Song> songs =db.select(sql, params,Song.class);
		return songs.size()>0?songs.get(0):null;
	}
	
	@Override
	public Song findBySid(int sid) throws Exception{
		DBHelper db = new DBHelper();
		String sql = "select * from song where sid=? ";
		List<Object> params = new ArrayList<Object>();
		params.add(sid);
		List<Song> songs =db.select(sql, params,Song.class);
		return songs.size()>0?songs.get(0):null;
	}
	
	//查找默认歌单下的歌曲
	@Override
	public List<Song> findDefaultSongSheet(String usid) throws Exception {
		DBHelper db = new DBHelper();
		String sql = "select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s on singerId=s.sid  join songsheet ss on ss.song=o.sid  join userinfo ui on ui.usid = ss.usid  where o.status!=0 and ssname='默认歌单' and ss.usid = ? ";
		List<Object> params = new ArrayList<Object>();
		params.add(usid);
		List<Song> songs =db.select(sql, params,Song.class);
		return songs;
	}
}

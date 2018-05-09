package com.yc.wyyyy.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.Singer;
import com.yc.wyyyy.bean.SingerType;
import com.yc.wyyyy.bean.Song;
import com.yc.wyyyy.bean.StyleInfo;
import com.yc.wyyyy.biz.ISongBiz;
import com.yc.wyyyy.dao.ISingerDao;
import com.yc.wyyyy.dao.ISingerTypeDao;
import com.yc.wyyyy.dao.ISongDao;
import com.yc.wyyyy.dao.IStyleInfoDao;
import com.yc.wyyyy.dao.Impl.SingerDaoImpl;
import com.yc.wyyyy.dao.Impl.SingerTypeDaoImpl;
import com.yc.wyyyy.dao.Impl.SongDaoImpl;
import com.yc.wyyyy.dao.Impl.StyleInfoDaoImpl;
import com.yc.wyyyy.util.StringUtil;

public class SongBizImpl implements ISongBiz{

	@Override
	public int add(Song song) throws SQLException {
		ISongDao songDao=new SongDaoImpl();
		if(StringUtil.isNull(song.getSname())){
			return 0;
		}
		return songDao.add(song);
	}
	public List<Song> findAll() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		ISongDao songDao=new SongDaoImpl();
		return songDao.findAll();
	}
	public List<Song> findBySelf() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		ISongDao songDao=new SongDaoImpl();
		return songDao.findBySelf();
	}
	public List<Song> findByClick() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		ISongDao songDao=new SongDaoImpl();
		return songDao.findByClick();
	}
	public List<Song> findSong(String sid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		ISongDao songDao=new SongDaoImpl();
		return songDao.findSong(sid);
	}
	@Override
	public Map<String, Object> find(String sname, String singerId,String languages,String style, Integer pageNo, Integer pageSize) {
		Map<String,String > map=new HashMap<String,String>();
		ISongDao songDao=new SongDaoImpl();
		if(!StringUtil.isNull(languages)){
			map.put("languages like ","%"+languages+"%");
		}
		if(!StringUtil.isNull(style)){
			map.put("style like ","%"+style+"%");
		}
		if(!StringUtil.isNull(sname)){
			map.put("sname like ","%"+sname+"%");
		}
		if(!StringUtil.isNull(singerId)){
			map.put("singerId=", singerId);
		}
		List<Song> rows=songDao.find(map, pageNo, pageSize);
		int total=songDao.total(map);
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("total", total);
		result.put("rows", rows);
		return result;
	}

	public Map<String,Object> find(){
		Map<String,Object> map=new HashMap<String,Object>();
		//查询所有歌手信息
		ISingerTypeDao sinTypeDao=new SingerTypeDaoImpl();
		List<SingerType> singerType=sinTypeDao.find();
		map.put("singerTypes",singerType);
		
		
		//查询所有歌手
		ISingerDao singerDao=new SingerDaoImpl();
		List<Singer> singer=singerDao.find();
		map.put("singers", singer);
		
		//查询所有歌单类型
		IStyleInfoDao styleInfoDao=new StyleInfoDaoImpl();
		List<StyleInfo> styleInfos=styleInfoDao.find(null, "");
		map.put("styleInfos",styleInfos);
		
		return map;
		
	}
	@Override
	public int update(Song song) throws SQLException {
		ISongDao songDao=new SongDaoImpl();
		if(StringUtil.isNull(song.getSname())){
			return 0;
		}
		return songDao.update(song);
	}

	@Override
	public int update(String sid) throws SQLException {
		ISongDao songDao=new SongDaoImpl();
		if(StringUtil.isNull(sid)){
			return 0;
		}
		return songDao.update(sid);
	}

	@Override
	public int delete(String sid) throws SQLException {
		ISongDao songDao=new SongDaoImpl();
		if(StringUtil.isNull(sid)){
			return 0;
		}
		return songDao.delete(sid);
	}
	@Override
	public List<Song> findAllSongName()
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISongDao songDao=new SongDaoImpl();
		return songDao.findAllSongName();
	}
	@Override
	public List<Song> findAllSongByContext(String type,String context)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISongDao songDao=new SongDaoImpl();
		return songDao.findAllSongByContext(type,context);
	}
	//默认歌单下的歌曲
	/*@Override
	public List<Song> defaultSong(String ssname,String ssid,String usid) throws Exception {
		ISongDao songDao=new SongDaoImpl();
		return songDao.defaultSong(ssname,ssid,usid);
	}*/
	//默认歌单下的歌曲
		@Override
		public List<Song> defaultSong(String[] allSong,String ssname,String usid) throws Exception {
			ISongDao songDao=new SongDaoImpl();
			return songDao.defaultSong(allSong,ssname,usid);
		}
	//判断歌曲是否已经存在
	@Override
	public Song FindSongsByidAndName(Integer singerId, String songName) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISongDao songDao=new SongDaoImpl();
		return songDao.FindSongsByidAndName(singerId, songName);
	}
	
	@Override
	public Song  findBySid(int  sid) throws Exception {
		ISongDao songDao=new SongDaoImpl();
		Song list = songDao.findBySid(sid);
		return list;
	}
	//查找默认歌单下的歌曲
	@Override
	public List<Song> findDefaultSongSheet(String usid) throws Exception {
		if(StringUtil.isNull(usid)){
			return null;
		}
		ISongDao songDao=new SongDaoImpl();
		List<Song> list = songDao.findDefaultSongSheet(usid);
		return list ;
	}

}

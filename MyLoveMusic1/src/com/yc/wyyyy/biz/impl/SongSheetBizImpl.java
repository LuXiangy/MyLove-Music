package com.yc.wyyyy.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.SongSheet;
import com.yc.wyyyy.biz.ISongSheetBiz;
import com.yc.wyyyy.dao.ISongSheetDao;
import com.yc.wyyyy.dao.Impl.SongSheetDaoImpl;
import com.yc.wyyyy.util.StringUtil;

public class SongSheetBizImpl implements ISongSheetBiz{

	@Override
	public int add(String ssname, String usid) throws SQLException {
		if(StringUtil.isNull(ssname,usid)){
			return 0;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return songSheetDao.add(ssname, usid);
	}
	public Map<String,Object> find(String ssname,String languages,String style,String emotion,String theme,String scene,Integer pageNo,Integer pageSize,Integer usid){
		Map<String,String > map=new HashMap<String,String>();
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		if(!StringUtil.isNull(languages)){
			map.put("languages=",languages);
		}
		if(!StringUtil.isNull(style)){
			map.put("style=",style);
		}
		if(!StringUtil.isNull(emotion)){
			map.put("emotion=",emotion);
		}
		if(!StringUtil.isNull(theme)){
			map.put("theme=", theme);
		}
		if(!StringUtil.isNull(scene)){
			map.put("scene=", scene);
		}
		List<SongSheet> rows=songSheetDao.find(map, pageNo, pageSize,usid);
		int total=songSheetDao.total(map);
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("total", total);
		result.put("rows", rows);
		return result;
	}
	
	@Override
	public Map<String, Object> findAll(Integer pageNo, Integer pageSize) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {//查找所有歌曲
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		List<SongSheet> list=songSheetDao.findAll(pageNo, pageSize);
		Map<String,String > map1=new HashMap<String,String>();
		int total=songSheetDao.total(map1);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total",total);
		map.put("rows", list);
		return map;
	}
	@Override
	public Map<String, Object> find(Integer pageNo, Integer pageSize,Integer usid) {
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		List<SongSheet> list=songSheetDao.find(pageNo, pageSize,usid);
		int size = list.size();
		if(usid !=1){
			List<SongSheet> list1 = songSheetDao.Mfind(pageNo, pageSize);
			list.addAll(list1);
			System.out.println("list为"+list);
		}
		Map<String,String > map1=new HashMap<String,String>();
		int total=songSheetDao.total(map1);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total",total);
		map.put("rows", list);
		return map;
	}
	@Override
	public Map<String, Object> Mfind(Integer pageNo, Integer pageSize) {
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		List<SongSheet> list=songSheetDao.Mfind(pageNo, pageSize);
		Map<String,String > map1=new HashMap<String,String>();
		int total=songSheetDao.total(map1);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total",total);
		map.put("rows", list);
		return map;
	}
	public List<SongSheet> findById(String ssid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		if(StringUtil.isNull(ssid)){
			return null;
		}
		return songSheetDao.findById(ssid);
	}
	public SongSheet findById(Integer ssid){
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		if(ssid.equals(null)){
			return null;
		}
		return songSheetDao.findById(ssid);
	}
	//添加歌曲
	public int update(String song,String ssname,String photo,String usid) throws SQLException{
		if(StringUtil.isNull(ssname)||StringUtil.isNull(song)||StringUtil.isNull(photo)||StringUtil.isNull(usid)){
			return 0;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return songSheetDao.update(song, ssname,photo,usid);
	}
	@Override
	public int update(SongSheet songSheet) throws SQLException {
		if(StringUtil.isNull(songSheet.getSsname())||songSheet.getSsid().equals(null)){
			return 0;
		}
		System.out.println(songSheet.getLanguages());
		if((songSheet.getLanguages())==null){
			songSheet.setLanguages(1);}
		if((songSheet.getStyle())==null){
			songSheet.setStyle(1);}
		if((songSheet.getScene())==null){
			songSheet.setScene(1);}
		if((songSheet.getEmotion())==null){
			songSheet.setEmotion(1);}
		if((songSheet.getTheme())==null){
			songSheet.setTheme(1);
		}
			
		
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return songSheetDao.update(songSheet);
	}

	@Override
	public int delete(String usid, String ssid) throws SQLException {
		if(StringUtil.isNull(usid,ssid)){
			return 0;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return songSheetDao.delete(usid, ssid);
	}

	@Override
	public int ClickRate(String usid, String ssid) throws SQLException {
		if(StringUtil.isNull(usid,ssid)){
			return 0;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return songSheetDao.ClickRate(usid, ssid);
	}

	@Override
	public  List<SongSheet> find(String usid) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		if(usid.equals(0)||usid.equals(null)){
			return null;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return songSheetDao.find(usid);
	}

	@Override
	public int total(String usid) {
		if(usid.equals(0)||usid.equals(null)){
			return 0;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return  songSheetDao.total(usid);
	}
	//将歌曲添加到歌单中
	@Override
	public int insertSong(String str) throws SQLException {
		if(str.equals(0)||str.equals(null)){
			return 0;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return  songSheetDao.insertSong(str);
	}
	//找寻默认歌单下是否存在该歌曲
	@Override
	public int findSong(String addr) throws Exception {
		if(addr.equals(0)||addr.equals(null)){
			return 0;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return songSheetDao.finSong(addr);		
	}
	//歌单下的歌曲
	@Override
	public List<SongSheet> songSheetSong(String ssname,String usid) throws Exception {
		if(ssname.equals(0)||ssname.equals(null)){
			return null;
		}
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		return songSheetDao.songSheetSong(ssname,usid);		
	}
	
	//通过ssid下查找歌单
	public List<SongSheet> findSongSsname(String ssid) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		ISongSheetDao songSheetDao =new SongSheetDaoImpl();
		if(StringUtil.isNull(ssid)){
			return null;
		}
		return songSheetDao.findSongSsname(ssid);
	}
}

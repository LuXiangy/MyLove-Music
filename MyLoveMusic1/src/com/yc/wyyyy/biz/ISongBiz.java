package com.yc.wyyyy.biz;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.Song;

public interface ISongBiz {
	/*
	 * 添加歌曲
	 * 
	 */
	public int add(Song song) throws SQLException;
	/*
	 * 分页查询
	 */
	public Map<String,Object> find(String sname,String singerId,String languages,String style,Integer pageNo,Integer pageSize);
	
	public Map<String,Object> find();
	public List<Song> findAll() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	public List<Song> findBySelf() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	public List<Song> findByClick() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	public List<Song> findSong(String sid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	//查询所有歌曲的名字
	public List<Song> findAllSongName() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	//按歌曲名字查找
	public List<Song> findAllSongByContext(String type,String context) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	/*
	/*
	 * 修改歌曲信息
	 */
	public int update(Song song) throws SQLException;
	/*
	 * 修改点击率
	 */
	public int update(String sid) throws SQLException;
	/*
	 * 删除歌曲
	 * 
	 */
	public int delete(String sid) throws SQLException;
	
	/*//查找默认歌单下的歌曲
	public List<Song> defaultSong(String ssname,String ssid,String usid) throws SQLException, Exception;*/
	
	//查找默认歌单下的歌曲
	public List<Song> defaultSong(String[] allSong,String ssname,String usid) throws SQLException, Exception;
	
	//判断歌曲是否已经存在
	public Song FindSongsByidAndName(Integer singerId, String songName) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	//根据歌单编号查询歌曲信息
	public Song  findBySid(int sid) throws  Exception;
	
	//查找默认歌单下的歌曲
	public List<Song> findDefaultSongSheet(String usid) throws Exception;
}

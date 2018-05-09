package com.yc.wyyyy.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;








import com.yc.wyyyy.bean.SongSheet;

public interface ISongSheetDao {
	/*
	 * 添加歌单
	 * 
	 */
	public int add(String ssname,String usid) throws SQLException;
	/*
	 * 分页查询
	 */
	public List<SongSheet> findAll(Integer pageNo,Integer pageSize) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;//查找所有歌曲
	public List<SongSheet> find(Integer pageNo,Integer pageSize,Integer usid);
	public List<SongSheet> find(Map<String,String> map,Integer pageNo,Integer pageSize,Integer usid);
	public List<SongSheet> Mfind(Integer pageNo,Integer pageSize);
	/*
	 * 根据用户id查询歌单
	 */
	public List<SongSheet> find (String usid) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	public List<SongSheet> findById(String ssid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	public SongSheet findById(Integer ssid);
	//添加歌曲
	public int update(String song,String ssname,String photo,String usid) throws SQLException;
	/*
	 * 根据id查询总歌单数
	 */
	public int total(String usid);
	/*
	 * 查询总记录数
	 */
	public int total(Map<String,String> map);
	/*
	 * 修改歌单信息
	 */
	public int update(SongSheet songSheet) throws SQLException;
	/*
	 * 删除歌单信息
	 * 
	 */
	public int delete(String usid,String ssid) throws SQLException;

	public int ClickRate(String usid,String ssid) throws SQLException;
	
	//将歌曲添加到歌单中
	public int insertSong(String str) throws SQLException;
	
	//找寻默认歌单下是否存在该歌曲
	public int finSong(String addr) throws Exception;
	
	//歌单下的歌曲
	public List<SongSheet> songSheetSong(String ssname,String usid) throws Exception;
	
	//根据ssid下查找歌单
	public List<SongSheet> findSongSsname(String ssid) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
}

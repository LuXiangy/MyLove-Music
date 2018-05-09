package com.yc.wyyyy.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mysql.fabric.xmlrpc.base.Array;
import com.sun.javafx.collections.MappingChange.Map;
import com.yc.wyyyy.bean.Singer;
import com.yc.wyyyy.bean.Song;
import com.yc.wyyyy.bean.SongSheet;
import com.yc.wyyyy.biz.ISingerBiz;
import com.yc.wyyyy.biz.ISongBiz;
import com.yc.wyyyy.biz.ISongSheetBiz;
import com.yc.wyyyy.biz.impl.SingerBizImpl;
import com.yc.wyyyy.biz.impl.SongBizImpl;
import com.yc.wyyyy.biz.impl.SongSheetBizImpl;
import com.yc.wyyyy.dao.ISongDao;
import com.yc.wyyyy.dao.Impl.SongDaoImpl;
import com.yc.wyyyy.util.FileUploadUtil;
import com.yc.wyyyy.util.MusicUtil;
import com.yc.wyyyy.util.StringUtil;

@WebServlet("/songServlet")
public class SongServlet extends BasicServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String op = req.getParameter("op");
		if ("find".equals(op)) {
			find(req, resp);
		} else if ("addSong".equals(op)) {
			try {
				addSong(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("delSong".equals(op)) {
			try {
				delSong(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("updateSong".equals(op)) {
			try {
				updateSong(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("search".equals(op)) {
			search(req, resp);
		} else if ("findInfo".equals(op)) {
			findInfo(req, resp);
		} else if ("findAll".equals(op)) {
			try {
				findAll(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("addClick".equals(op)) {
			try {
				addClick(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("findByself".equals(op)) {
			try {
				findByself(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("findByClick".equals(op)) {
			try {
				findByClick(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("findSong".equals(op)) {
			try {
				findSong(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} /*
			 * else if("findSongByOrg".equals(op)){ try {
			 * findSongByOrg(req,resp); } catch (Exception e) {
			 * e.printStackTrace(); } }
			 */else if ("Headsearch".equals(op)) {
			Headsearch(req, resp);
		}else if ("FindAllSongsName".equals(op)) {
			try {
				 FindAllSongsName(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("searchSong".equals(op)){
			try{
			searchSong(req,resp);
			}catch (Exception e) {
				e.printStackTrace();	
				}
		}else if("defaultSong".equals(op)){
			try{
			defaultSong(req,resp);
			}catch (Exception e) {
				e.printStackTrace();	
			}
		}else if("defaultSongSheet".equals(op)){
			try{
				defaultSongSheet(req,resp);
			}catch (Exception e) {
				e.printStackTrace();	
			}
		}else if("findBySid".equals(op)){
			try{
			findBySid(req,resp);
			}catch (Exception e) {
				e.printStackTrace();	
			}
		}else if("findSongByNameAndId".equals(op)){
			findSongByNameAndId(req,resp);
		}
	}
	/**
	 * 检测歌曲是否在数据库中存在（查重）
	 * @param req
	 * @param resp
	 */
	private void findSongByNameAndId(HttpServletRequest req, HttpServletResponse resp) {
		//进行判定歌曲是否已经在数据库存在
		ISongBiz songBiz = new SongBizImpl();
		Integer singerId=Integer.parseInt(req.getParameter("singerId"));
		String sname=req.getParameter("sname").trim();
				Song song2=null;
				try {
					song2=songBiz.FindSongsByidAndName(singerId, sname);
				}catch (Exception e) {
					e.printStackTrace();
				}
				if(song2!=null){
					this.out(resp, 1);//表示歌曲存在
				}else{
					this.out(resp, 0);//表示歌曲不存在
				}
	}
	//查找默认歌单下的歌曲
	private void defaultSongSheet(HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		ISongBiz songBiz = new SongBizImpl();
		String usid = req.getParameter("usid");
		List<Song> list = songBiz.findDefaultSongSheet(usid);
		Gson gson = new GsonBuilder().create();
		System.out.println("默认歌单下的歌曲为:"+list);
		this.out(resp, gson.toJson(list));
	}

	private void searchSong(HttpServletRequest req, HttpServletResponse resp) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		String context=req.getParameter("context");
		//HttpSession session=req.getSession();
		//session.setAttribute("ssid", ssid);
		String type=context.substring(context.lastIndexOf("-")+1);
		String text=context.substring(0, context.indexOf("-"));
		//System.out.println(type);
		//System.out.println(text);
			ISongBiz songBiz = new SongBizImpl();
			List<Song> songs = songBiz.findAllSongByContext(type, text);
			HttpSession session=req.getSession();
			session.setAttribute("songs", songs);
		 System.out.println(songs);
		this.out(resp, 1);
		
	}

	// 原创排行歌曲
	/*
	 * private void findSongByOrg(HttpServletRequest req, HttpServletResponse
	 * resp) { String sid=req.getParameter("sid"); ISongBiz songBiz=new
	 * SongBizImpl(); Gson gson=new GsonBuilder().create(); List<Song>
	 * songs=songBiz.findSongByOrg(sid); this.out(resp,gson.toJson(songs) ); }
	 */

	/**
	 * 查询所有歌曲的名字
	 * @param req
	 * @param resp
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	private void FindAllSongsName(HttpServletRequest req, HttpServletResponse resp)throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
			ISongBiz songBiz = new SongBizImpl();
			List<Song> songs = songBiz.findAllSongName();
			Gson gson = new GsonBuilder().create();
			this.out(resp, gson.toJson(songs));
	}

	private void findSong(HttpServletRequest req, HttpServletResponse resp)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		String sid = req.getParameter("sid");
		ISongBiz songBiz = new SongBizImpl();
		String[] song= sid.split(",");
		String[] allSong = new String[song.length];
		int i=0;
		for(String ss:song){
			if(ss!=null&&!"0".equals(ss)){
				allSong[i] = ss;
				i++;
			}
		}
		List<Song> songs = songBiz.findSong(allSong[0]);
		Gson gson = new GsonBuilder().create();
		this.out(resp, gson.toJson(songs));
		if(songs.size()>0){
			HttpSession session = req.getSession();
			session.setAttribute("SongName", songs.get(0).getSname());
			session.setAttribute("SongSaddr", songs.get(0).getSaddr());
			session.setAttribute("SongLongs", songs.get(0).getLongs());
			session.setAttribute("SongSinger", songs.get(0).getSingerName());
			//session.setAttribute("SongPhoto", songs.get(0).getPhoto());
		}
	}

	private void findByClick(HttpServletRequest req, HttpServletResponse resp)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISongBiz songBiz = new SongBizImpl();

		List<Song> songs = songBiz.findByClick();
		Gson gson = new GsonBuilder().create();
		this.out(resp, gson.toJson(songs));
		HttpSession session = req.getSession();
		ISongDao songDao = new SongDaoImpl();
		session.setAttribute("SongSize", songDao.total(null));

	}

	private void findByself(HttpServletRequest req, HttpServletResponse resp)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISongBiz songBiz = new SongBizImpl();

		List<Song> songs = songBiz.findBySelf();
		Gson gson = new GsonBuilder().create();
		this.out(resp, gson.toJson(songs));
	}

	private void addClick(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		String sid = req.getParameter("sid");
		ISongBiz songBiz = new SongBizImpl();
		this.out(resp, songBiz.update(sid));

	}

	private void findAll(HttpServletRequest req, HttpServletResponse resp)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISongBiz songBiz = new SongBizImpl();

		List<Song> songs = songBiz.findAll();
		Gson gson = new GsonBuilder().create();
		this.out(resp, gson.toJson(songs));

	}

	private void findInfo(HttpServletRequest req, HttpServletResponse resp) {
		ISongBiz songBiz = new SongBizImpl();
		this.out(resp, songBiz.find());
	}

	private void search(HttpServletRequest req, HttpServletResponse resp) {
		ISongBiz songBiz = new SongBizImpl();
		String singerId = req.getParameter("singerId");
		String sname = req.getParameter("sname");
		String languages = req.getParameter("languages");
		String style = req.getParameter("style");
		Integer pageNo = Integer.parseInt(req.getParameter("page"));
		Integer pageSize = Integer.parseInt(req.getParameter("rows"));
		this.out(resp, songBiz.find(sname, singerId, languages, style, pageNo, pageSize));

	}

	private void Headsearch(HttpServletRequest req, HttpServletResponse resp) {
		ISongBiz songBiz = new SongBizImpl();
		String singerId = req.getParameter("singerId");
		String sname = req.getParameter("sname");
		String languages = req.getParameter("languages");
		String style = req.getParameter("style");
		Gson gson = new GsonBuilder().create();
		this.out(resp, gson.toJson(songBiz.find(sname, singerId, languages, style, 1, 400)));

	}

	private void updateSong(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISongBiz songBiz = new SongBizImpl();
		FileUploadUtil fileUploadUtil = new FileUploadUtil();
		PageContext pageContext = JspFactory.getDefaultFactory().getPageContext(this, req, resp, null, true, 102400,
				true);
		Song song = null;
		try {
			song = fileUploadUtil.uploadToObject(pageContext, Song.class);
			if (StringUtil.isNull(song.getPhoto())) {// 说明用户没有修改图片，那么则有可能删除了以前的图片也可能没删
				if (StringUtil.isNull(song.getLanguagess())) {// 说明已经删除了原来的图片
					song.setPhoto("");
				} else {
					song.setPhoto(song.getLanguagess());
				}
			}
			if (StringUtil.isNull(song.getSaddr())) {// 说明用户没有修改音乐地址，那么则有可能删除了以前的图片也可能没删
				if (StringUtil.isNull(song.getStyles())) {// 说明已经删除了原来的图片
					song.setSaddr("");
				} else {
					song.setSaddr(song.getStyles());
				}
			}
			if (StringUtil.isNull(song.getLyric())) {// 说明用户没有修改音乐歌词，那么则有可能删除了以前的图片也可能没删
				if (StringUtil.isNull(song.getLyric())) {// 说明已经删除了原来的图片
					song.setLyric("");
				} else {
					song.setLyric(song.getLyric());
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.out(resp, songBiz.update(song));

	}

	private void delSong(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISongBiz songBiz = new SongBizImpl();
		String sid = req.getParameter("sid");
		this.out(resp, songBiz.delete(sid));

	}

	private void addSong(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISongBiz songBiz = new SongBizImpl();
		ISingerBiz singerBiz = new SingerBizImpl();
		FileUploadUtil fileUploadUtil = new FileUploadUtil();
		PageContext pageContext = JspFactory.getDefaultFactory().getPageContext(this, req, resp, null, true, 102400,
				true);
		Song song = null;
		try {
			song = fileUploadUtil.uploadToObject(pageContext, Song.class);
			String path=pageContext.getServletContext().getRealPath("/");
			String filename=path.substring(0,path.lastIndexOf('\\',(path.lastIndexOf("\\")-1)));
			 filename=filename.replace('\\', '/')+"/"+song.getSaddr().substring(song.getSaddr().indexOf('/')+1);
			 MusicUtil musicUtil=new MusicUtil();
			 int time=musicUtil.getDuration(filename);
			 String songLong=musicUtil.secToTime(time);
			 song.setLongs(songLong);
			 System.out.println(song);
			 //判断歌手是否存在啊0表示不存在
			 if(song.getSingerId()==0){
				 Singer singer=new Singer();
				 singer.setSname(song.getSingerName());//歌手名字
				 singer.setStid(1);
				 singerBiz.add(singer);//添加歌手
				Singer sg =singerBiz.findById(null,song.getSingerName());//查找歌手信息
				System.out.println("歌手信息为:"+sg);
				song.setSingerId(sg.getSid());
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
			 this.out(resp, songBiz.add(song));
	}

	private void find(HttpServletRequest req, HttpServletResponse resp) {
		Integer pageNo = Integer.parseInt(req.getParameter("page"));
		Integer pageSize = Integer.parseInt(req.getParameter("rows"));
		ISongBiz songBiz = new SongBizImpl();
		this.out(resp, songBiz.find(null, null, null, null, pageNo, pageSize));
	}
	//查找默认歌单下的歌曲
	private void defaultSong(HttpServletRequest req, HttpServletResponse resp) throws SQLException, Exception {
		ISongBiz songBiz = new SongBizImpl();
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Gson gson=new GsonBuilder().create();
		String ssname = req.getParameter("ssname");//你好啊！
		String ssid = req.getParameter("ssid");
		String usid = req.getParameter("usid");//2
		String[] allSong = null;
		if(ssname!=null||!"".equals(ssname)){
			List<SongSheet> list = songSheetBiz.songSheetSong(ssname,null);//查找出对应的歌单信息
			if(list.size()>0){
				String song = list.get(0).getSong();//获取总的歌单id集合
				String songSheetName = list.get(0).getSsname();//歌单名
				String[] songs = song.split(",");
				 //allSong = new String[songs.length];
				int i = 0;
				for(String ss:songs){
					if(ss==null&&"0".equals(ss)){
						//allSong[i] = ss;
						i++;
					}
				}
				 allSong = new String[songs.length-i];
				 int index = 0;
			    for(String ss:songs){
						if(ss!=null&&!"0".equals(ss)){
							allSong[index] = ss;
							index++;
						}
				}
				System.out.println(songSheetName+",共有歌曲为:"+allSong);
				List<Song> list1 = songBiz.defaultSong(allSong,ssname,usid);
				if(list1.size()>0){
					this.out(resp, gson.toJson(list1));
				}else{
					this.out(resp, gson.toJson(0));
				}
			}else{
				/*List<Song> list1 = songBiz.defaultSong(allSong,ssname,usid);*/
				this.out(resp, gson.toJson(0));
			}
		}
	}
	//根据歌单编号查找信息
	private void findBySid(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ISongBiz songBiz = new SongBizImpl();
		int sid = Integer.parseInt(req.getParameter("sid"));
		Song list = songBiz.findBySid(sid);
		Gson gson = new GsonBuilder().create();
		this.out(resp, gson.toJson(list));
	}

}

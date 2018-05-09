package com.yc.wyyyy.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yc.wyyyy.bean.SongSheet;
import com.yc.wyyyy.bean.StyleInfo;
import com.yc.wyyyy.biz.ISongSheetBiz;
import com.yc.wyyyy.biz.IStyleInfoBiz;
import com.yc.wyyyy.biz.impl.SongSheetBizImpl;
import com.yc.wyyyy.biz.impl.StyleInfoBizImpl;
import com.yc.wyyyy.dao.ISongSheetDao;
import com.yc.wyyyy.dao.Impl.SongSheetDaoImpl;
import com.yc.wyyyy.util.FileUploadUtil;
import com.yc.wyyyy.util.StringUtil;

@WebServlet("/songSheetServlet")
public class SongSheetServlet extends BasicServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String op=req.getParameter("op");
		if("find".equals(op)){
			find(req,resp);
		}else if("addsongSheet".equals(op)){
			try {
				addsongSheet(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("updatesongSheet".equals(op)){
			try {
				updatesongSheet(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("delsongSheet".equals(op)){
			try {
				delsongSheet(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("findMy".equals(op)){
			try {
				findMy(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else if("findSongSheet".equals(op)){
			try {
				findSongSheet(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else if("addSong".equals(op)){
			try {
				addSong(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("addClick".equals(op)){
			try {
				addClick(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("headFind".equals(op)){
			headFind(req,resp);
		}else if("MheadFind".equals(op)){
			MheadFind(req,resp);
		}else if("sendSsid".equals(op)){
			sendSsid(req,resp);
		}else if("search".equals(op)){
			search(req,resp);
		}else if("insertSong".equals(op)){
			try {
				insertSong(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("findSong".equals(op)){
			try {
				findSong(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("songSheetSong".equals(op)){
			try {
				songSheetSong(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("findSongSsname".equals(op)){
			try {
				findSongSsname(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("findDetailSongSheet".equals(op)){
			try {
				findDetailSongSheet(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("findAll".equals(op)){
			try {
				findAllOP(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	//查找所有的歌单
	private void findAllOP(HttpServletRequest req, HttpServletResponse resp) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Integer pageNo=Integer.parseInt(req.getParameter("page"));
		Integer pageSize=Integer.parseInt(req.getParameter("rows"));
		this.out(resp, songSheetBiz.findAll(pageNo, pageSize));
	}

	private void search(HttpServletRequest req, HttpServletResponse resp) {
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Gson gson=new GsonBuilder().create();
		String language=req.getParameter("languages");
		String style=req.getParameter("style");
		String emotion=req.getParameter("emotion");
		String theme=req.getParameter("theme");
		String scene=req.getParameter("scene");
		String sid=req.getParameter("usid");
		int usid = 0;
		if(sid!=null&&!"".equals(sid)){
			usid = Integer.parseInt(sid);
		}
		this.out(resp, gson.toJson(songSheetBiz.find(null, language, style, emotion, theme, scene, 1, 400,usid)));
	}

	private void headFind(HttpServletRequest req, HttpServletResponse resp){
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Gson gson=new GsonBuilder().create();
		String sid=req.getParameter("usid");
		int usid = 1;
		if(sid!=null&&!"".equals(sid)){
			usid = Integer.parseInt(sid);
		}
		this.out(resp, gson.toJson(songSheetBiz.find(1,400,usid)));
	}
	
	private void MheadFind(HttpServletRequest req, HttpServletResponse resp){
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Gson gson=new GsonBuilder().create();
		this.out(resp, gson.toJson(songSheetBiz.Mfind(1,400)));
	}

	private void addClick(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		String ssid=req.getParameter("ssid");
		String usid=req.getParameter("usid");
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		this.out(resp, songSheetBiz.ClickRate(usid, ssid));
	}

	private void addSong(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		String ssname=req.getParameter("ssname").trim();
		String song=req.getParameter("song").trim();
		String photo=req.getParameter("photo").trim();
		String usid = req.getParameter("usid").trim();
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		this.out(resp, songSheetBiz.update(song, ssname,photo,usid));
	}

	private void findSongSheet(HttpServletRequest req, HttpServletResponse resp) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		String ssid=req.getParameter("ssname");
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Gson gson = new GsonBuilder().create();
		List<SongSheet> list = songSheetBiz.findById(ssid);
		this.out(resp, gson.toJson(list));
	}
	private void sendSsid(HttpServletRequest req, HttpServletResponse resp){
		String ssid=req.getParameter("ssid");
		HttpSession session=req.getSession();
		session.setAttribute("ssid", ssid);
		this.out(resp, 1);
	}

	private void findMy(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String usid=req.getParameter("usid");
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		HttpSession session=req.getSession();
		List<SongSheet> songsheet=songSheetBiz.find(usid);//查找用户的所有歌单列表
		for(int i=0;i<songsheet.size();i++){
			SongSheet ssheet = songsheet.get(i);
			String ssname = ssheet.getSsname();//获得歌单名;
			List<SongSheet> list = songSheetBiz.songSheetSong(ssname,usid);//查询某歌单下的歌曲。
			Integer size = 0;//计算出有多少歌曲
			if(list.size()>0){
				String song = list.get(0).getSong();//获得歌曲
				/*String songSheetName = list.get(0).getSsname();*/
				String[] songs = song.split(",");//将歌单编号根据逗号分开，形成一个数组
				for(String ss:songs){
					if(ss!=null&&!"0".equals(ss)&&!"".equals(ss)){
						size+=1;
					}
				}
			}
			ssheet.setSong(size.toString());
		}
		System.out.println("我的音乐中的歌单信息为:"+songsheet);
		Gson gson = new Gson();
		int sheetsize=songSheetBiz.total(usid);
		session.setAttribute("currentSongSheetSize", sheetsize);
		session.setAttribute("currentSongSheet", songsheet);
		System.out.println(songsheet);
		this.out(resp,gson.toJson(songsheet));
	}

	private void delsongSheet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		String ssid=req.getParameter("ssid");
		String usid=req.getParameter("usid");
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		this.out(resp, songSheetBiz.delete(usid, ssid));
		HttpSession session=req.getSession();
		List<SongSheet> songsheet=songSheetBiz.find(usid);
		int sheetsize=songSheetBiz.total(usid);
		session.setAttribute("currentSongSheetSize", sheetsize);
		session.setAttribute("currentSongSheet", songsheet);
	}

	private void updatesongSheet(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		FileUploadUtil fileUploadUtil=new FileUploadUtil();
		PageContext pageContext=JspFactory.getDefaultFactory().getPageContext(this, req, resp, null, true, 1024, true);
		SongSheet songSheet=null;
		try {
			songSheet=fileUploadUtil.uploadToObject(pageContext, SongSheet.class);
			
			if(StringUtil.isNull(songSheet.getPhoto())){//说明用户没有修改图片，那么则有可能删除了以前的图片也可能没删
				
				songSheet.setPhoto(songSheet.getLanguagess());
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		this.out(resp, songSheetBiz.update(songSheet));
	}

	private void addsongSheet(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String usid=req.getParameter("usid");
		String ssname=req.getParameter("ssname").trim();
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		HttpSession session=req.getSession();
		List<SongSheet> songsheet=songSheetBiz.find(usid);
		int sheetsize=songSheetBiz.total(usid);
		session.setAttribute("currentSongSheetSize", sheetsize);
		session.setAttribute("currentSongSheet", songsheet);
		List<SongSheet> list =songSheetBiz.songSheetSong(ssname,usid);
		if(list.size()>0){
			this.out(resp,0);
		}else{
			this.out(resp, songSheetBiz.add(ssname, usid));
		}
	}

	private void find(HttpServletRequest req, HttpServletResponse resp) {
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Integer pageNo=Integer.parseInt(req.getParameter("page"));
		Integer pageSize=Integer.parseInt(req.getParameter("rows"));
		String sid=req.getParameter("usid");
		int usid = 0;
		if(sid!=null&&!"".equals(sid)){
			usid = Integer.parseInt(sid);
		}
		this.out(resp, songSheetBiz.find(pageNo, pageSize,usid));
	}
	//将歌曲添加到歌单中
	private void insertSong(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		String addr=req.getParameter("addr");
		Integer song = songSheetBiz.insertSong(addr);
		this.out(resp, song);
	}

	//找寻默认歌单下是否存在该歌曲
	private void findSong(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		String addr = req.getParameter("addr");
		this.out(resp, songSheetBiz.findSong(addr));
	}
	//歌单下的歌曲
	private void songSheetSong(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Gson gson=new GsonBuilder().create();
		String ssname = req.getParameter("ssname");
		String usid = req.getParameter("usid");
		List<SongSheet> list = songSheetBiz.songSheetSong(ssname,usid);
		if(list.size()>0){
			String song = list.get(0).getSong();
			String songSheetName = list.get(0).getSsname();
			String[] songs = song.split(",");
			int size = 0;
			for(String ss:songs){
				if(ss!=null&&!"0".equals(ss)&&!"".equals(ss)){
					size+=1;
				}
			}
			System.out.println(songSheetName+",共有歌曲为:"+size);
			this.out(resp,gson.toJson(size));
		}else{
			this.out(resp, gson.toJson(0));
		}
	}
	//根据ssid查找歌单
	private void findSongSsname(HttpServletRequest req, HttpServletResponse resp) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		Gson gson=new GsonBuilder().create();
		String ssid = req.getParameter("ssid");
		List<SongSheet> list = songSheetBiz.findSongSsname(ssid);
		this.out(resp, gson.toJson(list.get(0)));
	}
	
	//查找具体的歌单信息，用于后台显示
	private void findDetailSongSheet(HttpServletRequest req, HttpServletResponse resp) {
		ISongSheetBiz songSheetBiz=new SongSheetBizImpl();
		ISongSheetDao songSheetDao = new SongSheetDaoImpl();
		IStyleInfoBiz styleInfoBiz = new StyleInfoBizImpl();
		Integer pageNo=Integer.parseInt(req.getParameter("page"));
		Integer pageSize=Integer.parseInt(req.getParameter("rows"));
		int usid = 0;
		List<SongSheet> list =songSheetDao.find(pageNo, pageSize,usid);//查询所有的歌单信息
		for(int i = 0;i<list.size();i++){
			String emotion = list.get(i).getEmotions();//获得情感编号
			Integer language = list.get(i).getLanguages();//获得语种编号
			String  theme = list.get(i).getTheme().toString();//获得主题编号
			String scenes = list.get(i).getScenes();//获得场景编号
			String style = list.get(i).getStyles();//获得风格编号
		}
		/*for(Map.Entry<String, Object> entry:map.entrySet()){
			String key= entry.getKey().toString();//获得键名,languages,style...
			Object value= entry.getValue().toString();//获得键值
			if("rows".equals(key)){
				List list = (List) value;
				SongSheet style = (SongSheet) list.get(0);
				List<StyleInfo> styleInfo = styleInfoBiz.find(null, );//查找对应歌曲风格的名称
				String name = styleInfo.get(0).getSname();//歌曲类型名
				for(int i = 0;i<list.size();i++){
					StyleInfo style = list.ge
					if("languages".equals(key)||"style".equals(key)||"scene".equals(key)||"emotion".equals(key)||"theme".equals(key)){
						List<StyleInfo> styleInfo = styleInfoBiz.find(null, key);//查找对应歌曲风格的名称
						String name = styleInfo.get(0).getSname();//歌曲类型名
						map.put(key, name);
					}
				}
			}
		}*/
		System.out.println("歌单信息为:"+list);
		this.out(resp, list);
	}
}

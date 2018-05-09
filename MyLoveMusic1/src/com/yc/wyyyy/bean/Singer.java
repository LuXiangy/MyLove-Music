package com.yc.wyyyy.bean;

import java.io.Serializable;

public class Singer implements Serializable{

	private static final long serialVersionUID = -3685292300654496161L;
	private Integer sid;
	private String sname;
	private Integer stid;//歌手类型
	private String photo;
	private Integer clickRate;//点击率
	private Integer status;
	
	private String stname;//歌手类型名
	
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	@Override
	public String toString() {
		return "Singer [sid=" + sid + ", sname=" + sname + ", stid=" + stid + ", photo=" + photo + ", clickRate="
				+ clickRate + ", status=" + status + ", stname=" + stname + "]";
	}
	
	public Singer(Integer sid, String sname, Integer stid, String photo, Integer clickRate, Integer status,
			String stname) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.stid = stid;
		this.photo = photo;
		this.clickRate = clickRate;
		this.status = status;
		this.stname = stname;
	}
	public Singer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Integer getStid() {
		return stid;
	}
	public void setStid(Integer stid) {
		this.stid = stid;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Integer getClickRate() {
		return clickRate;
	}
	public void setClickRate(Integer clickRate) {
		this.clickRate = clickRate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

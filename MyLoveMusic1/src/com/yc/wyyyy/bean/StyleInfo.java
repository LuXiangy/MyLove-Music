package com.yc.wyyyy.bean;

import java.io.Serializable;

public class StyleInfo implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer sid;
	private String sname;
	private Integer flag;//1.语种  2.风格  3.场景  4.情感  5.主题 
	private String mark;
	private Integer status;
	@Override
	public String toString() {
		return "StyleInfo [sid=" + sid + ", sname=" + sname + ", flag=" + flag + ", mark=" + mark + ", status=" + status
				+ "]";
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
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public StyleInfo(Integer sid, String sname, Integer flag, String mark, Integer status) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.flag = flag;
		this.mark = mark;
		this.status = status;
	}
	public StyleInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((flag == null) ? 0 : flag.hashCode());
		result = prime * result + ((mark == null) ? 0 : mark.hashCode());
		result = prime * result + ((sid == null) ? 0 : sid.hashCode());
		result = prime * result + ((sname == null) ? 0 : sname.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StyleInfo other = (StyleInfo) obj;
		if (flag == null) {
			if (other.flag != null)
				return false;
		} else if (!flag.equals(other.flag))
			return false;
		if (mark == null) {
			if (other.mark != null)
				return false;
		} else if (!mark.equals(other.mark))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		if (sname == null) {
			if (other.sname != null)
				return false;
		} else if (!sname.equals(other.sname))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

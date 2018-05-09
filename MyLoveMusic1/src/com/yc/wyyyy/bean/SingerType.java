package com.yc.wyyyy.bean;

import java.io.Serializable;

public class SingerType implements Serializable{

	private static final long serialVersionUID = 3003087286915206842L;
	private Integer sid;
	private String sname;
	private Integer status;
	@Override
	public String toString() {
		return "SingerType [sid=" + sid + ", sname=" + sname + ", status=" + status + "]";
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public SingerType(Integer sid, String sname, Integer status) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.status = status;
	}
	public SingerType() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		SingerType other = (SingerType) obj;
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

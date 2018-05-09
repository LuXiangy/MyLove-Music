package com.yc.wyyyy.bean;

import java.io.Serializable;

public class UserInfo implements Serializable{

	private static final long serialVersionUID = 3078469310943870252L;
	private Integer usid;
	private String uname;
	private String email;
	private String tel;
	private String pwd;
	private Integer integral;//积分
	private String photo;
	private String sex;
	private String birth;
	private String province;
	private String city;
	private String follow;//关注
	private String songSheet;//歌单
	private Integer status;
	private String mark;//备用字段
	@Override
	public String toString() {
		return "UserInfo [usid=" + usid + ", uname=" + uname + ", email=" + email + ", tel=" + tel + ", pwd=" + pwd
				+ ", integral=" + integral + ", photo=" + photo + ", sex=" + sex + ", birth=" + birth + ", province="
				+ province + ", city=" + city + ", follow=" + follow + ", songSheet=" + songSheet + ", status=" + status
				+ ", mark=" + mark + "]";
	}
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Integer getIntegral() {
		return integral;
	}
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getFollow() {
		return follow;
	}
	public void setFollow(String follow) {
		this.follow = follow;
	}
	public String getSongSheet() {
		return songSheet;
	}
	public void setSongSheet(String songSheet) {
		this.songSheet = songSheet;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public UserInfo(Integer usid, String uname, String email, String tel, String pwd, Integer integral, String photo,
			String sex, String birth, String province, String city, String follow, String songSheet, Integer status,
			String mark) {
		super();
		this.usid = usid;
		this.uname = uname;
		this.email = email;
		this.tel = tel;
		this.pwd = pwd;
		this.integral = integral;
		this.photo = photo;
		this.sex = sex;
		this.birth = birth;
		this.province = province;
		this.city = city;
		this.follow = follow;
		this.songSheet = songSheet;
		this.status = status;
		this.mark = mark;
	}
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((follow == null) ? 0 : follow.hashCode());
		result = prime * result + ((integral == null) ? 0 : integral.hashCode());
		result = prime * result + ((mark == null) ? 0 : mark.hashCode());
		result = prime * result + ((photo == null) ? 0 : photo.hashCode());
		result = prime * result + ((province == null) ? 0 : province.hashCode());
		result = prime * result + ((pwd == null) ? 0 : pwd.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((songSheet == null) ? 0 : songSheet.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((tel == null) ? 0 : tel.hashCode());
		result = prime * result + ((uname == null) ? 0 : uname.hashCode());
		result = prime * result + ((usid == null) ? 0 : usid.hashCode());
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
		UserInfo other = (UserInfo) obj;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (follow == null) {
			if (other.follow != null)
				return false;
		} else if (!follow.equals(other.follow))
			return false;
		if (integral == null) {
			if (other.integral != null)
				return false;
		} else if (!integral.equals(other.integral))
			return false;
		if (mark == null) {
			if (other.mark != null)
				return false;
		} else if (!mark.equals(other.mark))
			return false;
		if (photo == null) {
			if (other.photo != null)
				return false;
		} else if (!photo.equals(other.photo))
			return false;
		if (province == null) {
			if (other.province != null)
				return false;
		} else if (!province.equals(other.province))
			return false;
		if (pwd == null) {
			if (other.pwd != null)
				return false;
		} else if (!pwd.equals(other.pwd))
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		if (songSheet == null) {
			if (other.songSheet != null)
				return false;
		} else if (!songSheet.equals(other.songSheet))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		if (uname == null) {
			if (other.uname != null)
				return false;
		} else if (!uname.equals(other.uname))
			return false;
		if (usid == null) {
			if (other.usid != null)
				return false;
		} else if (!usid.equals(other.usid))
			return false;
		return true;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

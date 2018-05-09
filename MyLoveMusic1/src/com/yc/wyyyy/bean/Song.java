package com.yc.wyyyy.bean;

import java.io.Serializable;

public class Song implements Serializable{

	private static final long serialVersionUID = 4984936144486866898L;
	private Integer sid;
	private String sname;
	private Integer singerId;
	private String saddr;//歌曲地址
	private String lyric;//歌词
	private Integer clickRate;//点击率
	private String longs;//时长
	private Integer languages=0;//语种
	private Integer style=0;//风格
	private String photo;
	private Integer status;
	
	private String singerName;
	private String languagess;
	private String styles;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
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
	public Integer getSingerId() {
		return singerId;
	}
	public void setSingerId(Integer singerId) {
		this.singerId = singerId;
	}
	public String getSaddr() {
		return saddr;
	}
	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}
	public String getLyric() {
		return lyric;
	}
	public void setLyric(String lyric) {
		this.lyric = lyric;
	}
	public Integer getClickRate() {
		return clickRate;
	}
	public void setClickRate(Integer clickRate) {
		this.clickRate = clickRate;
	}
	public String getLongs() {
		return longs;
	}
	public void setLongs(String longs) {
		this.longs = longs;
	}
	public Integer getLanguages() {
		return languages;
	}
	public void setLanguages(Integer languages) {
		this.languages = languages;
	}
	public Integer getStyle() {
		return style;
	}
	public void setStyle(Integer style) {
		this.style = style;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getSingerName() {
		return singerName;
	}
	public void setSingerName(String singerName) {
		this.singerName = singerName;
	}
	public String getLanguagess() {
		return languagess;
	}
	public void setLanguagess(String languagess) {
		this.languagess = languagess;
	}
	public String getStyles() {
		return styles;
	}
	public void setStyles(String styles) {
		this.styles = styles;
	}
	public Song(Integer sid, String sname, Integer singerId, String saddr, String lyric, Integer clickRate,
			String longs, Integer languages, Integer style, String photo, Integer status, String singerName,
			String languagess, String styles) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.singerId = singerId;
		this.saddr = saddr;
		this.lyric = lyric;
		this.clickRate = clickRate;
		this.longs = longs;
		this.languages = languages;
		this.style = style;
		this.photo = photo;
		this.status = status;
		this.singerName = singerName;
		this.languagess = languagess;
		this.styles = styles;
	}
	public Song() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Song [sid=" + sid + ", sname=" + sname + ", singerId=" + singerId + ", saddr=" + saddr + ", lyric="
				+ lyric + ", clickRate=" + clickRate + ", longs=" + longs + ", languages=" + languages + ", style="
				+ style + ", photo=" + photo + ", status=" + status + ", singerName=" + singerName + ", languagess="
				+ languagess + ", styles=" + styles + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((clickRate == null) ? 0 : clickRate.hashCode());
		result = prime * result + ((languages == null) ? 0 : languages.hashCode());
		result = prime * result + ((longs == null) ? 0 : longs.hashCode());
		result = prime * result + ((lyric == null) ? 0 : lyric.hashCode());
		result = prime * result + ((photo == null) ? 0 : photo.hashCode());
		result = prime * result + ((saddr == null) ? 0 : saddr.hashCode());
		result = prime * result + ((sid == null) ? 0 : sid.hashCode());
		result = prime * result + ((singerId == null) ? 0 : singerId.hashCode());
		result = prime * result + ((sname == null) ? 0 : sname.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((style == null) ? 0 : style.hashCode());
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
		Song other = (Song) obj;
		if (clickRate == null) {
			if (other.clickRate != null)
				return false;
		} else if (!clickRate.equals(other.clickRate))
			return false;
		if (languages == null) {
			if (other.languages != null)
				return false;
		} else if (!languages.equals(other.languages))
			return false;
		if (longs == null) {
			if (other.longs != null)
				return false;
		} else if (!longs.equals(other.longs))
			return false;
		if (lyric == null) {
			if (other.lyric != null)
				return false;
		} else if (!lyric.equals(other.lyric))
			return false;
		if (photo == null) {
			if (other.photo != null)
				return false;
		} else if (!photo.equals(other.photo))
			return false;
		if (saddr == null) {
			if (other.saddr != null)
				return false;
		} else if (!saddr.equals(other.saddr))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		if (singerId == null) {
			if (other.singerId != null)
				return false;
		} else if (!singerId.equals(other.singerId))
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
		if (style == null) {
			if (other.style != null)
				return false;
		} else if (!style.equals(other.style))
			return false;
		return true;
	}
	
	
}

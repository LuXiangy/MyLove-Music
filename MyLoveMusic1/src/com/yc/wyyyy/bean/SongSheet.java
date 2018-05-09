package com.yc.wyyyy.bean;

import java.io.Serializable;

public class SongSheet implements Serializable{

	private static final long serialVersionUID = 646778792007207476L;
	private Integer ssid;
	private String ssname;//歌单名
	private Integer usid;//会员编号
	private String song;//歌单下的歌曲
	private Integer languages;//语种
	private Integer style;//风格
	private Integer scene;//场景
	private Integer emotion;//情感
	private Integer theme;//主题
	private Integer clickRate;//点击率
	private String photo;
	private Integer status;
	
	private String languagess;//语种
	private String styles;//风格
	private String scenes;//场景
	private String emotions;//情感
	private String themes;//主题
	private String uname;
	
	public Integer getSsid() {
		return ssid;
	}
	public void setSsid(Integer ssid) {
		this.ssid = ssid;
	}
	public String getSsname() {
		return ssname;
	}
	public void setSsname(String ssname) {
		this.ssname = ssname;
	}
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public String getSong() {
		return song;
	}
	public void setSong(String song) {
		this.song = song;
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
	public Integer getScene() {
		return scene;
	}
	public void setScene(Integer scene) {
		this.scene = scene;
	}
	public Integer getEmotion() {
		return emotion;
	}
	public void setEmotion(Integer emotion) {
		this.emotion = emotion;
	}
	public Integer getTheme() {
		return theme;
	}
	public void setTheme(Integer theme) {
		this.theme = theme;
	}
	public Integer getClickRate() {
		return clickRate;
	}
	public void setClickRate(Integer clickRate) {
		this.clickRate = clickRate;
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
	public String getScenes() {
		return scenes;
	}
	public void setScenes(String scenes) {
		this.scenes = scenes;
	}
	public String getEmotions() {
		return emotions;
	}
	public void setEmotions(String emotions) {
		this.emotions = emotions;
	}
	public String getThemes() {
		return themes;
	}
	public void setThemes(String themes) {
		this.themes = themes;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	@Override
	public String toString() {
		return "SongSheet [ssid=" + ssid + ", ssname=" + ssname + ", usid="
				+ usid + ", song=" + song + ", languages=" + languages
				+ ", style=" + style + ", scene=" + scene + ", emotion="
				+ emotion + ", theme=" + theme + ", clickRate=" + clickRate
				+ ", photo=" + photo + ", status=" + status + ", languagess="
				+ languagess + ", styles=" + styles + ", scenes=" + scenes
				+ ", emotions=" + emotions + ", themes=" + themes + ", uname="
				+ uname + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((clickRate == null) ? 0 : clickRate.hashCode());
		result = prime * result + ((emotion == null) ? 0 : emotion.hashCode());
		result = prime * result + ((languages == null) ? 0 : languages.hashCode());
		result = prime * result + ((photo == null) ? 0 : photo.hashCode());
		result = prime * result + ((scene == null) ? 0 : scene.hashCode());
		result = prime * result + ((song == null) ? 0 : song.hashCode());
		result = prime * result + ((ssid == null) ? 0 : ssid.hashCode());
		result = prime * result + ((ssname == null) ? 0 : ssname.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((style == null) ? 0 : style.hashCode());
		result = prime * result + ((theme == null) ? 0 : theme.hashCode());
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
		SongSheet other = (SongSheet) obj;
		if (clickRate == null) {
			if (other.clickRate != null)
				return false;
		} else if (!clickRate.equals(other.clickRate))
			return false;
		if (emotion == null) {
			if (other.emotion != null)
				return false;
		} else if (!emotion.equals(other.emotion))
			return false;
		if (languages == null) {
			if (other.languages != null)
				return false;
		} else if (!languages.equals(other.languages))
			return false;
		if (photo == null) {
			if (other.photo != null)
				return false;
		} else if (!photo.equals(other.photo))
			return false;
		if (scene == null) {
			if (other.scene != null)
				return false;
		} else if (!scene.equals(other.scene))
			return false;
		if (song == null) {
			if (other.song != null)
				return false;
		} else if (!song.equals(other.song))
			return false;
		if (ssid == null) {
			if (other.ssid != null)
				return false;
		} else if (!ssid.equals(other.ssid))
			return false;
		if (ssname == null) {
			if (other.ssname != null)
				return false;
		} else if (!ssname.equals(other.ssname))
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
		if (theme == null) {
			if (other.theme != null)
				return false;
		} else if (!theme.equals(other.theme))
			return false;
		if (usid == null) {
			if (other.usid != null)
				return false;
		} else if (!usid.equals(other.usid))
			return false;
		return true;
	}
	
	public SongSheet(Integer ssid, String ssname, Integer usid, String song, Integer languages, Integer style,
			Integer scene, Integer emotion, Integer theme, Integer clickRate, String photo, Integer status,
			String languagess, String styles, String scenes, String emotions, String themes, String uname) {
		super();
		this.ssid = ssid;
		this.ssname = ssname;
		this.usid = usid;
		this.song = song;
		this.languages = languages;
		this.style = style;
		this.scene = scene;
		this.emotion = emotion;
		this.theme = theme;
		this.clickRate = clickRate;
		this.photo = photo;
		this.status = status;
		this.languagess = languagess;
		this.styles = styles;
		this.scenes = scenes;
		this.emotions = emotions;
		this.themes = themes;
		this.uname = uname;
	}
	public SongSheet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}

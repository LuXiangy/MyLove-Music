package com.yc.wyyyy.util;
/**
* @author 作者:LYH
* @createDate 创建时间：2018年3月20日 下午4:33:07
*/

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;

import javazoom.jl.player.Player;

public class MusicUtil {
	 
	    public static int getDuration(String position) {//获取歌曲时长
	        int length = 0;
	        try {
	            MP3File mp3File = (MP3File) AudioFileIO.read(new File(position));
	            MP3AudioHeader audioHeader = (MP3AudioHeader) mp3File.getAudioHeader();

	            // 单位为秒
	            length = audioHeader.getTrackLength();
	       

	            return length;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return length;
	    }
	    
	    public static String secToTime(int time) {//将秒数变成歌曲播放样式
	        String timeStr = null;
	        int hour = 0;
	        int minute = 0;
	        int second = 0;
	        if (time <= 0)
	            return "00:00";
	        else {
	            minute = time / 60;
	            if (minute < 60) {
	                second = time % 60;
	                timeStr = unitFormat(minute) + ":" + unitFormat(second);
	            } else {
	                hour = minute / 60;
	                if (hour > 99)
	                    return "99:59:59";
	                minute = minute % 60;
	                second = time - hour * 3600 - minute * 60;
	                timeStr = unitFormat(hour) + ":" + unitFormat(minute) + ":" + unitFormat(second);
	            }
	        }
	        return timeStr;
	    }
	    public static String unitFormat(int i) {
	        String retStr = null;
	        if (i >= 0 && i < 10)
	            retStr = "0" + Integer.toString(i);
	        else
	            retStr = "" + i;
	        return retStr;
	    }
	    
	    
	    public static void main(String[] args) {
	    	//D:\JAVA\apache-tomcat-8.0.44\webapps\fileUploadPath
	        String position = "D:/JAVA/apache-tomcat-8.0.44/webapps/fileUploadPath/1521718773212_2930.mp3";//D:\陈奕迅 - 单车.mp3
	        System.out.println(getDuration(position));
	        getDuration(position);
	        String asd = secToTime(getDuration(position));
	        System.out.println(asd);
	       /* play(position);*/
	}
}

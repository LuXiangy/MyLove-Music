package com.yc.wyyyy.util;



import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 图片水印
 * @author navy
 */
public class ImageWaterMarkUtil {
	public static String realPath; //服务器的绝对路径
	public static String uploadPath; //图片上传后的相对服务器路径
	public static String logoPath; //水印图片路径
	private static int waterImageWidth=0; //水印图片的宽度
	private static int waterImageHeight=0; //水印图片高度
	private static Image imageLogo; //水印图片
	
	/**
	 * 获取水印图片信息
	 */
	public static void init(){
		try {
			//(1)获取水印图片
			File logo=new File(logoPath);
			//(2)获取水印图片的大小
			imageLogo=ImageIO.read(logo);
			waterImageWidth=imageLogo.getWidth(null);
			waterImageHeight=imageLogo.getHeight(null);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 给指定的图片添加水印
	 * @param picPath 要添加水印的图片的绝对路径
	 * @param fileName 要添加水印的图片的文件名
	 * @return 添加水印后的图片路径
	 */
	public static String waterMarkImage(String picPath,String fileName){
		FileOutputStream fos=null;
		try {
			File pic=new File(picPath);
			Image image=ImageIO.read(pic); //获取要添加水印的图片信息
			int width=image.getWidth(null);//获取要添加水印的图片的宽度
			int height=image.getHeight(null);//获取要添加水印的图片的高度
			
			//1.创建一个图片缓存对象  对宽度  高度和颜色进行设置和调整  
			BufferedImage bufferedImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
			
			//2.创建java绘图工具对象
			Graphics2D gp=bufferedImage.createGraphics();
			
			//3.使用绘图工具对象将原图绘制到缓冲图片区
			gp.drawImage(image,0,0,width,height,null);
			
			//4.设置水印图片的透明图
			gp.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,(float)0.8));
			
			//5.计算水印图片的位置
			int x=width-waterImageWidth;
			int y=height-waterImageHeight;
					
			//6.绘制水印图片
			gp.drawImage(imageLogo,x,y,null);
			
			//7.释放工具
			gp.dispose();
			
			//8.将图片写入到指定的文件中
			fileName="YC_"+fileName;
			fos=new FileOutputStream(realPath+"/"+fileName);
			JPEGImageEncoder jie=JPEGCodec.createJPEGEncoder(fos);
			jie.encode(bufferedImage);
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			if(fos!=null){
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		//返回添加水印的图片在服务器中的路径
		return uploadPath+"/"+fileName;
	}
}

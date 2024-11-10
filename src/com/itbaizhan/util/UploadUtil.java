package com.itbaizhan.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

/**
 * 上传工具类
 */
public class UploadUtil {
	

	/**
	 * 图片上传
	 * @return 返回相对路径
	 * @param photo 图片文件
	 * @param photoFileName 文件名
	 * @param savePath 文件保存路径(相对于web根目录)
	 * @return
	 */
	public static String fileUpload(File photo, String photoFileName, String savePath){
		if (photo == null) {
			return null;
		} // 如果上传图片不为空则进行上传图片操作
		// 文件存储路径
		String path = ServletActionContext.getServletContext().getRealPath("/")+savePath;			
		// 获取当前文件类型
		String type = photoFileName.substring(photoFileName.lastIndexOf(".")+1, photoFileName.length());
        // 获取当前系统时间字符串
		String time = new SimpleDateFormat("yyMMddssSSS").format(new Date());
		// 构建新文件名
		String newFileName = time+"."+type;
		// 按指定路径重命名构建文件
		File savefile = new File(path,newFileName);
		// 若保存文件的文件夹不存在则创建
		if(!savefile.getParentFile().exists()){
			savefile.getParentFile().mkdirs();
		}
		System.err.println("上传文件绝对路径: "+savefile.getPath());
		try {// 将上传文件的内容复制到新建文件中
			FileUtils.copyFile(photo, savefile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return savePath+"/"+newFileName;
	}

}

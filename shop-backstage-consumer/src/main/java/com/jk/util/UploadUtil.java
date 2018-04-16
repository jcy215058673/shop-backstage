package com.jk.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadUtil {

	/**
	 * downFile(下载)   
	 * param imgname   要下载的文件名
	 * param request   
	 * return
	 * </pre>
	 */
	public static ResponseEntity<byte[]> downFile(String imgname, HttpServletRequest request) {

		// 获得绝对路径
		String relPath = request.getSession().getServletContext().getRealPath("")+ "/" + imgname;

		// 设置下载的响应信息
		HttpHeaders httpHeaders = new HttpHeaders();

		// 设置下载的文件类型
		httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		// 设置下的文件名
		httpHeaders.setContentDispositionFormData("attachment", imgname);

		// 将文件转为 二进制数组
		byte[] fileByte = null;
		try {
			fileByte = FileUtils.readFileToByteArray(new File(relPath));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ResponseEntity<byte[]>(fileByte, httpHeaders, HttpStatus.CREATED);
	}

	/**
	 * upload(上传方法)   
	 * request 对象
	 * image 二进制文件流
	 * folder 放置文件的文件夹
	 */
	public static String upload(HttpServletRequest request, CommonsMultipartFile image,String folder) {

		// 获得原始文件名
		String oldFileName = image.getOriginalFilename();

		// 重命名 解决同名覆盖问题
		// 1.获得当前的时间戳
		String currentTimeMillis = System.currentTimeMillis() + "";
		
		// 2.使用UUID
		String aaa = UUID.randomUUID() + "";
		// 获得原文件名的后缀名
		int start = oldFileName.lastIndexOf(".");

		String suffix = oldFileName.substring(start);

		// 新文件名
		String newFileName = currentTimeMillis + suffix;

		// 转存
		// 获得项目的绝对路径
		String realPath = request.getSession().getServletContext().getRealPath("/");

		File file = new File(realPath + "/" + folder);
		// 如果upload文件夹不存在 则创建
		if (!file.exists()) {
			file.mkdirs();
		}

		// 转存
		try {
			image.transferTo(new File(file + "//" + newFileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return folder+"/" +newFileName;
	}

}

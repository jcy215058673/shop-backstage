/** 
 * <pre>项目名称:ssh-day02-car 
 * 文件名称:WriteUntil.java 
 * 包名:com.jk.until 
 * 创建日期:2017年10月20日下午3:44:28 
 * Copyright (c) 2017, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;


/** 
 * <pre>项目名称：ssh-day02-car    
 * 类名称：WriteUntil    
 * 类描述：    
 * 创建人：王卫娟cht_java@126.com    
 * 创建时间：2017年10月20日 下午3:44:28    
 * 修改人：王卫娟 cht_java@126.com  
 * 修改时间：2017年10月20日 下午3:44:28    
 * 修改备注：       
 * @version </pre>    
 */
public class WriteUntil {

	public static void responseWrite(HttpServletResponse response,String jsonStr){
		
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer =null;
			try {
				writer = response.getWriter();
				writer.write(jsonStr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(writer!=null){
					writer.flush();
					writer.close();
				}
			}
	}
}

/** 
 * <pre>项目名称:ssm-01 
 * 文件名称:JsonUtil.java 
 * 包名:common.util 
 * 创建日期:2017年10月19日上午10:06:25 
 * Copyright (c) 2017, chenjh@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/** 
 * <pre>项目名称：ssm-01    
 * 类名称：JsonUtil    
 * 类描述：    
 * 创建人：陈教授 chenjh@gmail.com    
 * 创建时间：2017年10月19日 上午10:06:25    
 * 修改人：陈教授 chenjh@gmail.com     
 * 修改时间：2017年10月19日 上午10:06:25    
 * 修改备注：       
 * @version </pre>    
 */
public class JsonUtil {
	
	public static void outJsonStr(HttpServletResponse response, String json) {
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			writer.write(json);
			writer.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (null != writer) {
				writer.close();
				writer = null;
			}
		}
	}

}

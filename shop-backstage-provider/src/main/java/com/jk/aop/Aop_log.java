package com.jk.aop;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jk.model.LogP;

public class Aop_log implements MethodBeforeAdvice, AfterReturningAdvice {

	@Autowired
	private MongoTemplate mongoTemplate;
//	后置通知执行的方法
	public void afterReturning(Object returnval, Method method, Object[] params, Object implurl) throws Throwable {
		System.out.println("后置通知");
		LogP logobj = new LogP();
		if(returnval!=null){
			logobj.setReturnval(returnval.toString());
		}else{
			logobj.setReturnval(null);
		}
		logobj.setMethod(method.getName().toString());
		String paramStr = "";
		for (int i = 0; i < params.length; i++) {
			paramStr += params[i].toString()+",";
		}
		logobj.setParamVal(paramStr);
		logobj.setImplUrl(implurl.toString());
		SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		logobj.setMondate(fmt.format(new Date()));
		mongoTemplate.insert(logobj);
		System.out.println(1);
	}

	public void before(Method arg0, Object[] arg1, Object arg2)
			throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("前置通知");
	}

}

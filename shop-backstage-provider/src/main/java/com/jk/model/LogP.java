package com.jk.model;

import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Document(collection="logP")
public class LogP implements Serializable{
	private static final long serialVersionUID = -60870429256605574L;
	private Object returnval;//返回值
	private String method;//方法名
	private Object paramVal;//参数
	private String implUrl;//类路径
	private String mondate;
	
	//业务字段
	private String qidate;
	private String enddate;

	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}

	public String getImplUrl() {
		return implUrl;
	}
	public void setImplUrl(String implUrl) {
		this.implUrl = implUrl;
	}

	public String getMondate() {
		return mondate;
	}
	public void setMondate(String mondate) {
		this.mondate = mondate;
	}
	public String getQidate() {
		return qidate;
	}
	public void setQidate(String qidate) {
		this.qidate = qidate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public Object getReturnval() {
		return returnval;
	}
	public void setReturnval(Object returnval) {
		this.returnval = returnval;
	}
	public Object getParamVal() {
		return paramVal;
	}
	public void setParamVal(Object paramVal) {
		this.paramVal = paramVal;
	}

	
}

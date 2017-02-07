/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 网站列表Entity
 * @author 李川
 * @version 2017-01-06
 */
public class Counts extends DataEntity<Counts> {
	
	private static final long serialVersionUID = 1L;
	private String siteid;		// 站点
	private String ip;		// IP
	private Date time;		// 时间
	private String url;		// 地址
	private String xRealIp;		// 用户IP
	private String userAgent;		// 浏览器
	private Date beginTime;		// 开始 时间
	private Date endTime;		// 结束 时间
	
	public Counts() {
		super();
	}

	public Counts(String id){
		super(id);
	}

	@Length(min=0, max=50, message="站点长度必须介于 0 和 50 之间")
	public String getSiteid() {
		return siteid;
	}

	public void setSiteid(String siteid) {
		this.siteid = siteid;
	}
	
	@Length(min=0, max=20, message="IP长度必须介于 0 和 20 之间")
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	@Length(min=0, max=200, message="地址长度必须介于 0 和 200 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=50, message="用户IP长度必须介于 0 和 50 之间")
	public String getXRealIp() {
		return xRealIp;
	}

	public void setXRealIp(String xRealIp) {
		this.xRealIp = xRealIp;
	}
	
	@Length(min=0, max=200, message="浏览器长度必须介于 0 和 200 之间")
	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	
	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
		
}
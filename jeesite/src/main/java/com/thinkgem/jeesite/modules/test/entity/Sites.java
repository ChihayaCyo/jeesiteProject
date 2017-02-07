/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 站点管理Entity
 * @author 李川
 * @version 2017-01-06
 */
public class Sites extends DataEntity<Sites> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String domian;		// 域名
	
	public Sites() {
		super();
	}

	public Sites(String id){
		super(id);
	}

	@Length(min=0, max=100, message="名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=500, message="域名长度必须介于 0 和 500 之间")
	public String getDomian() {
		return domian;
	}

	public void setDomian(String domian) {
		this.domian = domian;
	}
	
}
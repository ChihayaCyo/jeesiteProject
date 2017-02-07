/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 按关键字查询网址Entity
 * @author 张航
 * @version 2017-01-12
 */
public class SiteOverview extends DataEntity<SiteOverview> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// name
	
	public SiteOverview() {
		super();
	}

	public SiteOverview(String id){
		super(id);
	}

	@Length(min=0, max=20, message="name长度必须介于 0 和 20 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
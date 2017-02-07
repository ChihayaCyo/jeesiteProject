/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 地域分布Entity
 * @author 张航
 * @version 2017-01-17
 */
public class GeoDistribution extends DataEntity<GeoDistribution> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// name
	
	public GeoDistribution() {
		super();
	}

	public GeoDistribution(String id){
		super(id);
	}

	@Length(min=0, max=50, message="name长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
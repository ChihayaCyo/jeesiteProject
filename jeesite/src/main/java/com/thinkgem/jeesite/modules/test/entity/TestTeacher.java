/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 添加教师信息Entity
 * @author 李
 * @version 2017-01-05
 */
public class TestTeacher extends DataEntity<TestTeacher> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 姓名
	private String position;		// 职称
	private String teaching;		// 授课
	
	public TestTeacher() {
		super();
	}

	public TestTeacher(String id){
		super(id);
	}

	@Length(min=0, max=64, message="姓名长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="职称长度必须介于 0 和 64 之间")
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	@Length(min=0, max=64, message="授课长度必须介于 0 和 64 之间")
	public String getTeaching() {
		return teaching;
	}

	public void setTeaching(String teaching) {
		this.teaching = teaching;
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test.entity.TestTeacher;
import com.thinkgem.jeesite.modules.test.dao.TestTeacherDao;

/**
 * 添加教师信息Service
 * @author 李
 * @version 2017-01-05
 */
@Service
@Transactional(readOnly = true)
public class TestTeacherService extends CrudService<TestTeacherDao, TestTeacher> {

	public TestTeacher get(String id) {
		return super.get(id);
	}
	
	public List<TestTeacher> findList(TestTeacher testTeacher) {
		return super.findList(testTeacher);
	}
	
	public Page<TestTeacher> findPage(Page<TestTeacher> page, TestTeacher testTeacher) {
		return super.findPage(page, testTeacher);
	}
	
	@Transactional(readOnly = false)
	public void save(TestTeacher testTeacher) {
		super.save(testTeacher);
	}
	
	@Transactional(readOnly = false)
	public void delete(TestTeacher testTeacher) {
		super.delete(testTeacher);
	}
	
}
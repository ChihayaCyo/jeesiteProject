/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.test.entity.TestTeacher;

/**
 * 添加教师信息DAO接口
 * @author 李
 * @version 2017-01-05
 */
@MyBatisDao
public interface TestTeacherDao extends CrudDao<TestTeacher> {
	
}
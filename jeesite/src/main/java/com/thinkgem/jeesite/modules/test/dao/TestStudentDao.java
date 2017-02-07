/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.test.entity.TestStudent;

/**
 * 学生DAO接口
 * @author 李川
 * @version 2017-01-05
 */
@MyBatisDao
public interface TestStudentDao extends CrudDao<TestStudent> {
	
}
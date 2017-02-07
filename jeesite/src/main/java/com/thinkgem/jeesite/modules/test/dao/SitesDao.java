/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.test.entity.Sites;

/**
 * 站点管理DAO接口
 * @author 李川
 * @version 2017-01-06
 */
@MyBatisDao
public interface SitesDao extends CrudDao<Sites> {
	
	public int getComCount();
	
	public List<Map<String, String>> indexCount(@Param(value="currentDate") String currentDate, @Param(value="lastDate") String lastDate);
}
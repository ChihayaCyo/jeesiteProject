/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.test.entity.SiteOverview;

/**
 * 按关键字查询网址DAO接口
 * @author 张航
 * @version 2017-01-12
 */
@MyBatisDao
public interface SiteOverviewDao extends CrudDao<SiteOverview> {
	public List<Map<String, String>> indexCount(@Param(value="currentDate") String currentDate, @Param(value="lastDate") String lastDate);
	public List<Map<String, String>> indexCount2();
	public List<Map<String, String>> indexCount3();
}
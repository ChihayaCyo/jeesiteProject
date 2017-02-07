/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.statistics.entity.SitesOverview;

/**
 * 网站概述DAO接口
 * @author 张航
 * @version 2017-01-17
 */
@MyBatisDao
public interface SitesOverviewDao extends CrudDao<SitesOverview> {
	public List<Map<String, String>> indexCount(@Param(value="currentDate") String currentDate, @Param(value="lastDate") String lastDate);
	public List<Map<String, String>> indexCount2();
	public List<Map<String, String>> indexCount3();
}
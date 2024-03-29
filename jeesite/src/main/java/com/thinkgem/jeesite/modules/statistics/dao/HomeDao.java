/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * homeDAO接口
 * @author 张航
 * @version 2017-01-17
 */
@MyBatisDao
public interface HomeDao{

	public List<Map<String, String>> homepageList(@Param(value = "currentDate") String currentDate);

}
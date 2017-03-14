/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.dao;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.statistics.pojo.Browser;
import com.thinkgem.jeesite.modules.statistics.pojo.OS;
import org.apache.ibatis.annotations.Param;

/**
 * 网站概述DAO接口
 * @author 张航
 * @version 2017-01-17
 */
@MyBatisDao
public interface SysEnvDao {

	 Browser getBrowserData(@Param(value = "siteId") String siteId,
							@Param(value = "currentDate") String currentDate,
							@Param(value = "day") Integer day);

	OS getOSData(@Param(value = "siteId") String siteId,
				 @Param(value = "currentDate") String currentDate,
				 @Param(value = "day") Integer day);

}
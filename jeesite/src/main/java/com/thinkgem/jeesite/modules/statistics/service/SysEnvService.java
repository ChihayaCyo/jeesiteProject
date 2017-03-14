/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.service;

import com.thinkgem.jeesite.modules.statistics.dao.MostVisitedPageDao;
import com.thinkgem.jeesite.modules.statistics.dao.SysEnvDao;
import com.thinkgem.jeesite.modules.statistics.pojo.Browser;
import com.thinkgem.jeesite.modules.statistics.pojo.OS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 网站概述Service
 * @author 张航
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class SysEnvService {

	@Autowired
	SysEnvDao sysEnvDao;

	public Browser getBrowserData(String siteId, Integer day) {

		Browser browser = sysEnvDao.getBrowserData(siteId,"2016-11-19 00:00:00",day);
		//java对象排序 似乎比js对象排序麻烦 js对象可以根据属性值直接进行排序
		//另外 返回的js对象拆分成数组对象[{key:value},{},...]的形式后也能根据key-value进行排序
		return browser;

	}

	public OS getOSData(String siteId, Integer day) {

		OS browser = sysEnvDao.getOSData(siteId,"2016-11-19 00:00:00",day);

		return browser;

	}


	
}
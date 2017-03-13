/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.service;

import com.thinkgem.jeesite.modules.statistics.dao.MostVisitedPageDao;
import com.thinkgem.jeesite.modules.statistics.dao.SysEnvDao;
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

	public List<Map<String, String>> getSysEnvData(String siteId) {

		return sysEnvDao.getSysEnvData(siteId);

	}


	
}
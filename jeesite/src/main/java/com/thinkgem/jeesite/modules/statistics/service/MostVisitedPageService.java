/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.service;

import com.thinkgem.jeesite.modules.statistics.dao.MostVisitedPageDao;
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
public class MostVisitedPageService{

	@Autowired
	MostVisitedPageDao mostVisitedPageDao;

	/*public List<Map<String, String>> topTenPage(String siteId) {
		return mostVisitedPageDao.topTenPage(siteId);
	}*/

	public List<Map<String, String>> topTenPageByDay(String siteId, String currentDate, Integer day) {
		return mostVisitedPageDao.topTenPageByDay(siteId,currentDate,day);
	}

	
}
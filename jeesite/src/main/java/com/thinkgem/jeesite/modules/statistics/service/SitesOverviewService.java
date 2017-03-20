/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.service;

import com.thinkgem.jeesite.modules.statistics.dao.SitesOverviewDao;
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
public class SitesOverviewService{

	@Autowired
	SitesOverviewDao sitesOverviewDao;

/*	public List<Map<String, String>> indexCount2() {
		return sitesOverviewDao.indexCount2();
	}*/

	public List<Map<String, String>> siteDetails(String siteId) {

		return sitesOverviewDao.siteDetails(siteId,"2017-03-20 00:00:00");

	}

	public List<Map<String, String>> overviewByDay(String siteId) {

		return sitesOverviewDao.overviewByDay(siteId);

	}

	public List<Map<String, String>> chartByDay(String siteId, Integer day) {

		return sitesOverviewDao.chartByDay(siteId,"2017-03-20 00:00:00",day);

	}

	public List<Map<String, String>> chartByDayAllSite(Integer day) {

		return sitesOverviewDao.chartByDayAllSite("2017-03-20 00:00:00",day);

	}
	
}
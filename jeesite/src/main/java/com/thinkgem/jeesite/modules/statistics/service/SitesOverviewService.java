/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.statistics.entity.SitesOverview;
import com.thinkgem.jeesite.modules.statistics.dao.SitesOverviewDao;

/**
 * 网站概述Service
 * @author 张航
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class SitesOverviewService extends CrudService<SitesOverviewDao, SitesOverview> {

	public SitesOverview get(String id) {
		return super.get(id);
	}
	
	public List<SitesOverview> findList(SitesOverview sitesOverview) {
		return super.findList(sitesOverview);
	}
	
	public Page<SitesOverview> findPage(Page<SitesOverview> page, SitesOverview sitesOverview) {
		return super.findPage(page, sitesOverview);
	}
	
	@Transactional(readOnly = false)
	public void save(SitesOverview sitesOverview) {
		super.save(sitesOverview);
	}
	
	@Transactional(readOnly = false)
	public void delete(SitesOverview sitesOverview) {
		super.delete(sitesOverview);
	}
	
	public List<Map<String, String>> indexCount() {
		return dao.indexCount("2016/11/05 00:00:00","2016/11/04 00:00:00");
	}
	public List<Map<String, String>> indexCount2() {
		return dao.indexCount2();
	}
	public List<Map<String, String>> indexCount3() {
		return dao.indexCount3();
	}
	
}
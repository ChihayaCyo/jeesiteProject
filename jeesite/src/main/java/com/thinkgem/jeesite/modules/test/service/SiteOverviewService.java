/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test.dao.SiteOverviewDao;
import com.thinkgem.jeesite.modules.test.entity.SiteOverview;

/**
 * 按关键字查询网址Service
 * @author 张航
 * @version 2017-01-12
 */
@Service
@Transactional(readOnly = true)
public class SiteOverviewService extends CrudService<SiteOverviewDao, SiteOverview> {

	public SiteOverview get(String id) {
		return super.get(id);
	}
	
	public List<SiteOverview> findList(SiteOverview SiteOverview) {
		return super.findList(SiteOverview);
	}
	
	public Page<SiteOverview> findPage(Page<SiteOverview> page, SiteOverview SiteOverview) {
		return super.findPage(page, SiteOverview);
	}
	
	@Transactional(readOnly = false)
	public void save(SiteOverview SiteOverview) {
		super.save(SiteOverview);
	}
	
	@Transactional(readOnly = false)
	public void delete(SiteOverview SiteOverview) {
		super.delete(SiteOverview);
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
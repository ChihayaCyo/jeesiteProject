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
import com.thinkgem.jeesite.modules.statistics.entity.Home;
import com.thinkgem.jeesite.modules.statistics.dao.HomeDao;

/**
 * homeService
 * @author 张航
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class HomeService extends CrudService<HomeDao, Home> {

	public Home get(String id) {
		return super.get(id);
	}
	
	public List<Home> findList(Home home) {
		return super.findList(home);
	}
	
	public Page<Home> findPage(Page<Home> page, Home home) {
		return super.findPage(page, home);
	}
	
	@Transactional(readOnly = false)
	public void save(Home home) {
		super.save(home);
	}
	
	@Transactional(readOnly = false)
	public void delete(Home home) {
		super.delete(home);
	}
	
	public List<Map<String, String>> indexHomepage() {
		return dao.indexHomepage("2016/11/05 00:00:00","2016/11/04 00:00:00");
	}
	
}
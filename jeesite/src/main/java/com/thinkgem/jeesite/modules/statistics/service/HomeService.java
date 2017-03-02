/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.modules.statistics.dao.HomeDao;

/**
 * homeService
 * @author 张航
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class HomeService{

	@Autowired
	HomeDao homeDao;
	
	public List<Map<String, String>> homepageList() {
		return homeDao.homepageList("2016-11-19 00:00:00");
	}
	
}
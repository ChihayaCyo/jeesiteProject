/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test.dao.SitesDao;
import com.thinkgem.jeesite.modules.test.entity.Sites;

/**
 * 站点管理Service
 * @author 李川
 * @version 2017-01-06
 */
@Service
@Transactional(readOnly = true)
public class SitesService extends CrudService<SitesDao, Sites> {

	public Sites get(String id) {
		return super.get(id);
	}
	
	public List<Sites> findList(Sites sites) {
		return super.findList(sites);
	}
	
	public Page<Sites> findPage(Page<Sites> page, Sites sites) {
		return super.findPage(page, sites);
	}
	
	@Transactional(readOnly = false)
	public void save(Sites sites) {
		super.save(sites);
	}
	
	@Transactional(readOnly = false)
	public void delete(Sites sites) {
		super.delete(sites);
	}
	
	public int getComCount(){
		int count =  dao.getComCount();
		return count;
	}
	
	
	public List<Map<String, String>> indexCount() {
		return dao.indexCount("2017/1/12","2017/1/11");
	}
	
	
}
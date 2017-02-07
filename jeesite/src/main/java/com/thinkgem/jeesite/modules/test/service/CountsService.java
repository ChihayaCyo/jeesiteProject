/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test.entity.Counts;
import com.thinkgem.jeesite.modules.test.dao.CountsDao;

/**
 * 网站列表Service
 * @author 李川
 * @version 2017-01-06
 */
@Service
@Transactional(readOnly = true)
public class CountsService extends CrudService<CountsDao, Counts> {

	public Counts get(String id) {
		return super.get(id);
	}
	
	public List<Counts> findList(Counts counts) {
		return super.findList(counts);
	}
	
	public Page<Counts> findPage(Page<Counts> page, Counts counts) {
		return super.findPage(page, counts);
	}
	
	@Transactional(readOnly = false)
	public void save(Counts counts) {
		super.save(counts);
	}
	
	@Transactional(readOnly = false)
	public void delete(Counts counts) {
		super.delete(counts);
	}
	
}
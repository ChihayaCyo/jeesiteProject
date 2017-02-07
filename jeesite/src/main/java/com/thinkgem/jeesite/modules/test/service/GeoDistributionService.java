/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test.entity.GeoDistribution;
import com.thinkgem.jeesite.modules.test.dao.GeoDistributionDao;

/**
 * 地域分布Service
 * @author 张航
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class GeoDistributionService extends CrudService<GeoDistributionDao, GeoDistribution> {

	public GeoDistribution get(String id) {
		return super.get(id);
	}
	
	public List<GeoDistribution> findList(GeoDistribution geoDistribution) {
		return super.findList(geoDistribution);
	}
	
	public Page<GeoDistribution> findPage(Page<GeoDistribution> page, GeoDistribution geoDistribution) {
		return super.findPage(page, geoDistribution);
	}
	
	@Transactional(readOnly = false)
	public void save(GeoDistribution geoDistribution) {
		super.save(geoDistribution);
	}
	
	@Transactional(readOnly = false)
	public void delete(GeoDistribution geoDistribution) {
		super.delete(geoDistribution);
	}
	
}
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
import com.thinkgem.jeesite.modules.statistics.entity.GeoDist;
import com.thinkgem.jeesite.modules.statistics.dao.GeoDistDao;

/**
 * 地域分布Service
 * @author 张航
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class GeoDistService extends CrudService<GeoDistDao, GeoDist> {

	public GeoDist get(String id) {
		return super.get(id);
	}
	
	public List<GeoDist> findList(GeoDist geoDist) {
		return super.findList(geoDist);
	}
	
	public Page<GeoDist> findPage(Page<GeoDist> page, GeoDist geoDist) {
		return super.findPage(page, geoDist);
	}
	
	@Transactional(readOnly = false)
	public void save(GeoDist geoDist) {
		super.save(geoDist);
	}
	
	@Transactional(readOnly = false)
	public void delete(GeoDist geoDist) {
		super.delete(geoDist);
	}
	
	public List<Map<String, String>> geoDistribution() {
		return dao.geoDistribution();
	}
}
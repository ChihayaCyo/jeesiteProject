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
import com.thinkgem.jeesite.modules.statistics.entity.TrendAnalysis;
import com.thinkgem.jeesite.modules.statistics.dao.TrendAnalysisDao;

/**
 * 趋势分析Service
 * @author 张航
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class TrendAnalysisService extends CrudService<TrendAnalysisDao, TrendAnalysis> {

	public TrendAnalysis get(String id) {
		return super.get(id);
	}
	
	public List<TrendAnalysis> findList(TrendAnalysis trendAnalysis) {
		return super.findList(trendAnalysis);
	}
	
	public Page<TrendAnalysis> findPage(Page<TrendAnalysis> page, TrendAnalysis trendAnalysis) {
		return super.findPage(page, trendAnalysis);
	}
	
	@Transactional(readOnly = false)
	public void save(TrendAnalysis trendAnalysis) {
		super.save(trendAnalysis);
	}
	
	@Transactional(readOnly = false)
	public void delete(TrendAnalysis trendAnalysis) {
		super.delete(trendAnalysis);
	}
	
	public List<Map<String, String>> trendByDate() {
		return dao.trendByDate("2016/11/05 00:00:00","2016/11/04 00:00:00");
	}
	public List<Map<String, String>> trendByTime() {
		return dao.trendByTime();
	}
	
}
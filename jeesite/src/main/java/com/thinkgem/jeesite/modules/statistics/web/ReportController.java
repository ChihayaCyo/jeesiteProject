/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.web;

import com.thinkgem.jeesite.modules.statistics.service.MostVisitedPageService;
import com.thinkgem.jeesite.modules.statistics.service.ReportService;
import com.thinkgem.jeesite.modules.statistics.service.SitesOverviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 网站概述Controller
 * @author 张航
 * @version 2017-01-17
 */
@Controller
@RequestMapping(value = "${adminPath}/statistics/report")
public class ReportController {

	@Autowired
	private ReportService reportService;


	@RequestMapping("/index")
	public String index() {
		
		return "modules/statistics/report";
	}


	@RequestMapping("/vue/topTenPageByDay")
	@ResponseBody
	public List<Map<String, String>> topTenPageByDay(String currentDate, Integer day) {

		List<Map<String, String>> topTenPageList = reportService.topTenPageByDay(currentDate,day);

		return topTenPageList;
	}

	@RequestMapping("/vue/dayList")
	@ResponseBody
	public List<Map<String, String>> reportByDayList(String currentDate, Integer day) {

		List<Map<String, String>> reportByDayList = reportService.reportByDayList(currentDate,day);

		return reportByDayList;
	}

}
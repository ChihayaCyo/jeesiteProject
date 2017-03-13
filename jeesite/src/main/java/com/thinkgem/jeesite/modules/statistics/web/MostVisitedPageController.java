/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.web;

import com.thinkgem.jeesite.modules.statistics.service.HomeService;
import com.thinkgem.jeesite.modules.statistics.service.MostVisitedPageService;
import com.thinkgem.jeesite.modules.statistics.service.SitesOverviewService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
@RequestMapping(value = "${adminPath}/statistics/mostVisitedPage")
public class MostVisitedPageController{

	@Autowired
	private SitesOverviewService sitesOverviewService;

	@Autowired
	private MostVisitedPageService mostVisitedPageService;


	@RequestMapping("/index/{siteId}")
	public String topTenPage(Model model, @PathVariable String siteId) {
		List<Map<String, String>> list = sitesOverviewService.siteDetails(siteId);
		model.addAttribute("list", list);
		
		return "modules/statistics/mostVisitedPage";
	}


	@RequestMapping("/vue/topPage")
	@ResponseBody
	public List<Map<String, String>> topTenPageByDay(Integer day, String siteId) {

		List<Map<String, String>> topTenPageList = mostVisitedPageService.topTenPageByDay(day,siteId);

		return topTenPageList;
	}

}
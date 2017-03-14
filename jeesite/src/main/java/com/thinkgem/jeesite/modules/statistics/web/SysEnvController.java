/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.web;

import com.thinkgem.jeesite.modules.statistics.dao.SysEnvDao;
import com.thinkgem.jeesite.modules.statistics.pojo.Browser;
import com.thinkgem.jeesite.modules.statistics.pojo.OS;
import com.thinkgem.jeesite.modules.statistics.service.MostVisitedPageService;
import com.thinkgem.jeesite.modules.statistics.service.SitesOverviewService;
import com.thinkgem.jeesite.modules.statistics.service.SysEnvService;
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
@RequestMapping(value = "${adminPath}/statistics/sysEnv")
public class SysEnvController {

	@Autowired
	private SitesOverviewService sitesOverviewService;

	@Autowired
	private SysEnvService sysEnvService;


	@RequestMapping("/index/{siteId}")
	public String index(Model model, @PathVariable String siteId) {
		List<Map<String, String>> list = sitesOverviewService.siteDetails(siteId);
		model.addAttribute("list", list);
		
		return "modules/statistics/sysEnv";
	}

	@RequestMapping("/vue/getBrowserData")
	@ResponseBody
	public Browser getBrowserData(String siteId, Integer day) {

		Browser browserData = sysEnvService.getBrowserData(siteId, day);

		return browserData;
	}

	@RequestMapping("/vue/getOSData")
	@ResponseBody
	public OS getOSData(String siteId, Integer day) {

		OS OSData = sysEnvService.getOSData(siteId, day);

		return OSData;
	}

}
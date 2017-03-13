/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.web;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.statistics.service.HomeService;

/**
 * homeController
 * @author 张航
 * @version 2017-01-17
 */
@Controller
@RequestMapping(value = "${adminPath}/statistics/home")
public class HomeController{

	@Autowired
	private HomeService homeService;

	@RequestMapping(value = {"/index", ""})
	public String index(Model model) {
		List<Map<String, String>> list = homeService.homepageList();
		model.addAttribute("list", list);
		
		return "modules/statistics/home";
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.statistics.entity.Home;
import com.thinkgem.jeesite.modules.statistics.service.HomeService;

/**
 * homeController
 * @author 张航
 * @version 2017-01-17
 */
@Controller
@RequestMapping(value = "${adminPath}/statistics/home")
public class HomeController extends BaseController {

	@Autowired
	private HomeService homeService;
	
	@ModelAttribute
	public Home get(@RequestParam(required=false) String id) {
		Home entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = homeService.get(id);
		}
		if (entity == null){
			entity = new Home();
		}
		return entity;
	}
	
	@RequiresPermissions("statistics:home:view")
	@RequestMapping(value = "list")
	public String list(Home home, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Home> page = homeService.findPage(new Page<Home>(request, response), home); 
		model.addAttribute("page", page);
		return "modules/statistics/homeList";
	}

	@RequiresPermissions("statistics:home:view")
	@RequestMapping(value = "form")
	public String form(Home home, Model model) {
		model.addAttribute("home", home);
		return "modules/statistics/homeForm";
	}

	@RequiresPermissions("statistics:home:edit")
	@RequestMapping(value = "save")
	public String save(Home home, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, home)){
			return form(home, model);
		}
		homeService.save(home);
		addMessage(redirectAttributes, "保存home成功");
		return "redirect:"+Global.getAdminPath()+"/statistics/home/?repage";
	}
	
	@RequiresPermissions("statistics:home:edit")
	@RequestMapping(value = "delete")
	public String delete(Home home, RedirectAttributes redirectAttributes) {
		homeService.delete(home);
		addMessage(redirectAttributes, "删除home成功");
		return "redirect:"+Global.getAdminPath()+"/statistics/home/?repage";
	}
	
	@RequiresPermissions("statistics:home:index")
	@RequestMapping(value = {"index", ""})
	public String index(Model model) {
		List<Map<String, String>> list = homeService.indexHomepage();
		model.addAttribute("list", list);
		System.out.println("输出1"+list);
		
		return "modules/statistics/homeIndex";
	}

}
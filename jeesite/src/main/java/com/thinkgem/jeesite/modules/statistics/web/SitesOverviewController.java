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
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.statistics.entity.SitesOverview;
import com.thinkgem.jeesite.modules.statistics.service.SitesOverviewService;

/**
 * 网站概述Controller
 * @author 张航
 * @version 2017-01-17
 */
@Controller
@RequestMapping(value = "${adminPath}/statistics/sitesOverview")
public class SitesOverviewController extends BaseController {

	@Autowired
	private SitesOverviewService sitesOverviewService;
	
	@ModelAttribute
	public SitesOverview get(@RequestParam(required=false) String id) {
		SitesOverview entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sitesOverviewService.get(id);
		}
		if (entity == null){
			entity = new SitesOverview();
		}
		return entity;
	}
	
	@RequiresPermissions("statistics:sitesOverview:view")
	@RequestMapping(value = "list")
	public String list(SitesOverview sitesOverview, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SitesOverview> page = sitesOverviewService.findPage(new Page<SitesOverview>(request, response), sitesOverview); 
		model.addAttribute("page", page);
		return "modules/statistics/sitesOverviewList";
	}

	@RequiresPermissions("statistics:sitesOverview:view")
	@RequestMapping(value = "form")
	public String form(SitesOverview sitesOverview, Model model) {
		model.addAttribute("sitesOverview", sitesOverview);
		return "modules/statistics/sitesOverviewForm";
	}

	@RequiresPermissions("statistics:sitesOverview:edit")
	@RequestMapping(value = "save")
	public String save(SitesOverview sitesOverview, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sitesOverview)){
			return form(sitesOverview, model);
		}
		sitesOverviewService.save(sitesOverview);
		addMessage(redirectAttributes, "保存网站概述成功");
		return "redirect:"+Global.getAdminPath()+"/statistics/sitesOverview/?repage";
	}
	
	@RequiresPermissions("statistics:sitesOverview:edit")
	@RequestMapping(value = "delete")
	public String delete(SitesOverview sitesOverview, RedirectAttributes redirectAttributes) {
		sitesOverviewService.delete(sitesOverview);
		addMessage(redirectAttributes, "删除网站概述成功");
		return "redirect:"+Global.getAdminPath()+"/statistics/sitesOverview/?repage";
	}

	@RequiresPermissions("statistics:sitesOverview:index")
	@RequestMapping(value = {"index", ""})
	public String index(Model model) {
		List<Map<String, String>> list = sitesOverviewService.indexCount();
		model.addAttribute("list", list);
		System.out.println("输出1"+list);
		
		List<Map<String, String>> list2 = sitesOverviewService.indexCount2();
		model.addAttribute("list2", list2);
		System.out.println("输出2"+list2);
		
		List<Map<String, String>> list3 = sitesOverviewService.indexCount3();
		model.addAttribute("list3", list3);
		System.out.println("输出3"+list3);
		
		return "modules/statistics/sitesOverviewIndex";
	}
}
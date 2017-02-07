/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.web;

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
import com.thinkgem.jeesite.modules.test.entity.SiteOverview;
import com.thinkgem.jeesite.modules.test.service.SiteOverviewService;

/**
 * 按关键字查询网址Controller
 * @author 张航
 * @version 2017-01-12
 */
@Controller
@RequestMapping(value = "${adminPath}/test/siteOverview")
public class SiteOverviewController extends BaseController {

	@Autowired
	private SiteOverviewService SiteOverviewService;
	
	@ModelAttribute
	public SiteOverview get(@RequestParam(required=false) String id) {
		SiteOverview entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = SiteOverviewService.get(id);
		}
		if (entity == null){
			entity = new SiteOverview();
		}
		return entity;
	}
	
	
	@RequiresPermissions("test:siteOverview:index")
	@RequestMapping(value = {"index",""})
	public String index(Model model) {
		List<Map<String, String>> list = SiteOverviewService.indexCount();
		model.addAttribute("list", list);
		System.out.println("输出1"+list);
		
		List<Map<String, String>> list2 = SiteOverviewService.indexCount2();
		model.addAttribute("list2", list2);
		System.out.println("输出2"+list2);
		
		List<Map<String, String>> list3 = SiteOverviewService.indexCount3();
		model.addAttribute("list3", list3);
		System.out.println("输出3"+list3);
		
		return "modules/test/siteOverviewIndex";
	}
	
	@RequiresPermissions("test:siteOverview:view")
	@RequestMapping(value ="list")
	public String list(SiteOverview siteOverview, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SiteOverview> page = SiteOverviewService.findPage(new Page<SiteOverview>(request, response), siteOverview); 
		model.addAttribute("page", page);
		return "modules/test/siteOverviewList";
	}

	@RequiresPermissions("test:siteOverview:view")
	@RequestMapping(value = "form")
	public String form(SiteOverview siteOverview, Model model) {
		model.addAttribute("siteOverview", siteOverview);
		return "modules/test/siteOverviewForm";
	}

	@RequiresPermissions("test:siteOverview:edit")
	@RequestMapping(value = "save")
	public String save(SiteOverview siteOverview, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, siteOverview)){
			return form(siteOverview, model);
		}
		SiteOverviewService.save(siteOverview);
		addMessage(redirectAttributes, "保存查询成功");
		return "redirect:"+Global.getAdminPath()+"/test/siteOverview/?repage";
	}
	
	@RequiresPermissions("test:siteOverview:edit")
	@RequestMapping(value = "delete")
	public String delete(SiteOverview siteOverview, RedirectAttributes redirectAttributes) {
		SiteOverviewService.delete(siteOverview);
		addMessage(redirectAttributes, "删除查询成功");
		return "redirect:"+Global.getAdminPath()+"/test/siteOverview/?repage";
	}



}
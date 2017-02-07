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
import com.thinkgem.jeesite.modules.test.entity.Sites;
import com.thinkgem.jeesite.modules.test.service.SitesService;

/**
 * 站点管理Controller
 * @author 李川
 * @version 2017-01-06
 */
@Controller
@RequestMapping(value = "${adminPath}/test/sites")
public class SitesController extends BaseController {

	@Autowired
	private SitesService sitesService;
	
	@ModelAttribute
	public Sites get(@RequestParam(required=false) String id) {
		Sites entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sitesService.get(id);
		}
		if (entity == null){
			entity = new Sites();
		}
		return entity;
	}
	
	@RequiresPermissions("test:sites:view")
	@RequestMapping(value = {"list", ""})
	public String list(Sites sites, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Sites> page = sitesService.findPage(new Page<Sites>(request, response), sites); 
		model.addAttribute("page", page);
		
		/*Sites sites2 = new Sites();
		sites2.setDomian(".com");
		Page<Sites> page2 = sitesService.findPage(new Page<Sites>(request, response), sites2); 
		model.addAttribute("page2", page2);*/
		
		int count = sitesService.getComCount();
		//int count = 1;
		model.addAttribute("count",count);
		
		return "modules/test/sitesList";
	}

	@RequiresPermissions("test:sites:view")
	@RequestMapping(value = "form")
	public String form(Sites sites, Model model) {
		model.addAttribute("sites", sites);
		return "modules/test/sitesForm";
	}

	@RequiresPermissions("test:sites:edit")
	@RequestMapping(value = "save")
	public String save(Sites sites, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sites)){
			return form(sites, model);
		}
		sitesService.save(sites);
		addMessage(redirectAttributes, "保存站点管理成功");
		return "redirect:"+Global.getAdminPath()+"/test/sites/?repage";
	}
	
	@RequiresPermissions("test:sites:edit")
	@RequestMapping(value = "delete")
	public String delete(Sites sites, RedirectAttributes redirectAttributes) {
		sitesService.delete(sites);
		addMessage(redirectAttributes, "删除站点管理成功");
		return "redirect:"+Global.getAdminPath()+"/test/sites/?repage";
	}
	
	
	@RequiresPermissions("test:sites:index")
	@RequestMapping(value = "index")
	public String index(Model model) {
		List<Map<String, String>> list = sitesService.indexCount();
		model.addAttribute("list", list);
		return "modules/test/sitesIndex";
	}

}
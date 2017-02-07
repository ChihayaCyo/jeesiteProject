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
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.test.entity.GeoDistribution;
import com.thinkgem.jeesite.modules.test.service.GeoDistributionService;

/**
 * 地域分布Controller
 * @author 张航
 * @version 2017-01-17
 */
@Controller
@RequestMapping(value = "${adminPath}/test/geoDistribution")
public class GeoDistributionController extends BaseController {

	@Autowired
	private GeoDistributionService geoDistributionService;
	
	@ModelAttribute
	public GeoDistribution get(@RequestParam(required=false) String id) {
		GeoDistribution entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = geoDistributionService.get(id);
		}
		if (entity == null){
			entity = new GeoDistribution();
		}
		return entity;
	}
	
	@RequiresPermissions("test:geoDistribution:index")
	@RequestMapping(value = {"index",""})
	public String index(Model model) {
		
		
		return "modules/test/geoDistributionIndex";
	}
	
	@RequiresPermissions("test:geoDistribution:view")
	@RequestMapping(value = "list")
	public String list(GeoDistribution geoDistribution, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GeoDistribution> page = geoDistributionService.findPage(new Page<GeoDistribution>(request, response), geoDistribution); 
		model.addAttribute("page", page);
		return "modules/test/geoDistributionList";
	}

	@RequiresPermissions("test:geoDistribution:view")
	@RequestMapping(value = "form")
	public String form(GeoDistribution geoDistribution, Model model) {
		model.addAttribute("geoDistribution", geoDistribution);
		return "modules/test/geoDistributionForm";
	}

	@RequiresPermissions("test:geoDistribution:edit")
	@RequestMapping(value = "save")
	public String save(GeoDistribution geoDistribution, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, geoDistribution)){
			return form(geoDistribution, model);
		}
		geoDistributionService.save(geoDistribution);
		addMessage(redirectAttributes, "保存分布成功");
		return "redirect:"+Global.getAdminPath()+"/test/geoDistribution/?repage";
	}
	
	@RequiresPermissions("test:geoDistribution:edit")
	@RequestMapping(value = "delete")
	public String delete(GeoDistribution geoDistribution, RedirectAttributes redirectAttributes) {
		geoDistributionService.delete(geoDistribution);
		addMessage(redirectAttributes, "删除分布成功");
		return "redirect:"+Global.getAdminPath()+"/test/geoDistribution/?repage";
	}

}
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
import com.thinkgem.jeesite.modules.statistics.entity.GeoDist;
import com.thinkgem.jeesite.modules.statistics.service.GeoDistService;

/**
 * 地域分布Controller
 * @author 张航
 * @version 2017-01-17
 */
@Controller
@RequestMapping(value = "${adminPath}/statistics/geoDist")
public class GeoDistController extends BaseController {

	@Autowired
	private GeoDistService geoDistService;
	
	@ModelAttribute
	public GeoDist get(@RequestParam(required=false) String id) {
		GeoDist entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = geoDistService.get(id);
		}
		if (entity == null){
			entity = new GeoDist();
		}
		return entity;
	}
	
	@RequiresPermissions("statistics:geoDist:view")
	@RequestMapping(value = "list")
	public String list(GeoDist geoDist, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GeoDist> page = geoDistService.findPage(new Page<GeoDist>(request, response), geoDist); 
		model.addAttribute("page", page);
		return "modules/statistics/geoDistList";
	}

	@RequiresPermissions("statistics:geoDist:view")
	@RequestMapping(value = "form")
	public String form(GeoDist geoDist, Model model) {
		model.addAttribute("geoDist", geoDist);
		return "modules/statistics/geoDistForm";
	}

	@RequiresPermissions("statistics:geoDist:edit")
	@RequestMapping(value = "save")
	public String save(GeoDist geoDist, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, geoDist)){
			return form(geoDist, model);
		}
		geoDistService.save(geoDist);
		addMessage(redirectAttributes, "保存分布成功");
		return "redirect:"+Global.getAdminPath()+"/statistics/geoDist/?repage";
	}
	
	@RequiresPermissions("statistics:geoDist:edit")
	@RequestMapping(value = "delete")
	public String delete(GeoDist geoDist, RedirectAttributes redirectAttributes) {
		geoDistService.delete(geoDist);
		addMessage(redirectAttributes, "删除分布成功");
		return "redirect:"+Global.getAdminPath()+"/statistics/geoDist/?repage";
	}
	
	@RequiresPermissions("statistics:geoDist:index")
	@RequestMapping(value = {"index", ""})
	public String index(Model model) {
		List<Map<String, String>> list3 = geoDistService.geoDistribution();
		model.addAttribute("list3", list3);
		System.out.println("输出1"+list3);
		
		return "modules/statistics/geoDistIndex";
	}

}
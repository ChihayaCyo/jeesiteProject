/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.web;

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
import com.thinkgem.jeesite.modules.test.entity.Counts;
import com.thinkgem.jeesite.modules.test.service.CountsService;

/**
 * 网站列表Controller
 * @author 李川
 * @version 2017-01-06
 */
@Controller
@RequestMapping(value = "${adminPath}/test/counts")
public class CountsController extends BaseController {

	@Autowired
	private CountsService countsService;
	
	@ModelAttribute
	public Counts get(@RequestParam(required=false) String id) {
		Counts entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = countsService.get(id);
		}
		if (entity == null){
			entity = new Counts();
		}
		return entity;
	}
	
	@RequiresPermissions("test:counts:view")
	@RequestMapping(value = {"list", ""})
	public String list(Counts counts, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Counts> page = countsService.findPage(new Page<Counts>(request, response), counts); 
		model.addAttribute("page", page);
		return "modules/test/countsList";
	}

	@RequiresPermissions("test:counts:view")
	@RequestMapping(value = "form")
	public String form(Counts counts, Model model) {
		model.addAttribute("counts", counts);
		return "modules/test/countsForm";
	}

	@RequiresPermissions("test:counts:edit")
	@RequestMapping(value = "save")
	public String save(Counts counts, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, counts)){
			return form(counts, model);
		}
		countsService.save(counts);
		addMessage(redirectAttributes, "保存网站列表成功");
		return "redirect:"+Global.getAdminPath()+"/test/counts/?repage";
	}
	
	@RequiresPermissions("test:counts:edit")
	@RequestMapping(value = "delete")
	public String delete(Counts counts, RedirectAttributes redirectAttributes) {
		countsService.delete(counts);
		addMessage(redirectAttributes, "删除网站列表成功");
		return "redirect:"+Global.getAdminPath()+"/test/counts/?repage";
	}

}
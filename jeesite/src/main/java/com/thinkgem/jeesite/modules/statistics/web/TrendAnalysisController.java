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
import com.thinkgem.jeesite.modules.statistics.entity.TrendAnalysis;
import com.thinkgem.jeesite.modules.statistics.service.TrendAnalysisService;

/**
 * 趋势分析Controller
 * @author 张航
 * @version 2017-01-17
 */
@Controller
@RequestMapping(value = "${adminPath}/statistics/trendAnalysis")
public class TrendAnalysisController extends BaseController {

	@Autowired
	private TrendAnalysisService trendAnalysisService;
	
	@ModelAttribute
	public TrendAnalysis get(@RequestParam(required=false) String id) {
		TrendAnalysis entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = trendAnalysisService.get(id);
		}
		if (entity == null){
			entity = new TrendAnalysis();
		}
		return entity;
	}
	
	@RequiresPermissions("statistics:trendAnalysis:view")
	@RequestMapping(value = "list")
	public String list(TrendAnalysis trendAnalysis, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TrendAnalysis> page = trendAnalysisService.findPage(new Page<TrendAnalysis>(request, response), trendAnalysis); 
		model.addAttribute("page", page);
		return "modules/statistics/trendAnalysisList";
	}

	@RequiresPermissions("statistics:trendAnalysis:view")
	@RequestMapping(value = "form")
	public String form(TrendAnalysis trendAnalysis, Model model) {
		model.addAttribute("trendAnalysis", trendAnalysis);
		return "modules/statistics/trendAnalysisForm";
	}

	@RequiresPermissions("statistics:trendAnalysis:edit")
	@RequestMapping(value = "save")
	public String save(TrendAnalysis trendAnalysis, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, trendAnalysis)){
			return form(trendAnalysis, model);
		}
		trendAnalysisService.save(trendAnalysis);
		addMessage(redirectAttributes, "保存趋势分析成功");
		return "redirect:"+Global.getAdminPath()+"/statistics/trendAnalysis/?repage";
	}
	
	@RequiresPermissions("statistics:trendAnalysis:edit")
	@RequestMapping(value = "delete")
	public String delete(TrendAnalysis trendAnalysis, RedirectAttributes redirectAttributes) {
		trendAnalysisService.delete(trendAnalysis);
		addMessage(redirectAttributes, "删除趋势分析成功");
		return "redirect:"+Global.getAdminPath()+"/statistics/trendAnalysis/?repage";
	}
	
	@RequiresPermissions("statistics:trendAnalysis:index")
	@RequestMapping(value = {"index", ""})
	public String index(Model model) {
		List<Map<String, String>> list = trendAnalysisService.trendByDate();
		model.addAttribute("list", list);
		System.out.println("输出1"+list);
		
		List<Map<String, String>> list2 = trendAnalysisService.trendByTime();
		model.addAttribute("list2", list2);
		System.out.println("输出2"+list2);
		
		return "modules/statistics/trendAnalysisIndex";
	}

}
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
import com.thinkgem.jeesite.modules.test.entity.TestTeacher;
import com.thinkgem.jeesite.modules.test.service.TestTeacherService;

/**
 * 添加教师信息Controller
 * @author 李
 * @version 2017-01-05
 */
@Controller
@RequestMapping(value = "${adminPath}/test/testTeacher")
public class TestTeacherController extends BaseController {

	@Autowired
	private TestTeacherService testTeacherService;
	
	@ModelAttribute
	public TestTeacher get(@RequestParam(required=false) String id) {
		TestTeacher entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = testTeacherService.get(id);
		}
		if (entity == null){
			entity = new TestTeacher();
		}
		return entity;
	}
	
	@RequiresPermissions("test:testTeacher:view")
	@RequestMapping(value = {"list", ""})
	public String list(TestTeacher testTeacher, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TestTeacher> page = testTeacherService.findPage(new Page<TestTeacher>(request, response), testTeacher); 
		model.addAttribute("page", page);
		return "modules/test/testTeacherList";
	}

	@RequiresPermissions("test:testTeacher:view")
	@RequestMapping(value = "form")
	public String form(TestTeacher testTeacher, Model model) {
		model.addAttribute("testTeacher", testTeacher);
		return "modules/test/testTeacherForm";
	}

	@RequiresPermissions("test:testTeacher:edit")
	@RequestMapping(value = "save")
	public String save(TestTeacher testTeacher, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, testTeacher)){
			return form(testTeacher, model);
		}
		testTeacherService.save(testTeacher);
		addMessage(redirectAttributes, "保存教师成功");
		return "redirect:"+Global.getAdminPath()+"/test/testTeacher/?repage";
	}
	
	@RequiresPermissions("test:testTeacher:edit")
	@RequestMapping(value = "delete")
	public String delete(TestTeacher testTeacher, RedirectAttributes redirectAttributes) {
		testTeacherService.delete(testTeacher);
		addMessage(redirectAttributes, "删除教师成功");
		return "redirect:"+Global.getAdminPath()+"/test/testTeacher/?repage";
	}

}
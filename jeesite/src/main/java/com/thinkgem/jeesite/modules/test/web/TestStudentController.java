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
import com.thinkgem.jeesite.modules.test.entity.TestStudent;
import com.thinkgem.jeesite.modules.test.service.TestStudentService;

/**
 * 学生Controller
 * @author 李川
 * @version 2017-01-05
 */
@Controller
@RequestMapping(value = "${adminPath}/test/testStudent")
public class TestStudentController extends BaseController {

	@Autowired
	private TestStudentService testStudentService;
	
	@ModelAttribute
	public TestStudent get(@RequestParam(required=false) String id) {
		TestStudent entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = testStudentService.get(id);
		}
		if (entity == null){
			entity = new TestStudent();
		}
		return entity;
	}
	
	@RequiresPermissions("test:testStudent:view")
	@RequestMapping(value = {"list", ""})
	public String list(TestStudent testStudent, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TestStudent> page = testStudentService.findPage(new Page<TestStudent>(request, response), testStudent); 
		model.addAttribute("page", page);
		return "modules/test/testStudentList";
	}

	@RequiresPermissions("test:testStudent:view")
	@RequestMapping(value = "form")
	public String form(TestStudent testStudent, Model model) {
		model.addAttribute("testStudent", testStudent);
		return "modules/test/testStudentForm";
	}

	@RequiresPermissions("test:testStudent:edit")
	@RequestMapping(value = "save")
	public String save(TestStudent testStudent, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, testStudent)){
			return form(testStudent, model);
		}
		testStudentService.save(testStudent);
		addMessage(redirectAttributes, "保存学生成功");
		return "redirect:"+Global.getAdminPath()+"/test/testStudent/?repage";
	}
	
	@RequiresPermissions("test:testStudent:edit")
	@RequestMapping(value = "delete")
	public String delete(TestStudent testStudent, RedirectAttributes redirectAttributes) {
		testStudentService.delete(testStudent);
		addMessage(redirectAttributes, "删除学生成功");
		return "redirect:"+Global.getAdminPath()+"/test/testStudent/?repage";
	}

}
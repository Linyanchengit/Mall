package com.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.Admin;
import com.shop.service.admin.AdminService;
import com.shop.service.admin.IAdminService;

@Controller
public class AdminController {
	@Autowired
	private IAdminService adminService;
	@RequestMapping("/admin")
	public String toLogin(@ModelAttribute Admin admin) {
		return "admin/login";
	}
	@RequestMapping("/admin/login")
	public String login(@ModelAttribute Admin admin, Model model, HttpSession session) {
		return adminService.login(admin, model, session);
	}
	@RequestMapping("/admin/exit")
	public String exit(@ModelAttribute Admin admin,HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
}

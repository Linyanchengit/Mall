package com.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.User;
import com.shop.service.before.BeforeProductsService;
import com.shop.service.before.IBeforeProductsService;
import com.shop.service.before.IBeforeUserService;

@Controller
public class BeforeController {
	@Autowired
	private IBeforeProductsService beforeProductsService;
	@Autowired
	private IBeforeUserService beforeUserService;
	@RequestMapping("/before")
	public String before(Model model) {
		Integer category_id=15;
		return beforeProductsService.searchProductsByCategory(model, category_id);
	}
	@RequestMapping("/before/introduction")
	public String introduction(Model model,String id) {
		return beforeProductsService.searchProductById(model, id);
	}
	@RequestMapping("before/login")
	public String login(@ModelAttribute User user,HttpSession session) {
		return beforeUserService.login(user, session);
	}
	
	@RequestMapping("before/register")
	public String register(@ModelAttribute User user,String repassword) {
		if (repassword!=null&&!user.getPassword().equals(repassword)) {
			return "before/register";
		}
		return beforeUserService.register(user);
	}
	@RequestMapping("before/header")
	public String header() {
		return "before/header";
	}
	@RequestMapping("before/exit")
	public String exit(HttpSession session) {
		session.invalidate();
		return "forward:/before/";
	}
	@RequestMapping("before/information")
	public String information() {
		return "before/information";
	}
	@RequestMapping("before/updateUser")
	public String updateUser(@ModelAttribute User user,HttpSession session) {
		return beforeUserService.updateUserById(user,session);
	}
}

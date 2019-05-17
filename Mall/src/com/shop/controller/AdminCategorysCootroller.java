package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.Category;
import com.shop.service.admin.IAdminCategorysService;

@Controller
@RequestMapping("/admin")
public class AdminCategorysCootroller {
	@Autowired
	private IAdminCategorysService adminCategorysService;
	@RequestMapping("/product-category-add")
	public String product_category(Model model,HttpServletRequest request,HttpSession session) {
		return adminCategorysService.searchAllCategory(model,request, session);
	}
	@RequestMapping("/toAddCategory")
	public String product_category_add(Model model,HttpServletRequest request,HttpSession session) {
		return adminCategorysService.searchAllCategory(model,request, session);
	}
	@RequestMapping("/deleteCategory")
	public String product_category_delete(Model model,HttpServletRequest request,HttpSession session,Integer category_id) {
		return adminCategorysService.deleteCategory(model,request, session,category_id);
	}
}

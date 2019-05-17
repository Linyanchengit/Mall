package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.admin.IAdminProductsService;
import com.shop.service.admin.IAdminUsersService;
import com.shop.utils.ExcelUtils;
import com.shop.utils.UploadExcel;
@Controller
@RequestMapping("/admin")
public class AdminUsersController {
	@Autowired
	private IAdminUsersService adminUsersService;
	@RequestMapping("/member-list")
	public String member_list(Model model) {
		return adminUsersService.searchAllUsers(model);		
	}
	@RequestMapping("/startUser")
	public String startUser(Integer id,String activeCode) {
		return adminUsersService.startUserById(id, activeCode);
	}
	
	@RequestMapping("/stopUser")
	public String stopUser(Integer id,String activeCode) {
		return adminUsersService.stopUserById(id, activeCode);
	}
	@RequestMapping("/toAddUsers")
	public String toAddUsers(HttpServletRequest request,HttpServletResponse response) {
		
		return "/admin/users-add";
	}
	@RequestMapping("/addUsers")
	public String addUsers(HttpServletRequest request,HttpServletResponse response) {
		String filename=UploadExcel.doupload(request, response);
		//String path = request.getContextPath();
		//String basePath = request.getServerName()+":"+request.getServerPort()+path+"/";
		ExcelUtils excel=new ExcelUtils("1.xls");
		System.out.println(request.getContextPath());
		excel.CreateExcel("1.xls", "1");
		return "/admin/member-list";
	}
}

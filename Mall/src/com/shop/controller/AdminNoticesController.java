package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.dao.AdminNoticesDao;
import com.shop.entity.Notice;
import com.shop.service.admin.IAdminNoticesService;



@Controller
@RequestMapping("/admin")
public class AdminNoticesController {
	@Autowired
	private IAdminNoticesService adminNoticesService;
	@RequestMapping("/notice-list")
	public String notice_list(Model model) {
		return adminNoticesService.searchAllNotice(model);
	}
	@RequestMapping("/deleteNoticeById")
	public String deleteNoticeById(Integer n_id) {
		return adminNoticesService.deleteNoticeById(n_id);
	}
	@RequestMapping("/updateNoticeById")
	public String updateNoticeById(Integer n_id,String title,String details) {
		Notice notice=new Notice();
		notice.setTitle(title);
		notice.setDetails(details);
		notice.setN_id(n_id);
		return adminNoticesService.updateNoticeById(notice);
	}
	@RequestMapping("/updateNotice")
	public String updateNotice(Model model,Integer n_id) {
		model.addAttribute("n_id", n_id);
		return "admin/notice-update";
	}
	
	@RequestMapping("/addNoticePage")
	public String addNoticePage(String title,String details) {
		
		return "admin/notice-add";
	}
	
	@RequestMapping("/addNotice")
	public String addNotice(String title,String details) {
		return adminNoticesService.addNotice(title, details);
	}
}

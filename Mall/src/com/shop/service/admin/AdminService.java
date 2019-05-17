package com.shop.service.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.AdminDao;
import com.shop.entity.Admin;
@Service("adminService")
@Transactional
public class AdminService implements IAdminService {
	@Autowired
	private AdminDao adminDao;
	@Override
	public String login(Admin admin, Model model, HttpSession session) {
		if(adminDao.login(admin) != null && adminDao.login(admin).size() > 0) {
			session.setAttribute("admin", admin);
			return "admin/index";
		}
		model.addAttribute("msg", "用户名或密码错误！");
		return "admin/login";
	}

}

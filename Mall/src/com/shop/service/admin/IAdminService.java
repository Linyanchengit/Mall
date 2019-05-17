package com.shop.service.admin;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.shop.entity.Admin;

public interface IAdminService {
	public String login(Admin admin, Model model, HttpSession session);
}

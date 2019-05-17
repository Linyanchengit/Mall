package com.shop.service.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.shop.entity.User;

public interface IAdminUsersService {
	public String searchAllUsers(Model model);
	public String startUserById(Integer id,String activeCode);
	public String stopUserById(Integer id,String activeCode);
	public String addUser(User user);
}

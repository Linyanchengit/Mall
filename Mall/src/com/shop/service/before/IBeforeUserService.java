package com.shop.service.before;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.shop.entity.User;

public interface IBeforeUserService {
	public String searchUserById(Integer user_id);
	public String register(User user);
	public String login(User user,HttpSession session);
	public String updateUserById(User user,HttpSession session);
}

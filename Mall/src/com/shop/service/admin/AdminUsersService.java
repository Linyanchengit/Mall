package com.shop.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.AdminProductsDao;
import com.shop.dao.AdminUsersDao;
import com.shop.entity.User;
@Service("adminUsersService")
@Transactional
public class AdminUsersService implements IAdminUsersService {
	@Autowired
	private AdminUsersDao adminUsersDao;
	@Override
	public String searchAllUsers(Model model) {
		// TODO Auto-generated method stub
		List<User> allUsers=adminUsersDao.searchAllUsers(); 
		System.out.println(allUsers.size());
		model.addAttribute("allUsers",allUsers );
		model.addAttribute("size", allUsers.size());
		return "admin/member-list";
	}

	@Override
	public String startUserById(Integer id,String activeCode) {
		// TODO Auto-generated method stub
		User user=new User();
		user.setId(id);
		user.setActiveCode(activeCode);
		adminUsersDao.startUserById(user);
		return "admin/member-list";
	}

	@Override
	public String stopUserById(Integer id, String activeCode) {
		// TODO Auto-generated method stub
		User user=new User();
		user.setId(id);
		user.setActiveCode(activeCode);
		adminUsersDao.stopUserById(user);
		return "admin/member-list";
	}

	@Override
	public String addUser(User user) {
		// TODO Auto-generated method stub
		adminUsersDao.addUser(user);
		return "admin/member-list";
	}

	

}

package com.shop.service.before;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.BeforeUserDao;
import com.shop.entity.User;

@Service("beforeUserService")
@Transactional
public class BeforeUserService implements IBeforeUserService {
	@Autowired
	private BeforeUserDao beforeUserDao;
	@Override
	public String searchUserById(Integer user_id) {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public String register(User user) {
		// TODO Auto-generated method stub
		if (user==null||user.getUsername()==null||user.getPassword()==null) {
			return "before/register";
		}
		int n=beforeUserDao.register(user);
		if (n>0) {
			return "before/login";
		}
		return "before/register";
	}

	@Override
	public String login(User user,HttpSession session) {
		// TODO Auto-generated method stub
		User user2=null;
		if (session.getAttribute("user")!=null) {
			return "redirect:/before";
		}
		List<User> list=beforeUserDao.login(user);
		if (list.size()>0) {
			user2=list.get(0);
			session.setAttribute("user", user2);
		}
		if (user2!=null) {
			return "redirect:/before";
		}
		return "before/login";
	}

	@Override
	public String updateUserById(User user,HttpSession session) {
		// TODO Auto-generated method stub
		beforeUserDao.updateUserById(user);
		User user2=beforeUserDao.searchUserById(user.getId());
		session.removeAttribute("user");
		session.setAttribute("user", user2);
		return "redirect:/before/information";
	}

}

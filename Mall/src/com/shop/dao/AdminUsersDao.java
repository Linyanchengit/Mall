package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Order;
import com.shop.entity.User;
@Repository("adminUsersDao")
@Mapper
public interface AdminUsersDao {
	public List<User> searchAllUsers();
	public boolean startUserById(User user);
	public boolean stopUserById(User user);
	public boolean addUser(User user);
	public User searchUserById(Order order);
}

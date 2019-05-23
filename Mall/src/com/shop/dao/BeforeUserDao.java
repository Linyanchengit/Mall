package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.User;
@Repository("beforeUserDao")
@Mapper
public interface BeforeUserDao {
	public User searchUserById(Integer user_id);
	public int register(User user);
	public List<User> login(User user);
	public int updateUserById(User user);
}

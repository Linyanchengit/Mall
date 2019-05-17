package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Admin;
@Repository("adminDao")
@Mapper
public interface AdminDao {
	public List<Admin> login(Admin admin);
}

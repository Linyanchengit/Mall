package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Order;

@Repository("adminOrdersDao")
@Mapper
public interface AdminOrdersDao {
	public List<Order> selectAllOrders();
	public List<Order> selectOrderById(String id);
}

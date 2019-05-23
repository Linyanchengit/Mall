package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Order;
import com.shop.entity.Orderitem;
@Repository("beforeOrdersDao")
@Mapper
public interface BeforeOrdersDao {
	public boolean addOrder(Order order);
	public List<Order> searchOrdersById(Integer id);
}

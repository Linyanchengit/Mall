package com.shop.service.before;

import java.util.List;

import org.springframework.ui.Model;

import com.shop.entity.Order;

public interface IBeforeOrdersService {
	public String addOrder(Order order);
	public String searchOrdersById(Model model,Integer id);
}

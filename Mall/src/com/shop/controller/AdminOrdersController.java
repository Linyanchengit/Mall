package com.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.Order;
import com.shop.service.admin.IAdminNoticesService;
import com.shop.service.admin.IAdminOrdersService;

@Controller
@RequestMapping("/admin")
public class AdminOrdersController {
	@Autowired
	private IAdminOrdersService adminOrdersService;
	@RequestMapping("/orders-list")
	public String order_list(Model model) {
		return adminOrdersService.selectAllOrders(model);
	}
	@RequestMapping("/searchOrders")
	public String search_orders(Model model,String id) {
		return adminOrdersService.selectOrderById(model, id);
	}
}

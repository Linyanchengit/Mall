package com.shop.service.admin;

import org.springframework.ui.Model;

public interface IAdminOrdersService {
	public String selectAllOrders(Model model);
	public String searchOrderitem(Model model,String id);
	public String selectOrderById(Model model,String id);
}

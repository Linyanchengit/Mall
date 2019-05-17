package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.dao.AdminOrderitemsDao;
import com.shop.service.admin.IAdminOrderitemsService;

@Controller
@RequestMapping("/admin")
public class AdminOrderitemsController {
	@Autowired
	private IAdminOrderitemsService adminOrderitemsService;
	@RequestMapping("/order-detail")
	public String order_detail(Model model,String id,String money) {
		return adminOrderitemsService.searchAllOrderitems(model, id,money);
	}
}

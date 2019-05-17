package com.shop.service.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.shop.entity.Orderitem;

public interface IAdminOrderitemsService {
	public String searchAllOrderitems(Model model,String id,String money);
}

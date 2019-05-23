package com.shop.service.before;

import java.util.List;

import org.springframework.ui.Model;

import com.shop.entity.Orderitem;

public interface IBeforeOrderitemsService {
	public void addOrderitem(Orderitem orderitem);
	public String searchOrderitemsById(Model model,String id);
}

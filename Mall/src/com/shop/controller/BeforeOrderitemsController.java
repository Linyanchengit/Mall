package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.before.IBeforeOrderitemsService;

@Controller
@RequestMapping("/before")
public class BeforeOrderitemsController {
	@Autowired
	private IBeforeOrderitemsService beforeOrderitemsService;
	@RequestMapping("/orderitems")
	public String orderitems(Model model,String id) {
		return beforeOrderitemsService.searchOrderitemsById(model, id);
	}
	
}

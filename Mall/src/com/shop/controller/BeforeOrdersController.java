package com.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.dao.BeforeCartsDao;
import com.shop.dao.BeforeUserDao;
import com.shop.entity.Cart;
import com.shop.entity.Order;
import com.shop.entity.Orderitem;
import com.shop.entity.User;
import com.shop.service.before.IBeforeOrderitemsService;
import com.shop.service.before.IBeforeOrdersService;
import com.shop.utils.MakeIdUtil;

@Controller
@RequestMapping("/before")
public class BeforeOrdersController {
	@Autowired
	private IBeforeOrderitemsService beforeOrderitemsService;
	@Autowired
	private IBeforeOrdersService beforeOrdersService;
	@Autowired
	private BeforeUserDao beforeUserDao;
	@Autowired
	private BeforeCartsDao beforeCartsDao;
	@RequestMapping("/orders")
	public String orders(Model model,Integer id) {
		return beforeOrdersService.searchOrdersById(model,id);
	}
	@RequestMapping("/addOrder")
	public String addOrder(@ModelAttribute Order order,String items[]) {
		System.out.println(order.getUser_id());/*
		System.out.println("money is "+order.getMoney());*/
		User user=beforeUserDao.searchUserById(order.getUser_id());
		order.setReceiverName(user.getUsername());
		order.setReceiverAddress(user.getAddress());
		order.setReceiverPhone(user.getTelephone());
		order.setStatus(1);
		order.setId(MakeIdUtil.makeID());
		double a=0.0;
		for (int i=0;i<items.length;i++) {
			Cart cart=beforeCartsDao.searchCartById(Integer.parseInt(items[i]));
			a+=cart.getCarts_total();
		}
		order.setMoney(a);
		beforeOrdersService.addOrder(order);
		for (int i=0;i<items.length;i++) {
			System.out.println(1);
			Cart cart=beforeCartsDao.searchCartById(Integer.parseInt(items[i]));
			Orderitem orderitem=new Orderitem();
			orderitem.setProduct_id(cart.getProduct_id());
			orderitem.setOrder_id(order.getId());
			orderitem.setBuynum(cart.getCarts_quantity());
			orderitem.setSum(cart.getCarts_total());
			beforeOrderitemsService.addOrderitem(orderitem);
			beforeCartsDao.deleteCartById(cart.getCarts_id());
			
		}
		return "forward:/before/orders?id="+order.getUser_id();
	}
}

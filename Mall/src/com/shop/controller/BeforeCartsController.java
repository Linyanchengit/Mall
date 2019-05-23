package com.shop.controller;

import java.math.BigDecimal;

import javafx.scene.shape.QuadCurve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.entity.Cart;
import com.shop.service.before.IBeforeCartsService;
import com.sun.org.apache.regexp.internal.recompile;

@Controller
public class BeforeCartsController {
	@Autowired
	private IBeforeCartsService beforeCartsService;
	@RequestMapping("/before/addcart")
	public String addCart(Model model,int carts_quantity,double price,String product_id,int user_id) {
		Cart cart=new Cart();
		cart.setCarts_quantity(carts_quantity);
		cart.setCarts_total(mul((double)carts_quantity*1.00, (double)price));
		cart.setProduct_id(product_id);
		cart.setUser_id(user_id);
		System.out.println(price);
		return beforeCartsService.addCarts(cart);
	}
	@RequestMapping("/before/deleteCartById")
	public String deleteCartById(Integer carts_id) {
		return beforeCartsService.deleteCartById(carts_id);
	}
	@RequestMapping("/before/shopcart")
	public String shopcart(Model model) {
		return beforeCartsService.searchAllCarts(model);
	}
	public static double mul(double v1,double v2) {
		BigDecimal b1=new BigDecimal(Double.toString(v1));
		BigDecimal b2=new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}
}

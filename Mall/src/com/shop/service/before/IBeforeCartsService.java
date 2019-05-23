package com.shop.service.before;

import java.util.List;

import org.springframework.ui.Model;

import com.shop.entity.Cart;

public interface IBeforeCartsService {
	public String addCarts(Cart cart);
	public String deleteCartById(Integer carts_id);
	public String searchAllCarts(Model model);
}

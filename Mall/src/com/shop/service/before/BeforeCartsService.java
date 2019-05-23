package com.shop.service.before;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.AdminProductsDao;
import com.shop.dao.BeforeCartsDao;
import com.shop.entity.Cart;

@Service("beforeCartsService")
@Transactional
public class BeforeCartsService implements IBeforeCartsService {
	@Autowired
	private BeforeCartsDao beforeCartsDao;
	@Autowired
	private AdminProductsDao adminProductsDao;
	@Override
	public String addCarts(Cart cart) {
		// TODO Auto-generated method stub
		beforeCartsDao.addCarts(cart);
		return "forward:/before/shopcart";
	}

	@Override
	public String deleteCartById(Integer carts_id) {
		// TODO Auto-generated method stub
		beforeCartsDao.deleteCartById(carts_id);
		return "forward:/before/shopcart";
	}

	@Override
	public String searchAllCarts(Model model) {
		// TODO Auto-generated method stub
		List<Cart> allCarts=beforeCartsDao.searchAllCarts();
		List<Cart> allCarts1=new ArrayList<Cart>();
		double totalPrice=0.0;
		for (int i=0;i<allCarts.size();i++) {
			Cart cart=allCarts.get(i);
			cart.setProduct(adminProductsDao.searchProductById(cart.getProduct_id()));
			totalPrice+=cart.getCarts_total();
			allCarts1.add(cart);
		}
		model.addAttribute("allCarts", allCarts1);
		model.addAttribute("cartsTotal",allCarts1.size());
		model.addAttribute("totalPrice", totalPrice);
		return "before/shopcart";
	}

}

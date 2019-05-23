package com.shop.service.before;

import java.util.List;

import org.springframework.ui.Model;

import com.shop.entity.Product;

public interface IBeforeProductsService {
	public String searchProductsByCategory(Model model,Integer  category_id);
	public String searchProductById(Model model,String id);
}

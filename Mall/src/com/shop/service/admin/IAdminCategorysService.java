package com.shop.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.shop.entity.Category;
import com.shop.entity.Product;

public interface IAdminCategorysService {
	public Category searchCategory_name(Product product);
	public boolean insertCategory(Category category);
	public String searchAllCategory(Model model,HttpServletRequest request,HttpSession session);
	public String deleteCategory(Model model,HttpServletRequest request,HttpSession session,Integer category_id);
}

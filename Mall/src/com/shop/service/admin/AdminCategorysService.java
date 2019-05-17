package com.shop.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.AdminCategorysDao;
import com.shop.entity.Category;
import com.shop.entity.Product;

@Service("adminCategorysService")
@Transactional
public class AdminCategorysService implements IAdminCategorysService {
	@Autowired
	private AdminCategorysDao adminCategorysDao;
	@Override
	public Category searchCategory_name(Product product) {
		// TODO Auto-generated method stub
		return adminCategorysDao.searchCategory_name(product);
	}
	@Override
	public boolean insertCategory(Category category) {
		// TODO Auto-generated method stub
		adminCategorysDao.insertCategory(category);
		return false;
	}
	@Override
	public String searchAllCategory(Model model,HttpServletRequest request,HttpSession session) {
		// TODO Auto-generated method stub
		Category category=new Category();
		category.setCategory_name(request.getParameter("category_name"));
		category.setRemarks(request.getParameter("remarks"));
		if (category.getCategory_name()!=null&&category.getRemarks()!=null) {
			adminCategorysDao.insertCategory(category);
		}
		List<Category> allCategorys=adminCategorysDao.searchAllCategory();
		if (allCategorys!=null) {
			System.out.println(allCategorys.size());
		}
		model.addAttribute("allCategorys",allCategorys);
		return "admin/product-category-add";
	}
	@Override
	public String deleteCategory(Model model, HttpServletRequest request,
			HttpSession session,Integer category_id) {
		// TODO Auto-generated method stub
		adminCategorysDao.deleteCategory(category_id);
		return "redirect:/admin/product-category-add";
	}

}

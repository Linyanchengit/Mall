package com.shop.service.before;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.AdminCategorysDao;
import com.shop.dao.BeforeNoticesDao;
import com.shop.dao.BeforeProductDao;
import com.shop.entity.Notice;
import com.shop.entity.Product;

@Service("beforeProductsService")
@Transactional
public class BeforeProductsService implements IBeforeProductsService {
	@Autowired
	private BeforeProductDao beforeProductsDao;
	@Autowired
	private AdminCategorysDao adminCategorysDao;
	@Autowired
	private BeforeNoticesDao beforeNoticesDao;
	public String searchProductsByCategory(Model model,Integer  category_id) {
		List<Product> foods=beforeProductsDao.searchProductsByCategory(category_id);
		model.addAttribute("foods", foods);
		category_id=2;
		List<Product> use=beforeProductsDao.searchProductsByCategory(category_id);
		model.addAttribute("use", use);
		category_id=3;
		List<Product> fruits=beforeProductsDao.searchProductsByCategory(category_id);
		model.addAttribute("fruits", fruits);
		List<Notice> allNotices=beforeNoticesDao.searchAllNotices();
		model.addAttribute("allNotices",allNotices );
		return "before/home";
	}
	@Override
	public String searchProductById(Model model,String id) {
		// TODO Auto-generated method stub
		List<Product> products1=new ArrayList<Product>();
		List<Product> products=beforeProductsDao.searchProductById(id);
		for (int i=0;i<products.size();i++) {
			Product product=products.get(i);
			product.setCategory_name(adminCategorysDao.searchCategory_name(product).getCategory_name());
			products1.add(product);
		}
		model.addAttribute("products", products1);
		return "before/introduction";
	}
}

package com.shop.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.AdminOrderitemsDao;
import com.shop.dao.AdminProductsDao;
import com.shop.dao.AdminUsersDao;
import com.shop.entity.Orderitem;
import com.shop.entity.Product;
import com.shop.entity.User;



@Service("adminOrderitemsService")
@Transactional
public class AdminOrderitemsService implements IAdminOrderitemsService {
	@Autowired
	private AdminOrderitemsDao adminOrderitemsDao;
	@Autowired
	private AdminProductsDao adminProductsDao;
	@Override
	public String searchAllOrderitems(Model model,String id,String money) {
		// TODO Auto-generated method stub
		List<Orderitem> allOrderitems=adminOrderitemsDao.searchAllOrderitems(id);
		System.out.println(allOrderitems.size());
		List<Orderitem> allOrderitems1=new ArrayList<Orderitem>();
		for (int i=0;i<allOrderitems.size();i++) {
			Orderitem orderitem=allOrderitems.get(i);
			Product product=adminProductsDao.searchProductById(orderitem.getProduct_id());
			orderitem.setProduct(product);
			allOrderitems1.add(orderitem);
		}
		model.addAttribute("orderitemSize", allOrderitems1.size());	
		model.addAttribute("allOrderitems", allOrderitems1);
		model.addAttribute("money", money);
		return "admin/order-detail";
	}

}

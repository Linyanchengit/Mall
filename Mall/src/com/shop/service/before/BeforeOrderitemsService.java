package com.shop.service.before;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.AdminCategorysDao;
import com.shop.dao.AdminProductsDao;
import com.shop.dao.BeforeOrderitemsDao;
import com.shop.entity.Orderitem;

@Service("beforeOrderitemsService")
@Transactional
public class BeforeOrderitemsService implements IBeforeOrderitemsService {
	@Autowired
	private BeforeOrderitemsDao beforeOrderitemsDao;
	@Autowired
	private AdminProductsDao adminProductsDao;
	@Override
	public void addOrderitem(Orderitem orderitem) {
		// TODO Auto-generated method stub
		beforeOrderitemsDao.addOrderitem(orderitem);
	}

	@Override
	public String searchOrderitemsById(Model model,String id) {
		// TODO Auto-generated method stub
		List<Orderitem> orderitems=beforeOrderitemsDao.searchOrderitemsById(id);
		List<Orderitem> orderitems1=new ArrayList<Orderitem>();
		for (int i=0;i<orderitems.size();i++) {
			Orderitem orderitem=orderitems.get(i);
			orderitem.setProduct(adminProductsDao.searchProductById(orderitem.getProduct_id()));
			orderitems1.add(orderitem);
		}
		model.addAttribute("orderitems", orderitems1);
		return "before/orderitems";
	}

}

package com.shop.service.before;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.BeforeOrdersDao;
import com.shop.entity.Order;
@Service("beforeOrdersService")
@Transactional
public class BeforeOrdersService implements IBeforeOrdersService {
	@Autowired
	private BeforeOrdersDao beforeOrdersDao;
	@Override
	public String addOrder(Order order) {
		// TODO Auto-generated method stub
		beforeOrdersDao.addOrder(order);
		return "forward:/before/orders?id="+order.getUser_id();
	}

	@Override
	public String searchOrdersById(Model model,Integer id) {
		// TODO Auto-generated method stub
		List<Order> userOrders=beforeOrdersDao.searchOrdersById(id);
		model.addAttribute("userOrders", userOrders);
		return "before/orders";
	}

}

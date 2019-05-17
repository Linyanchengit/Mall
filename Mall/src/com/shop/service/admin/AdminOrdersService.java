package com.shop.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;







import com.shop.dao.AdminOrdersDao;
import com.shop.dao.AdminUsersDao;
import com.shop.entity.Category;
import com.shop.entity.Order;
import com.shop.entity.Orderitem;
import com.shop.entity.Product;
import com.shop.entity.User;




@Service("adminOrdersService")
@Transactional
public class AdminOrdersService implements IAdminOrdersService {
	@Autowired
	private AdminOrdersDao adminOrdersDao;
	@Autowired
	private AdminUsersDao adminUsersDao;
	@Override
	public String selectAllOrders(Model model) {
		// TODO Auto-generated method stub
		List<Order> allOrders=adminOrdersDao.selectAllOrders();
		int total=allOrders.size();
		List<Order> allOrders1=new ArrayList<Order>();
		if (allOrders!=null) {
			for (int i=0;i<total;i++) {
				Order order=allOrders.get(i);
				if (adminUsersDao!=null) {
						User user=adminUsersDao.searchUserById(order);
						//System.out.println(c);
						if (user!=null) {
							order.setUsername(user.getUsername());
						}
						allOrders1.add(order);
					}
			 }
		}
		model.addAttribute("allOrders", allOrders1);
		model.addAttribute("OrdersSize", allOrders.size());
		return "admin/order-list";
	}
	@Override
	public String searchOrderitem(Model model, String id) {
		// TODO Auto-generated method stub
		Orderitem orderitem=new Orderitem();
		orderitem.setOrder_id(id);
		return null;
	}
	@Override
	public String selectOrderById(Model model, String id) {
		// TODO Auto-generated method stub
		List<Order> allSearchOrders=adminOrdersDao.selectOrderById(id);
		List<Order> allSearchOrders1=new ArrayList<Order>();
		if (allSearchOrders!=null) {
			for (int i=0;i<allSearchOrders.size();i++) {
				Order order=allSearchOrders.get(i);
				if (adminUsersDao!=null) {
						User user=adminUsersDao.searchUserById(order);
						//System.out.println(c);
						if (user!=null) {
							order.setUsername(user.getUsername());
						}
						allSearchOrders1.add(order);
					}
			 }
		}
		model.addAttribute("allSearchOrders", allSearchOrders1);
		model.addAttribute("allSearchOrdersSize", allSearchOrders.size());
		return "admin/order-search";
	}

}

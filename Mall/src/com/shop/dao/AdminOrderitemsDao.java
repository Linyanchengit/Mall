package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Orderitem;

@Repository("adminOrderitemsDao")
@Mapper
public interface AdminOrderitemsDao {
	public List<Orderitem> searchAllOrderitems(String id);
}

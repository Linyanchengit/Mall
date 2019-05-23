package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Orderitem;
@Repository("beforeOrderitemsDao")
@Mapper
public interface BeforeOrderitemsDao {
	public boolean addOrderitem(Orderitem orderitem);
	public List<Orderitem> searchOrderitemsById(String id);
}

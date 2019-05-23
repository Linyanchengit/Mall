package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Cart;
@Repository("beforeCartsDao")
@Mapper
public interface BeforeCartsDao {
	public boolean addCarts(Cart cart);
	public boolean deleteCartById(Integer carts_id);
	public List<Cart> searchAllCarts();
	public Cart searchCartById(Integer carts_id);
}

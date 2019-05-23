package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Product;

@Repository("beforeProductsDao")
@Mapper
public interface BeforeProductDao {
	public List<Product> searchProductsByCategory(Integer category_id);
	public List<Product> searchProductById(String id);
}

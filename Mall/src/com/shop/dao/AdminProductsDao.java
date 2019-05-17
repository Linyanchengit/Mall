package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Product;

@Repository("adminProductsDao")
@Mapper
public interface AdminProductsDao {
	public List<Product> searchAllProducts();
	public List<Product> searchAllProductsByPage(Map<String, Object> map);
	public boolean Offsale(Product product);
	public boolean Onsale(Product product);
	public boolean deleteProductById(Product product);
	public boolean addProduct(Product product);
	public boolean deleteProducts(List<String> ids);
	public List<Product> searchAllhistoryProducts();
	public boolean reductionProduct(Product product);
	public Product searchProductById(String id);
	public List<Product> searchProductByName(String name);
	public List<Product> searchProductByCategory(String category_name);
	public boolean updateProductById(Product product);
}

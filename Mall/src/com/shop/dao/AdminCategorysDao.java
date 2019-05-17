package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Category;
import com.shop.entity.Product;


@Repository("adminCategorysDao")
@Mapper
public interface AdminCategorysDao {
	public Category searchCategory_name(Product product);
	public boolean insertCategory(Category category);
	public List<Category> searchAllCategory();
	public boolean deleteCategory(Integer category_id);
}

package com.shop.service.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.shop.entity.Product;

public interface IAdminProductsService {
	public String searchProduct(Model model, Integer id, String act);
	public String deleteAllProducts(Integer ids[], Model model);
	public String Offsale(String id,Integer status,Model model);
	public String Onsale(String id,Integer status,Model model);
	public String addProduct(Product product, HttpServletRequest request, String updateAct);
	public String updateProduct(Product product, HttpServletRequest request, String updateAct);
	public String searchAllProducts(Model model, Integer pageCur, String act);
	public String deleteProductById(String id,Integer status,Model model);
	public String deleteProducts(String ids[], Model model);
	public String searchAllhistoryProducts(Model model);
	public String reductionProduct(String id,Integer status);
	public String searchProducts(Model model,String type,String s);
	public String updateProductById(String name,Double cost,Double price,Integer pnum,String description,String id);
}

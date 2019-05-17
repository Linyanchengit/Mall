package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.dao.AdminCategorysDao;
import com.shop.entity.Category;
import com.shop.entity.Product;
import com.shop.service.admin.AdminProductsService;
import com.shop.service.admin.IAdminCategorysService;
import com.shop.service.admin.IAdminProductsService;
import com.shop.utils.MakeIdUtil;
import com.shop.utils.UploadUtil;

@Controller
@RequestMapping("/admin")
public class AdminProductsController {
	@Autowired
	private IAdminProductsService adminProductsService;
	@Autowired
	private AdminCategorysDao adminCategorysDao;
	@RequestMapping("/index")
	public String index() {
		return "/admin/index";
	}
	@RequestMapping("/Offsale")
	public String Offsale(String id,Integer status, Model model) {
		return adminProductsService.Offsale(id,status,model);
	}
	
	@RequestMapping("/Onsale")
	public String Onsale(String id,Integer status, Model model) {
		return adminProductsService.Onsale(id,status,model);
	}
	
	@RequestMapping("/deleteProductById")
	public String deleteProductById(String id,Integer status, Model model) {
		return adminProductsService.deleteProductById(id,status,model);
	}
	
	@RequestMapping("/welcome")
	public String weclome() {
		return "/admin/welcome";
	}
	
	@RequestMapping("/product-add")
	public String productAdd(Model model,HttpServletRequest request,HttpSession session) {
		List<Category> allCategorys=adminCategorysDao.searchAllCategory();
		System.out.println(allCategorys.size());
		model.addAttribute("allCategorys",allCategorys);
		return "/admin/product-add";
	}
	@RequestMapping("/product-list")
	public String productlist(Model model, Integer pageCur, String act) {
		return adminProductsService.searchAllProducts(model, pageCur, act);
		//return null;
	}
	@RequestMapping("/addProduct")
	public String addProduct(HttpServletRequest request,HttpServletResponse response) {
		Product product=UploadUtil.doupload(request, response);
		product.setId(MakeIdUtil.makeID());
		return adminProductsService.addProduct(product, request, "");
	}
	@RequestMapping("/deleteProducts")
	public String deleteProducts(Model model,String ids[]) {
		System.out.println(1);
		return adminProductsService.deleteProducts(ids, model);
	}
	@RequestMapping("/product-brand")
	public String product_history(Model model) {
		return adminProductsService.searchAllhistoryProducts(model);
	}
	@RequestMapping("/reduction")
	public String product_reduction(Model model) {
		return adminProductsService.searchAllhistoryProducts(model);
	}
	@RequestMapping("/searchproducts")
	public String search_products(Model model,String type,String s) {
		return adminProductsService.searchProducts(model, type, s);
	}
	@RequestMapping("/product-update")
	public String product_update(Model model,String id) {
		model.addAttribute("id", id);
		return "admin/product-update";
	}
	@RequestMapping("/updateProduct")
	public String updateProduct(String name, Double cost, Double price,
			Integer pnum, String description,String id) {
		return adminProductsService.updateProductById(name, cost, price, pnum, description, id);
	}
}

package com.shop.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;






import org.springframework.web.bind.annotation.RequestParam;

import com.shop.dao.AdminCategorysDao;
//import com.shop.dao.AdminCategorysDao;
import com.shop.dao.AdminProductsDao;
import com.shop.entity.Category;
import com.shop.entity.Product;
@Service("adminProductsService")
@Transactional
public class AdminProductsService implements IAdminProductsService {
	@Autowired
	private AdminProductsDao adminProductsDao;
	@Autowired
	private AdminCategorysDao adminCategorysDao;
	@Override
	public String searchProduct(Model model, Integer id, String act) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteAllProducts(Integer[] ids, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String Offsale(String id,Integer status, Model model) {
		// TODO Auto-generated method stub
		Product product=new Product();
		product.setStatus(status);
		product.setId(id);
		adminProductsDao.Offsale(product);
		return "forward:/admin/product-list";
	}

	@Override
	public String Onsale(String id,Integer status, Model model) {
		// TODO Auto-generated method stub
		Product product=new Product();
		product.setStatus(status);
		product.setId(id);
		adminProductsDao.Onsale(product);
		return "forward:/admin/product-list";
	}
	
	@Override
	public String deleteProductById(String id,Integer status, Model model) {
		// TODO Auto-generated method stub
		Product product=new Product();
		product.setStatus(status);
		product.setId(id);
		adminProductsDao.deleteProductById(product);
		return "forward:/admin/product-list";
	}
	
	@Override
	public String addProduct(Product product, HttpServletRequest request,
			String updateAct) {
		// TODO Auto-generated method stub
		adminProductsDao.addProduct(product);
		return "forward:/admin/product-list";
	}

	@Override
	public String updateProduct(Product product, HttpServletRequest request,
			String updateAct) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String searchAllProducts(Model model, Integer pageCur, String act) {
		// TODO Auto-generated method stub
		List<Product> allProducts=adminProductsDao.searchAllProducts();
		int total=allProducts.size();
		List<Product> allProducts1=new ArrayList<Product>();
		if (allProducts!=null) {
			for (int i=0;i<total;i++) {
				Product product=allProducts.get(i);
				if (adminCategorysDao!=null) {
						Category c=adminCategorysDao.searchCategory_name(product);
						//System.out.println(c);
						if (c!=null) {
							product.setCategory_name(c.getCategory_name());
						}
						allProducts1.add(product);
					}
			 }
		}
		/*
		for (int i=0;i<allProducts.size();i++) {
			System.out.println(1);
		}*/
		//model.addAttribute("allProducts",allProducts);/*
		//int temp=allProducts.size();
		//model.addAttribute("totalCount", temp);
		/*int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;*///总页数
		//} else {
			//返回大于或者等于指定表达式的最小整数
			/*totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 10 > temp) {
			pageCur = pageCur - 1;
		}*/
		//分页查询
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("startIndex", (pageCur - 1) * 10);//起始位置
		//map.put("perPageSize", 10);//每页10个
		//allProducts = adminProductsDao.searchAllProductsByPage(map);
		model.addAttribute("allProducts", allProducts1);
		model.addAttribute("total",total);
		//model.addAttribute("totalPage", totalPage);
		//model.addAttribute("pageCur", pageCur);
		return "admin/product-list";
	}

	@Override
	public String deleteProducts(String[] ids, Model model) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < ids.length; i++) {
			list.add(ids[i]);
			System.out.println(1);
		}
		System.out.println(1);
		adminProductsDao.deleteProducts(list);
		model.addAttribute("msg", "成功删除商品！");
		return "forward:/admin/product-list";
	}

	@Override
	public String searchAllhistoryProducts(Model model) {
		// TODO Auto-generated method stub
		List<Product> allProducts=adminProductsDao.searchAllhistoryProducts();
		int total=allProducts.size();
		List<Product> allHistoryProducts=new ArrayList<Product>();
		if (allProducts!=null) {
			for (int i=0;i<total;i++) {
				Product product=allProducts.get(i);
				if (adminCategorysDao!=null) {
						Category c=adminCategorysDao.searchCategory_name(product);
						//System.out.println(c);
						if (c!=null) {
							product.setCategory_name(c.getCategory_name());
						}
						allHistoryProducts.add(product);
					}
			 }
		}
		model.addAttribute("allHistoryProducts", allHistoryProducts);
		//model.addAttribute("total",total);
		//model.addAttribute("totalPage", totalPage);
		//model.addAttribute("pageCur", pageCur);
		return "/admin/product-brand";
	}

	@Override
	public String reductionProduct(String id, Integer status) {
		// TODO Auto-generated method stub
		Product product=new Product();
		product.setStatus(status);
		product.setId(id);
		adminProductsDao.reductionProduct(product);
		return "forward:/admin/product-brand";
	}
	@Override
	public String searchProducts(Model model,String type,String s) {
		List<Product> allsearchProducts=new ArrayList<Product>();
		List<Product> allsearchProducts1=new ArrayList<Product>();
		if (type.equals("1")) {
			allsearchProducts=adminProductsDao.searchProductByName(s);
		} else if (type.equals("2")) {
			allsearchProducts=adminProductsDao.searchProductByCategory(s);
		}
		if (allsearchProducts!=null) {
			for (int i=0;i<allsearchProducts.size();i++) {
				Product product=allsearchProducts.get(i);
				if (adminCategorysDao!=null) {
						Category c=adminCategorysDao.searchCategory_name(product);
						//System.out.println(c);
						if (c!=null) {
							product.setCategory_name(c.getCategory_name());
						}
						allsearchProducts1.add(product);
					}
			 }
		}
		model.addAttribute("allsearchProducts", allsearchProducts1);
		model.addAttribute("allsearchProductsSize", allsearchProducts.size());
		return "admin/product-search";
	}

	@Override
	public String updateProductById(String name, Double cost, Double price,
			Integer pnum, String description,String id) {
		// TODO Auto-generated method stub
		Product product=new Product();
		product.setName(name);
		product.setCost(cost);
		product.setPrice(price);
		product.setId(id);
		product.setPnum(pnum);
		product.setDescription(description);
		adminProductsDao.updateProductById(product);
		return "forward:/admin/product-list";
	}
}

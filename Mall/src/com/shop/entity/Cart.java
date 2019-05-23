package com.shop.entity;

public class Cart {
	private int carts_id;
	private int carts_quantity;
	private double carts_total;
	private String product_id;
	private int user_id;
	private Product product;
	public Cart() {
	
	}
	public int getCarts_id() {
		return carts_id;
	}
	public void setCarts_id(int carts_id) {
		this.carts_id = carts_id;
	}
	public int getCarts_quantity() {
		return carts_quantity;
	}
	public void setCarts_quantity(int carts_quantity) {
		this.carts_quantity = carts_quantity;
	}
	public double getCarts_total() {
		return carts_total;
	}
	public void setCarts_total(double carts_total) {
		this.carts_total = carts_total;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
}

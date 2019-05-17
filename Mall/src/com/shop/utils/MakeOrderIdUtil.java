package com.shop.utils;

public class MakeOrderIdUtil {
     public static String OrderId(String id) {
    	String order_id="";
    	int length=16;
    	char arr[]=id.toCharArray();
    	int len=id.length();
    	for (int i=0;i<length;i++) {
    		int index=(int)(Math.random()*len);
    		order_id+=arr[index];
    	}
		return order_id;
     }
     //main方法删除，并把该文件放入com.shop.utils包
     public static void main(String args[]) {
    	 String s="cqwwweiwrwerrnkdnksxbzxmaskludchuwe";
    	 System.out.println(MakeOrderIdUtil.OrderId(s));
     }
}

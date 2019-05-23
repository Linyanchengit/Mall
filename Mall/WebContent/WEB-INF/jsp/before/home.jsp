<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<style>
a:hover {
	color:red;
}
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>首页</title>

		<link href="resource/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="resource/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="resource/basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="resource/css/hmstyle.css" rel="stylesheet" type="text/css" />
		<script src="resource/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="resource/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

	</head>

	<body>
		<div class="hmtop">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd" style="margin-left:130px;">
							<i class="am-icon-shopping-cart  am-icon-fw" ></i>
							<a href="before/shopcart" style="color:#000;">购物车</a>
						</div>
					</div>
				</ul>
				<ul class="message-r">
				   <c:if test="${empty user}">
				   		<div class="topMessage home">
							<div class="menu-hd"><a href="before/login" target="_top" class="h">登录</a></div>
						</div>
						<div class="topMessage home">
							<div class="menu-hd"><a href="before/register" target="_top" class="h">注册</a></div>
						</div>
				   </c:if>
				   <c:if test="${user != null}">
				   		<div class="topMessage home">
							<div class="menu-hd"><a href="before" target="_top" class="h">商城首页</a></div>
						</div>
						<div class="topMessage home">
							<div class="menu-hd"><a href="before/information" target="_top" class="h">${user.username}</a></div>
						</div>
						<div class="topMessage home">
							<div class="menu-hd"><a href="before/orders?id=${user.id}" target="_top" class="h">订单</a></div>
						</div>
						<div class="topMessage home">
							<div class="menu-hd"><a href="before/exit" target="_top" class="h">注销</a></div>
						</div>
				</c:if>
				</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logo"><img src="resource/images/logo.png" /></div>
					<div class="logoBig">
						<li><img src="resource/images/timg.jpg"  width="200" height="90"/></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form style="border:2px solid rgb(184,28,34);">
							<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="请输入商品的名称" autocomplete="off" >
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit" style="background: rgb(184,28,34);">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
			
			
			<div class="banner">
                      <!--轮播 -->
						<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
							<ul class="am-slides">
								<li class="banner1"><a href="introduction.html"><img src="resource/images/557.png" /></a></li>
								<li class="banner2"><a><img src="resource/images/557.png" /></a></li>
								<li class="banner3"><a><img src="resource/images/557.png" /></a></li>
								<li class="banner4"><a><img src="resource/images/557.png" /></a></li>

							</ul>
						</div>
						<div class="clear"></div>	
			</div>						
			
			<div class="shopNav">
				<div class="slideall">
			        <!--  
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">

									</div>-->
								</div>

							</div>
						</div>
						<!--轮播 -->
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>


					<!--小导航 -->
					<div class="am-g am-g-fixed smallnav">
						<div class="am-u-sm-3">
							<a href="sort.html"><img src="../images/navsmall.jpg" />
								<div class="title">商品分类</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="../images/huismall.jpg" />
								<div class="title">大聚惠</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="../images/mansmall.jpg" />
								<div class="title">个人中心</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="../images/moneysmall.jpg" />
								<div class="title">投资理财</div>
							</a>
						</div>
					</div>

					<!--走马灯 -->

					<div class="marqueen" style="margin-right:50px;margin-top:130px;">
						<c:forEach items="allNotices" var="notice">
							<div><a>${notice.title }</a></div>
						</c:forEach>
					</div>
					<div class="clear"></div>
				</div>
				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<div class="clear "></div>


                 
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>零食</h4><!--  
							<div class="today-brands ">
								<a href="# ">小鱼干</a>
								<a href="# ">海苔</a>
								<a href="# ">鱿鱼丝</a>
								<a href="# ">海带丝</a>
							</div>-->
							<span class="more ">
                    <a class="more-link " href="# ">更多美味</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed flood method3 ">
						<ul class="am-thumbnails " >
						   <c:forEach items="${foods }" var="product">
							  <li style="width:190px;height:250px;margin-top:20px;margin-left:10px;">
								<div class="list" style="background:#d4d4d4;">
									<a href="before/introduction?id=${product.id}">
										<img src="${product.imgurl }" width="188" height="188" />
										<div class="pro-title "><a href="before/introduction?id=${product.id}">${product.name }</a></div>
										<span class="e-price ">￥ ${product.price}</span>
									</a>
								</div>
							</li>
						 </c:forEach>
						</ul>
					</div>
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>水果</h4><!--  
							<div class="today-brands ">
								<a href="# ">小鱼干</a>
								<a href="# ">海苔</a>
								<a href="# ">鱿鱼丝</a>
								<a href="# ">海带丝</a>
							</div>-->
							<span class="more ">
                    <a class="more-link " href="# ">更多水果</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed flood method3 " >
						<ul class="am-thumbnails ">
						   <c:forEach items="${fruits }" var="product">
							  <li style="width:190px;height:250px;margin-top:20px;margin-left:10px;">
								<div class="list " style="background:#d4d4d4;">
									<a href="before/introduction?id=${product.id}">
										<img src="${product.imgurl }" width="188" height="188" />
										<div class="pro-title "><a href="before/introduction?id=${product.id}">${product.name }</a></div>
										<span class="e-price ">￥ ${product.price}</span>
									</a>
								</div>
							</li>
						 </c:forEach>
						</ul>
					</div>
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>日用品</h4><!--  
							<div class="today-brands ">
								<a href="# ">小鱼干</a>
								<a href="# ">海苔</a>
								<a href="# ">鱿鱼丝</a>
								<a href="# ">海带丝</a>
							</div>-->
							<span class="more ">
                    <a class="more-link " href="# ">更多商品</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed flood method3 ">
						<ul class="am-thumbnails " >
						   <c:forEach items="${use }" var="product">
							  <li style="width:190px;height:250px;margin-top:20px;margin-left:10px;">
								<div class="list " style="background:#d4d4d4;">
									<a href="before/introduction?id=${product.id}">
										<img src="${product.imgurl }" width="188" height="188" />
										<div class="pro-title "><a href="before/introduction?id=${product.id}">${product.name }</a></div>
										<span class="e-price ">￥ ${product.price}</span>
									</a>
								</div>
							</li>
						 </c:forEach>
						</ul>
					</div>
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">社区</a>
								<b>|</b>
								<a href="# ">商城首页</a>
								<b>|</b>
								<a href="# ">联系我们</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于商城</a>
								<a href="# ">交流合作</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em>© 版权所有，违者必究 </em>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!--引导 -->

		<div class="navCir">
			<li class="active"><a href="home3.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>

		<script>
			window.jQuery || document.write('<script src="resource/basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="resource/basic/js/quick_links.js "></script>
	</body>

</html>
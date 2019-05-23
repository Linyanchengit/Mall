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
							<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
						</div>
						<div class="topMessage home">
							<div class="menu-hd"><a href="#" target="_top" class="h">${user.username}</a></div>
						</div>
						<div class="topMessage home">
							<div class="menu-hd"><a href="#" target="_top" class="h">订单</a></div>
						</div>
						<div class="topMessage home">
							<div class="menu-hd"><a href="#" target="_top" class="h">注销</a></div>
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
		</body>
	</html>
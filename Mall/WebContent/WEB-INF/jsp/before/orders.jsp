<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="resource/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="resource/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="resource/css/cartstyle.css" rel="stylesheet" type="text/css" />
	<link href="resource/css/optstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="resource/js/jquery.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resource/css/layui.css">
    <link type="text/css" rel="stylesheet" href=resource/css/pageStyle.css"/>
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <style>
        td{
            word-break:keep-all;
            white-space:nowrap;
            overflow:hidden;
            text-overflow:ellipsis;
        }
    </style>
</head>
<body class="layui-layout-body" style="text-align:center;">
		<c:if test="${empty user }" >
  			<c:redirect url="http://localhost:8080/Mall/before/login">
  			</c:redirect>
 		</c:if>
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

			<div class="clear"></div>
			<p style="text-align:center;font-size:20px;">我的订单</p>
      <table class="layui-table">
                            <colgroup>
                                <col width="80">
                                <col width="50">
                                <col width="120">
                                <col width="120">
                                <col width="120">
                                <col width="120">
                                <col width="120">
                            </colgroup>
                            <thead>
                            <tr >
                               <th>订单id</th>
                                <th>订单金额</th>
                                <th>收件地址</th>
                                <th>收件人</th>
                                <th>联系电话</th>
                                <th>下单时间</th>
                                <th style="text-align:center;">详情</th>
                            </tr>
                            </thead>  
                            <tbody>
                               <c:forEach items="${userOrders}" var="order" >
                                  <tr>
                                  		<td>${order.id }</td>
                                  		<td>${order.money }</td>
                                  		<td>${order.receiverAddress }</td>
                                  		<td>${order.receiverName }</td>
                                  		<td>${order.receiverPhone }</td>
                                  		<td>${order.ordertime }</td>
                                  		<td style="text-align:center;">
                                  			<form action="before/orderitems" method="post">
                                  				<input type="hidden" name="id" value="${order.id }"/>
                                  				<button type="submit" class="btn btn-primary" >查看详情</button>
                                  			</form>
                                  		</td>
                                  </tr>
                                </c:forEach>   
                            </tbody>
                        </table>
 </body>
 </html>

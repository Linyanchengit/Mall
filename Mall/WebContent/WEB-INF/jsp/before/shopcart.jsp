<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="resource/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="resource/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="resource/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="resource/css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="resource/js/jquery.js"></script>

	</head>
<script type="text/javascript">

/*购物车-删除*/
function cart_del(id){
		console.log(id);
		$.ajax({
			type: 'GET',
			url: 'before/deleteCartById?carts_id='+id,
			success: function(data){
				
			},
			error:function(data) {
				
			},
		});		
}
</script>
	<body>
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
							<div class="menu-hd"><a href="before/orders?id=${user.id}" target="_top" class="h">订单${user.id }</a></div>
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

			<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
			<form method="post" action="before/addOrder">
				<c:forEach items="${allCarts}" var="cart">
					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="clear"></div>
							<div class="bundle-main">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox " id="cbx">
											<input class="check" id="J_CheckBox_170037950254" name="items" value="${cart.carts_id}" type="checkbox">
											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank" data-title="" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="${cart.product.imgurl }" class="itempic J_ItemImg" width="80" height="80"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<font style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品名称</font><br/>
												<a href="#" target="_blank" title="" class="item-title J_MakePoint" data-point="tbcart.8.11">${cart.product.name }</a>
											</div>
										</div>
									</li>  
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span class="sku-line">描述：${cart.product.description }</span><!--  
											<span class="sku-line">颜色：12#川南玛瑙</span>
											<span class="sku-line">包装：裸装</span>
											<span tabindex="0" class="btn-edit-sku theme-login">修改</span>
											<i class="theme-login am-icon-sort-desc"></i>-->
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content"><!--
												<div class="price-line">
													<em class="price-original">78.00</em>
												</div>  -->
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">${cart.product.price }</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl"><!--  
													<input class="min am-btn" name="" type="button" value="-" />-->
													<input class="text_box" name="carts_quantity[]" type="hidden" value="${cart.carts_quantity }"  />
													<p style="width:30px;margin-left:65px;" class="text_box">${cart.carts_quantity }</p>
													<!--  <input class="add am-btn" name="" type="button" value="+" />-->
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${cart.carts_total }</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner"><!-- 
											<a title="移入收藏夹" class="btn-fav" href="#">
                  移入收藏夹</a> -->              

								 	<a  href="before/shopcart" class="delete" onClick="cart_del('${cart.carts_id}')">
                  删除</a>
										</div>
									</li>
								</ul>		
							</div>
						</div>
					</tr>
				</c:forEach>
					<div class="clear"></div>

					<tr class="item-list">

					</tr>
				</div>
				<div class="clear"></div>

				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span>全选</span>
					</div>
					<div class="operations">
						<a href="#" hidefocus="true" class="deleteAll">删除</a>
						<!-- <a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a> -->
					</div>
					<div class="float-bar-right">

						<input type="hidden" name="money" id="money" value="100000"/>
						<input type="hidden" name="user_id" value="${user.id }"/>
						<div class="btn-area">
							<input type="submit" id="J_Go" class="submit-btn submit-btn-disabled" style="background:#F40;border:none" value="结&nbsp;算"/>
						</div>
					</div>
				</form>
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

			<!--操作页面-->

			<div class="theme-popover-mask"></div>

			<div class="theme-popover">
				<div class="theme-span"></div>
				<div class="theme-poptit h-title">
					<a href="javascript:;" title="关闭" class="close">×</a>
				</div>
				<div class="theme-popbod dform">
					<form class="theme-signin" name="loginform" action="" method="post">

						<div class="theme-signin-left">

							<li class="theme-options">
								<div class="cart-title">颜色：</div>
								<ul>
									<li class="sku-line selected">12#川南玛瑙<i></i></li>
									<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
								</ul>
							</li>
							<li class="theme-options">
								<div class="cart-title">包装：</div>
								<ul>
									<li class="sku-line selected">包装：裸装<i></i></li>
									<li class="sku-line">两支手袋装（送彩带）<i></i></li>
								</ul>
							</li>
							<div class="theme-options">
								<div class="cart-title number">数量</div>
								<dd>
									<input class="min am-btn am-btn-default" name="" type="button" value="-" />
									<input class="text_box" name="" type="text" value="1" style="width:30px;" />
									<input class="add am-btn am-btn-default" name="" type="button" value="+" />
									<span  class="tb-hidden">库存<span class="stock">1000</span>件</span>
								</dd>

							</div>
							<div class="clear"></div>
							<div class="btn-op">
								<div class="btn am-btn am-btn-warning">确认</div>
								<div class="btn close am-btn am-btn-warning">取消</div>
							</div>

						</div>
						<div class="theme-signin-right">
							<div class="img-info">
								<img src="../images/kouhong.jpg_80x80.jpg" />
							</div>
							<div class="text-info">
								<span class="J_Price price-now">¥39.00</span>
								<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
							</div>
						</div>

					</form>
				</div>
			</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>
<script>
/*
function compute(obj) {
	var total=0;
	var items=document.getElementsByTagName("input");
	var count=0;
	for (var i=0;i<items.length;i++) {
		if (items[i].checked) {
			total+=parseFloat(items[i].value);
			count++;
		}
	}
	document.getElementById("J_Total").innerHTML=total+".00";
	document.getElementById("money").value=total;
	document.getElementById("J_SelectedItemsCount").innerHTML=count;
}
window.onload=function() {
	var cbx=document.getElementById("cbx");
	var inputs=document.getElementsByTagName("input");
	for (var i=0;i<inputs.length;i++) {
		inputs[i].onclick=function () {
			compute(this);
		}
	}
}
*/

</script>
</html>
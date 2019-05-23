<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品页面</title>

		<link href="resource/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="resource/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="resource/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="resource/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="resource/css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="resource/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="resource/basic/js/quick_links.js"></script>

		<script type="text/javascript" src="resource/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="resource/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="resource/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="resource/js/list.js"></script>
		<script type="text/javascript">
function add() {
	var a=document.getElementById("text_box");
	a.value=parseInt(a.val, 0)+1;
}


</script>
	</head>

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
			<div class="listMain" style="margin-top:40px;">

				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="resource/images/01.jpg" title="pic" />
								</li>
								<li>
									<img src="resource/images/02.jpg" />
								</li>
								<li>
									<img src="resource/images/03.jpg" />
								</li>
							</ul>
						</div>
					</section>
				</div>

				<!--放大镜-->
			<c:forEach items="${products }" var="product">
				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
								<a href="${product.imgurl  }"><img src="${product.imgurl }" alt="细节展示放大镜特效" rel="${product.imgurl }" class="jqzoom" /></a>
							</div>

						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">

						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>	
				 	${product.name }
	          </h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									
									<dd>价格：${product.price }  </dd>                                 
								</li> 
								<li class="price iteminfo_mktprice">
									<dd>库存：${product.pnum }</dd>									
								</li><!--  
								<li class="price iteminfo_mktprice">
									<dt>数量</dt>
									<dd><em></em><b class="sys_item_price">${product.pnum }</b></dd>									
								</li>--> 
								<div class="clear"></div>
							</div>

							<!--地址--> <!--  
							<dl class="iteminfo_parameter freight">
								<dt>配送至</dt>
								<div class="iteminfo_freprice">
									<div class="am-form-content address">
										<select data-am-selected>
											<option value="a">浙江省</option>
											<option value="b">湖北省</option>
										</select>
										<select data-am-selected>
											<option value="a">温州市</option>
											<option value="b">武汉市</option>
										</select>
										<select data-am-selected>
											<option value="a">瑞安区</option>
											<option value="b">洪山区</option>
										</select>
									</div>
									<div class="pay-logis">
										快递<b class="sys_item_freprice">10</b>元
									</div>
								</div>
							</dl>-->
							<div class="clear"></div>


							<div class="clear"></div>
							<div style="margin-top:10px;margin-left:10px;">种类: ${product.category_name }</div>
							<div style="margin-top:10px;margin-left:10px;">描述: ${product.description }</div>
							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="before/addcart" method="post">

												<div class="theme-signin-left">

													

													<div class="theme-options">
														<div class="cart-title number" style="margin-top:4px;">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" onClick="descrease(this)" />
															<input id="text_box" name="carts_quantity" type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" onClick="add()"/>
															<span id="Stock" class="tb-hidden"><span class="stock"></span></span>
														</dd>

													</div>
													<div class="clear"></div>
													<input type="hidden" name="price" value="${product.price }"/>
													<input type="hidden" name="product_id" value="${product.id }"/>
													<input type="hidden" name="user_id" value="${user.id }"/>
													<div class="btn-op">
														<div class="btn am-btn am-btn-warning">确认</div>
														<div class="btn close am-btn am-btn-warning">取消</div>
													</div>
												</div>
												<div class="theme-signin-right">
													<div class="img-info">
														<img src="resource/images/songzi.jpg" />
													</div>
													<div class="text-info">
														<span class="J_Price price-now">¥39.00</span>
														<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
													</div>
												</div>

											
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
						</c:forEach>	

						</div>

						<div class="pay">
							<div class="pay-opt">
							<a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
							<a><span class="am-icon-heart am-icon-fw">收藏</span></a>
							
							</div> 
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login"><!--
									<a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>-->
								</div>
							</li> 
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<!--  <a id="LikBasket" title="加入购物车" href="#"><i></i>加入购物车</a>-->
									<input type="submit" id="LikBasket" value="加入购物车" style="width:98px;border: 1px solid #F03726;height: 30px;line-height: 30px;background-color: #FFEDED;    color: #F03726;"/>
								</div>
							</li>
						</div>
					  </form>
					</div>

					<div class="clear"></div>

				</div>

						<div class="clear"></div>

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

				<div id="prof-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						我
					</div>
				</div>
				<div id="shopCart-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						购物车
					</div>
				</div>
				<div id="asset-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						资产
					</div>

					<div class="ia-head-list">
						<a href="#" target="_blank" class="pl">
							<div class="num">0</div>
							<div class="text">优惠券</div>
						</a>
						<a href="#" target="_blank" class="pl">
							<div class="num">0</div>
							<div class="text">红包</div>
						</a>
						<a href="#" target="_blank" class="pl money">
							<div class="num">￥0</div>
							<div class="text">余额</div>
						</a>
					</div>

				</div>
				<div id="foot-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						足迹
					</div>
				</div>
				<div id="brand-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						收藏
					</div>
				</div>
				<div id="broadcast-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						充值
					</div>
				</div>
			</div>

	</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>历史记录</title>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script> 
<!--  [endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!--[if IE 6]-->
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
</head>
<body>
		<nav class="breadcrumb">
			<h4 style="text-align:center;display:inline-block;line-height:15px;">历史纪录</h4>
			<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
			<div class="mt-20">  
			<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40">产品序号</th>
					<th>种类</th>
					<th width="100">缩略图</th>
					<th width="60">产品名称</th>
					<th>描述</th>
					<th>原价</th>
					<th width="100">单价</th>
					<th>数量</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			 <%int i=1; %>
			  <c:forEach items="${allHistoryProducts}" var="product">
				<tr class="text-c va-m">
					<td width="70"><%=i++ %></td>
					<td width="60">${product.category_name }</td>
					<td class="text-l" width="100"><a style="text-decoration:none" onClick="product_show('哥本哈根橡木地板','product-show.html','10001')" href="javascript:;"><img title="国内品牌" src="static/h-ui.admin/images/cn.gif"> <b class="text-success">圣象</b> 哥本哈根橡木地板KS8373</a></td>
					<td width="60">${product.name }</td>
					<td class="text-l" width="100">${product.description }</td>
					<td width="100"><span class="price">${product.cost}</span> 元</td>
					<td width="60">${product.price }</td>
					<td width="60">${product.pnum }</td>
					<td class="td-manage" width="100"><a style="text-decoration:none" onClick="product_reduction(this,'${product.id}')" href="javascript:;" title="还原"><i class="Hui-iconfont">&#xe6de;</i></a>
				   </tr>
			  </c:forEach>
			</tbody>
		</table>
	</div>
</body>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
/*产品-还原*/
function product_reduction(obj,id){
	layer.confirm('确认要恢复吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已恢复!',{icon: 6,time:1000});
        $.ajax({
            type: "GET",
            url: 'admin/Onsale?id='+id+"&status=1",
        });
		//window.location.href = "/Mall/admin/deleteProduct?id="+1;
	});
	//});
}

</script>
</html>
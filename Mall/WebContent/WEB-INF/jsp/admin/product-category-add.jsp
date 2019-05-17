<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>添加产品分类</title>
</head>
<body>
<nav class="breadcrumb">
			<h4 style="text-align:center;display:inline-block;line-height:15px;">分类管理</h4>
			<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
<div class="page-container">
	<form action="admin/toAddCategory" method="post" class="form form-horizontal" id="form-user-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				分类名称：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text" value="" placeholder="" id="user-name" name="category_name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">备注：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<textarea name="remarks" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" onKeyUp="$.Huitextarealength(this,100)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-2">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<div class="page-container">
<div class="mt-20">   <!-- onclick="datadel()" -->   <!-- href="admin/deleteProducts"  -->
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c" >
					<td>种类ID</td>
					<td>种类名称</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody >
				 <c:forEach items="${allCategorys}" var="category">
				 	<tr >
				 		<td style="text-align:center;">${category.category_id }</td>
				 		<td style="text-align:center;">${category.category_name }</td>
				 		<td style="text-align:center;">${category.remarks }</td>
				 		<td class="td-manage" width="100" style="text-align:center;"><a style="text-decoration:none" onClick="category_delete(this,'${category.category_id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
				 	</tr>
				 </c:forEach>
			</tbody>
		</table>
</div></div>
<!--_footer ä½ä¸ºå¬å±æ¨¡çåç¦»åºå»-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer ä½ä¸ºå¬å±æ¨¡çåç¦»åºå»-->

<!--è¯·å¨ä¸æ¹åæ­¤é¡µé¢ä¸å¡ç¸å³çèæ¬-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
/*产品-还原*/
function category_delete(obj,id){
	layer.confirm('确定要删除吗？',function(index){
		//$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		//$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		//$(obj).remove();
		layer.msg('已删除!',{icon: 6,time:1000});
        $.ajax({
            type: "GET",
            url: 'admin/deleteCategory?category_id='+id,
        });
		//window.location.href = "/Mall/admin/deleteProduct?id="+1;
	});
	//});
}

</script>
<script type="text/javascript">
$(function(){
	
});
</script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>"><!DOCTYPE HTML>
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
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>ç¨æ·ç®¡ç</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> é¦é¡µ <span class="c-gray en">&gt;</span> ç¨æ·ä¸­å¿ <span class="c-gray en">&gt;</span> ç¨æ·ç®¡ç <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="å·æ°" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
  <div class="text-c"> æ¥æèå´ï¼
    <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
    -
    <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
    <input type="text" class="input-text" style="width:250px" placeholder="è¾å¥ä¼ååç§°ãçµè¯ãé®ç®±" id="" name=""><button type="submit" class="btn btn-success" id="" name=""><i class="icon-search"></i> æç¨æ·</button>

  </div>
  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="icon-trash"></i> æ¹éå é¤</a>
    <a href="javascript:;" onclick="user_add('550','','æ·»å ç¨æ·','user-add.html')" class="btn btn-primary radius"><i class="icon-plus"></i> æ·»å ç¨æ·</a></span>
    <span class="r">å±ææ°æ®ï¼<strong>88</strong> æ¡</span>
  </div>
  <table class="table table-border table-bordered table-hover table-bg table-sort">
    <thead>
      <tr class="text-c">
        <th width="25"><input type="checkbox" name="" value=""></th>
        <th width="80">ID</th>
        <th width="100">ç¨æ·å</th>
        <th width="40">æ§å«</th>
        <th width="90">ææº</th>
        <th width="150">é®ç®±</th>
        <th width="">å°å</th>
        <th width="130">å å¥æ¶é´</th>
        <th width="70">ç¶æ</th>
        <th width="100">æä½</th>
      </tr>
    </thead>
    <tbody>
      <tr class="text-c">
        <td><input type="checkbox" value="1" name=""></td>
        <td>1</td>
       
        <td><u style="cursor:pointer" class="text-primary" onclick="user_show('10001','360','','å¼ ä¸','user-show.html')">å¼ ä¸</u></td>
        <td>ç·</td>
        <td>13000000000</td>
        <td>admin@mail.com</td>
        <td class="text-l">åäº¬å¸ æµ·æ·åº</td>
        <td>2014-6-11 11:11:42</td>
        <td class="user-status"><span class="label label-success">å·²å¯ç¨</span></td>
        <td class="f-14 user-manage"><a style="text-decoration:none" onClick="user_stop(this,'10001')" href="javascript:;" title="åç¨"><i class="icon-hand-down"></i></a> <a title="ç¼è¾" href="javascript:;" onclick="user_edit('4','550','','ç¼è¾','user-add.html')" class="ml-5" style="text-decoration:none"><i class="icon-edit"></i></a> <a style="text-decoration:none" class="ml-5" onClick="user_password_edit('10001','370','228','ä¿®æ¹å¯ç ','user-password-edit.html')" href="javascript:;" title="ä¿®æ¹å¯ç "><i class="icon-key"></i></a> <a title="å é¤" href="javascript:;" onclick="user_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="icon-trash"></i></a></td>
      </tr>
    </tbody>
  </table>
  <div id="pageNav" class="pageNav"></div>
</div>
<!--_footer ä½ä¸ºå¬å±æ¨¡çåç¦»åºå»-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer ä½ä¸ºå¬å±æ¨¡çåç¦»åºå»-->

<!--è¯·å¨ä¸æ¹åæ­¤é¡µé¢ä¸å¡ç¸å³çèæ¬-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
window.onload = (function(){
    // optional set
    pageNav.pre="&lt;ä¸ä¸é¡µ";
    pageNav.next="ä¸ä¸é¡µ&gt;";
    // p,å½åé¡µç ,pn,æ»é¡µé¢
    pageNav.fn = function(p,pn){$("#pageinfo").text("å½åé¡µ:"+p+" æ»é¡µ: "+pn);};
    //éååé¡µç¶æ,è·³å°ç¬¬ä¸é¡µ,æ»é¡µ33é¡µ
    pageNav.go(1,13);
});
$('.table-sort').dataTable({
	"lengthMenu":false,//æ¾ç¤ºæ°ééæ© 
	"bFilter": false,//è¿æ»¤åè½
	"bPaginate": false,//ç¿»é¡µä¿¡æ¯
	"bInfo": false,//æ°éä¿¡æ¯
	"aaSorting": [[ 1, "desc" ]],//é»è®¤ç¬¬å ä¸ªæåº
	"bStateSave": true,//ç¶æä¿å­
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //æ§å¶åçéèæ¾ç¤º
	  {"orderable":false,"aTargets":[0,8,9]}// å¶å®åä¸åä¸æåº
	]
});
</script>
</body>
</html>

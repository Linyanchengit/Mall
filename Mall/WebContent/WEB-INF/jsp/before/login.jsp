<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <link href="resource/css/1.css" rel="stylesheet">
      <link href="resource/css/2.css" rel="stylesheet">
  </head>
  <body>
  	
  <form method="post" action="before/login">
 <!--登入-->
    <div class="content loginWrap">
        <input type="hidden" id="loginurl" value="">
        <div class="w1000">
            <div class="loginForm">
                <div class="loginTitle"><b>用户登录</b></div>
                <div class="loginInputWrap">
                    <div class="inputItem">
                        <div class="labInpWr">
                            <div class="label">
                                <span>用户名：</span>
                            </div>
                            <div class="inputWrap">
                                <span class="inputPad">
                                    <input type="text" style="display: none">
                                    <input type="password" style="display: none">
                                    <input type="text" name="username" class="inputBlock" value="" autocomplete="off" id="userName" placeholder="用户名/邮箱">
                                </span>
                                <span class="clearInput" style="display: none;"></span>
                            </div>
                        </div>
                        <div class="megTip">
                            <span>请输入用户名/邮箱</span>
                        </div>
                    </div>
                    <div class="inputItem">
                        <div class="labInpWr">
                            <div class="label">
                                <span>密码：</span>
                            </div>
                            <div class="inputWrap">
                                <span class="inputPad">
                                    <input type="password" name="password" class="inputBlock" id="userPas" autocomplete="off" placeholder="密码">
                                </span>
                                <span class="clearInput" style="display: none;"></span>
                            </div>
                        </div>
                        <div class="megTip">
                            <span>请输入密码</span>
                        </div>
                    </div>
                    
                    <div class="loginBtn" id="loginBtn">
                         <input type="submit" value="登录" id="a" />

                    </div>
                </div>
            </div>
        </div>
    </div>

<div style="display:none">
    <script>/*
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?6993f0ad5f90f4e1a0e6b2d471ca113a";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();*/
    </script>
</div>


    <script language="javascript" type="text/javascript">
/*        NTKF_PARAM = {
            siteid: "kf_9067",		             //企业ID，为固定值，必填
            settingid: "kf_9067_1501484109259",	 //接待组ID，为固定值，必填
            uid: "",		                 //用户ID，未登录可以为空，但不能给null，uid赋予的值在显示到小能客户端上
            uname: "",		     //用户名，未登录可以为空，但不能给null，uname赋予的值显示到小能客户端上
            isvip: "0",                           //是否为vip用户，0代表非会员，1代表会员，取值显示到小能客户端上
            userlevel: "1",		                 //网站自定义会员级别，0-N，可根据选择判断，取值显示到小能客户端上
            erpparam: "abc",                      //erpparam为erp功能的扩展字段，可选，购买erp功能后用于erp功能集成
            ntalkerparam: {
            category: "帮助中心",    //分类名称，多分类可以用分号(;)分隔， 长路径父子间用冒号(:)分割
            brand: ""             //品牌名称，多品牌可以用分号(;)分隔
            }
        }*/
    </script>
</form>    
</body></html>

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
 <!-- 注册 -->
<form action="before/register" method="post">
    <div class="content registWrap">
        <div class="w1000">
            <div class="registForm" id="registForm">

                <div class="registTitle">
                    <b>新用户注册</b>
                    <div class="backLogin">已有账号？<a href="before/login">请登录</a></div>
                </div>

                <div class="registInputWrap">

                    <div class="inputItem">


                        <div class="labInpWr">

                            <div class="label">
                                <span>账户名：</span>
                            </div>

                            <div class="inputWrap">
                                <span class="inputPad">
                                    <input type="text" style="display:none" />
                                    <input type="password" style="display:none" />
                                    <input type="text" name="username" placeholder="请输入您的账户名" autocomplete="off" data-holder="请输入您的账户名" class="inputBlock required" keycodes="tel" tabindex="1" data-valid="isNonEmpty||isPhone||isRegist" data-error="请输入您的账户名||账户名格式不正确，请重新输入||该号码已被注册，<a href='/RegUser/Login.aspx'>登录？</a>&nbsp;&nbsp;<a href='/RegUser/forgetpwd.aspx'>找回密码？</a> 若继续注册将与原账号解绑" maxlength="11" id="phone" />
                                </span>
                                <span class="clearInput"></span>
                            </div>
                            <div class="sucessWrap"></div>
                           
                        
                        </div>
                         
                        <div class="megTip" data-defaultmeg="请输入账户名">
                            <span>请输入账户名</span>
                        </div>


                    </div>
                    <div class="inputItem">

                        <div class="labInpWr">

                            <div class="label">
                                <span>设置密码：</span>
                            </div>

                            <div class="inputWrap">
                                <span class="inputPad">
                                    <input type="password" name="password" id="password" placeholder="请输入密码" data-holder="请输入密码" maxlength="16" class="inputBlock required" tabindex="2" style="ime-mode: disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-18||level:2" data-error="请输入密码||长度只能在6-16位||密码过于单一，建议两种以上字符组合" />
                                </span>
                                <span class="clearInput"></span>
                            </div>
                            <div class="sucessWrap"></div>
                        </div>

                        <div class="megTip">
                            <span>请设置6到16位登录密码</span>
                        </div>


                    </div>


                    <div class="inputItem">

                        <div class="labInpWr">

                            <div class="label">
                                <span>确认密码：</span>
                            </div>

                            <div class="inputWrap">
                                <span class="inputPad">
                                    <input type="password" name="repassword" placeholder="请再次输入密码" data-holder="请再次输入密码" maxlength="16" class="inputBlock required" tabindex="3" style="ime-mode: disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-18||isRepeat:password" data-error="密码不能为空||长度只能在6-16位||两次输入密码不一致，请重新输入" id="rePassword" />
                                </span>
                                <span class="clearInput"></span>
                            </div>
                            <div class="sucessWrap"></div>
                        </div>

                        <div class="megTip" data-defaultmeg="请再次输入密码">
                            <span>请再次输入密码</span>
                        </div>


                    </div>

                    

                    <div class="registBtn" id="registBtn">
                        <input type="submit" value="立即注册" id="a"/>
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
       /* NTKF_PARAM = {
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
       </div>
       <script type="text/javascript" src="../js/Register.js?v=2"></script>
  
</form>
</body>
</html>


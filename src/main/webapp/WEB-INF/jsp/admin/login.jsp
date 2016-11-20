<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7 0007
  Time: 下午 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="basePath" value="<%=basePath%>" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin|后台</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${basePath}static/admin/assets/i/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="${basePath}static/admin/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="${basePath}static/admin/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${basePath}static/admin/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${basePath}static/admin/assets/css/app.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basePath}static/admin/bootstrap/css/bootstrap.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <script src="${basePath}static/admin/assets/js/jquery.min.js"></script>
</head>

<body data-type="login">
<jsp:include page="common/message.jsp"/>
<script src="${basePath}static/admin/assets/js/theme.js"></script>
<div class="am-g tpl-g">
    <!-- 风格切换 -->
    <div class="tpl-skiner">
        <div class="tpl-skiner-toggle am-icon-cog">
        </div>
        <div class="tpl-skiner-content">
            <div class="tpl-skiner-content-title">
                选择主题
            </div>
            <div class="tpl-skiner-content-bar">
                <span class="skiner-color skiner-white" data-color="theme-white"></span>
                <span class="skiner-color skiner-black" data-color="theme-black"></span>
            </div>
        </div>
    </div>
    <div class="tpl-login">
        <div class="tpl-login-content">
            <div class="tpl-login-logo">

            </div>

            <form class="am-form tpl-form-line-form" id="loginForm" action="<%=basePath%>/admin/login" method="post" >
                <div class="am-form-group">
                    <input type="text" class="tpl-form-input" name="userName" id="userName" placeholder="请输入账号">

                </div>

                <div class="am-form-group">
                    <input type="password" class="tpl-form-input" name="userPass" id="userPass" placeholder="请输入密码">

                </div>
                <div class="am-form-group tpl-login-remember-me">
                    <input id="remember-me" type="checkbox">
                    <label for="remember-me">

                        记住密码
                    </label>

                </div>
                <div class="am-form-group">
                    <button type="button" id="sure" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${basePath}static/admin/assets/js/amazeui.min.js"></script>
<script src="${basePath}static/admin/assets/js/app.js"></script>
<script>
    $(function(){
        $("#message").fadeOut();

        $("#sure").click(function(){
            var $name=$("#userName").val();
            var $pass=$("#userPass").val();

            if($name=="" ){
                $("#message span").text("用户名不能为空");
                $("#message").fadeIn().delay(2000).fadeOut();
            }
            else if($pass=="" ){
                $("#message span").text("密码不能为空");
                $("#message").fadeIn().delay(2000).fadeOut();
            }else{
                  $("#loginForm").submit();
            }
            return false;
        });

        <c:if test="${!empty requestScope.message}" >
             $("#message span").text("${ requestScope.message}");
             $("#message").fadeIn().delay(2000).fadeOut();
        </c:if>
    });
</script>
</body>

</html>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/14 0014
  Time: 下午 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="common/header.jsp"/>
<link rel="stylesheet" href="<%=basePath%>static/admin/bootstrap/css/bootstrap.min.css">

<body>

<!-- setting a fullscreen image as background:
<img id="bg" src="images/apple.jpg" alt="apple-background" />
-->

<!-- 改变背景颜色 -->
<div class="theme-changer-wrap">
    <div class="theme-changer">
        <div class="changer-inner">
            <span> COLOR SCHEME </span>
            <ul id="colors">
                <li><a href="blog.html@style=yellow" rel="yellow" class="styleswitch color-yellow">yellow</a></li>
                <li><a href="blog.html@style=orange" rel="orange" class="styleswitch color-orange">orange</a></li>
                <li><a href="blog.html@style=blue" rel="blue" class="styleswitch color-blue">blue</a></li>
                <li><a href="blog.html@style=green" rel="green" class="styleswitch color-green">blue</a></li>
                <li><a href="blog.html@style=red" rel="red" class="styleswitch color-red">blue</a></li>
                <li><a href="blog.html@style=purple" rel="purple" class="styleswitch color-purple">blue</a></li>

            </ul>
            <div style="clear:both; height:10px; width:100%"></div>
        </div>
    </div>
    <div class="open-close"></div>
</div>

<div id="wrapper">
    <!--导航条-->
    <jsp:include page="common/nav.jsp"/>

    <div class="top-shadow"></div>
    <!--网页标题-->
    <section class="page-title">
        <div class="page-background">
            <div class="pattern1"></div>
        </div>
        <div class="bottom-shadow"></div>
        <div class="title-wrapper">
            <div class="title-bg">
                <div class="title-content">
                    <h2>-----信息提示----</h2>
                    <div class="clear"></div>
                </div><!--end title-content-->
            </div>
        </div><!--end title-wrapper-->
    </section>

    <div class="centered-wrapper">
        <div class="container">
            <div class="row clearfix" style="margin-top:10%;">
                <div class="col-md-3 col-md-offset-2 ">
                    <img alt="200*200" src="<%=basePath%>/static/admin/assets/img/message.jpg" />
                </div>
                <div class="col-md-6 " style="margin-top:2%;">
                    <dl>
                        <dt>
				<span style="font-size:32px">
				<p class="text-info" ><b>提示信息</b></p>
				</span>
                        </dt>
                        <dd>
					<span style="font-size:20px">
					<p class="text-warning" ><b>Message:<%=request.getAttribute("message")%></b></p>
					</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <span style="font-size:32px">
				                <a href="${requestScope.url}" >访问前一页面</a>
				           </span>
                        </dt>
                        <dt>
                            <span style="font-size:32px">
				                <a href="<%=basePath%>" >访问首页面</a>
				           </span>
                        </dt>
                    </dl>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div><!--end centered-wrapper-->

    <div class="space"></div>
    <jsp:include page="common/copy.jsp" />

</div><!--end wrapper-->
</body>
</html>
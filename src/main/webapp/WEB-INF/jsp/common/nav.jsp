<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/8 0008
  Time: 下午 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<header id="header">
    <div class="centered-wrapper">
        <div class="one-third">
            <div class="logo"><a href="<%=basePath%>blog/list"></a></div>
        </div><!--end one-third-->

        <div class="two-third column-last">
            <nav id="navigation">
                <ul id="mainnav">
                    <li><a href="<%=basePath%>"><span>HOME</span></a></li>

                    <li><a href="<%=basePath%>gallery/list"><span>画廊</span></a>
                        <ul>
                            <li><a href="<%=basePath%>gallery/list">瀑布流</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=basePath%>blog/list"><span>博客列表</span></a>
                        <ul>
                            <li><a href="<%=basePath%>blog/list">博客列表</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=basePath%>contact"><span>CONTACT</span></a>
                        <ul>
                            <li><a href="<%=basePath%>contact">联系我们</a></li>
                        </ul>
                    </li>
                </ul>
            </nav><!--end navigation-->
        </div><!--end two-third-->
        <div class="clear"></div>
    </div><!--end centered-wrapper-->
</header>

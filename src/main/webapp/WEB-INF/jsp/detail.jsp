<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/16 0016
  Time: 下午 5:38
  To change this template use File | Settings | File Templates.
--%>
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
                    <h2>-----<c:if test="${!empty requestScope.blog}" >
                        ${requestScope.blog.blogTitle}
                    </c:if>----</h2>
                    <div class="clear"></div>
                </div><!--end title-content-->
            </div>
        </div><!--end title-wrapper-->
    </section>

    <div class="centered-wrapper">
        <section id="blog-page">
            <div id="posts">
                <article class="post regular-article">
                    <div class="post-content">
						<span class="masonry-post-meta">
							<c:if test="${!empty requestScope.blog}" >
                                ${requestScope.blog.blogTime}
                            </c:if> / <a href="#"><c:if test="${!empty requestScope.blog}" >
                                ${requestScope.blog.category}
                            </c:if></a>
						</span>
                        <i class="icon-pencil"></i>
                        <div class="clear"></div>
                        <h1><a href="#"><c:if test="${!empty requestScope.blog}" >
                                    <img src="<%=basePath%>${requestScope.blog.blogImage}">
                               </c:if></a></h1>

                        <p>
                            <c:if test="${!empty requestScope.blog}" >
                                ${requestScope.blog.blogContent}
                            </c:if>
                        </p>
                    </div><!--end post-content-->
                </article>

                <div class="clear"></div>

            </div><!--end posts-->
        </section>

        <aside id="sidebar">
            <%--<div class="widget recent-posts">--%>
                <%--<h3>Recent Posts</h3>--%>
                <%--<div class="sidebar-post">--%>
                    <%--<h5><a href="blog-single.html">The Secrets Behind Identity Branding</a></h5>--%>
                    <%--<span>23 July 2012 / <a href="#">5 Comments</a></span>--%>
                <%--</div><!--end sidebar-post-->--%>
                <%--<div class="sidebar-post">--%>
                    <%--<h5><a href="blog-single.html">From Inception to IPO: Facebook in 8 Years</a></h5>--%>
                    <%--<span>06 May 2012 / <a href="#">3 Comments</a></span>--%>
                <%--</div><!--end sidebar-post-->--%>
                <%--<div class="sidebar-post">--%>
                    <%--<h5><a href="blog-single.html">A/B Testing: What is It?</a></h5>--%>
                    <%--<span>12 March 2012 / <a href="#">No Comments</a></span>--%>
                <%--</div><!--end sidebar-post-->--%>
            <%--</div>--%>

            <div class="widget categories ">
                <h3>--分类--</h3>
                <ul>
                    <c:if test="${!empty requestScope.categorys}" >
                       <c:forEach var="category" items="${requestScope.categorys}">
                           <li><a href="<%=basePath%>blog/list?type=0&paramCategory=${category}">${category}</a></li>
                       </c:forEach>
                    </c:if>
                </ul>
            </div><!--end widget-->

            <div class="widget tags ">
                <h3>--标签--</h3>
                <ul>
                    <c:if test="${!empty requestScope.tags}" >
                        <c:forEach var="tag" items="${requestScope.tags}">
                            <li><a href="<%=basePath%>blog/list?type=1&paramCategory=${tag}">${tag}</a></li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div><!--end widget-->
        </aside>

        <div class="clear"></div>
    </div><!--end centered-wrapper-->

    <div class="space"></div>
    <jsp:include page="common/copy.jsp" />

</div><!--end wrapper-->

</body>
</html>
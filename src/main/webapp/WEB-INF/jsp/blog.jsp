<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="basePath" value="<%=basePath%>" />
<jsp:include page="common/header.jsp"/>
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
                    <h2>博客列表</h2>
                    <div class="clear"></div>
                </div><!--end title-content-->
            </div>
        </div><!--end title-wrapper-->
    </section>

    <div class="centered-wrapper">
        <section id="blog-page">
            <div id="posts">
                <article class="post gallery-article" style="position:relative">
                    <!--图片轮播-->
                    <div class="post-thumbnail">
                        <div class="blog-slides">
                            <div class="slides_container">
                                <c:if test="${!empty requestScope.newList}">
                                    <c:forEach var="newBlog" items="${requestScope.newList}" >
                                        <div class="slide">
                                            <a href="${basePath}blog/detail?id=${newBlog.id}">
                                                <img src="<%=basePath%>${newBlog.blogImage}" width="695" height="400" alt="Slide 1"></a>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty requestScope.newList}">
                                    <div class="slide">
                                        <a href="<%=basePath%>static/front/images/blog/homeblog-thumbnail4.jpg" rel="prettyPhoto[pp_gal]" title="Gallery Image 2">
                                            <img src="headImage/zhang.png" alt="Slide 2"></a>
                                    </div>
                                    <div class="slide">
                                        <a href="<%=basePath%>static/front/images/blog/homeblog-thumbnail3.jpg" rel="prettyPhoto[pp_gal]" title="Gallery Image 2">
                                            <img src="headImage/zhang.png" alt="Slide 2"></a>
                                    </div>
                                    <div class="slide">
                                        <a href="<%=basePath%>static/front/images/blog/homeblog-thumbnail2.jpg" rel="prettyPhoto[pp_gal]" title="Gallery Image 2">
                                            <img src="headImage/zhang.png" alt="Slide 2"></a>
                                    </div>
                                </c:if>
                            </div>
                            <a href="#" class="prev"><img src="<%=basePath%>static/front/images/blog-arrow-prev.png" width="27" height="43" alt="Arrow Prev"></a>
                            <a href="#" class="next"><img src="<%=basePath%>static/front/images/blog-arrow-next.png" width="27" height="43" alt="Arrow Next"></a>
                        </div><!--end slides-->
                    </div><!--end post-thumbnail-->
                    <!--文章-->
                    <c:if test="${!empty requestScope.blogList}">
                        <c:forEach var="blog" items="${requestScope.blogList}">
                            <div class="post-content row" >
						      <span class="masonry-post-meta">
							     ${blog.blogTime} / <a href="${basePath}blog/detail?id=${blog.id}">文章</a>
						      </span>
                                <i class="icon-pencil"></i>
                                <div class="clear"></div>
                                <!--正文-->
                                <img src="<%=basePath%>${blog.blogImage}"  class="pull-left" style="margin-right:20px" width="150px" height="130px">
                                <p >${blog.simpleContent}
                                </p>
                            </div>
                            <!--更多-->
                            <div style="position:absolute;buttom:-25px;right:-10px">
                                <a class="button red" href="${basePath}blog/detail?id=${blog.id}">Read More</a>
                            </div>
                        </c:forEach>
                    </c:if>
                    <!--文章-->
                </article>

                <div class="clear"></div>

                <div class="pagenav">
                    <span class="pages">Page ${requestScope.pageCurrent} of ${requestScope.pageCount}</span>
                    <span class="current">1</span>
                    <c:if test="${requestScope.pageNo+1 < requestScope.pageCount}">
                        <a href="#" class="page">${requestScope.pageNo+1}</a>
                    </c:if>
                    <a href="#" class="nextpostslink">&raquo;</a>
                </div>

            </div><!--end posts-->
        </section>

        <aside id="sidebar">
            <div class="widget recent-posts">
                <div class="row clearfix">
                    <div class="col-md-4 column">
                        <img alt="140x140" src="<%=basePath%>static/upload/admin/logo.jpg" class="img-circle" />
                    </div>
                    <div>
                        <strong>依然慢节奏</strong><br/>
                        <small>欢迎来踩一踩....</small>
                    </div>
                </div>
            </div>
            <div class="widget recent-posts">
                <h3>最新发表</h3>
                <c:if test="${!empty requestScope.newList}">
                    <c:forEach items="${requestScope.newList}" var="newBlog">
                     <div class="sidebar-post">
                        <h5><a href="blog-single.html">${newBlog.blogTitle}</a></h5>
                        <span>${newBlog.blogTime}/ <a href="${basePath}blog/detail?id=${newBlog.id}">阅读</a></span>
                     </div><!--end sidebar-post-->
                    </c:forEach>
                </c:if>
            </div>

            <div class="widget categories ">
                <h3>分类</h3>
                <ul>
                    <c:if test="${!empty requestScope.categorys}" >
                        <c:forEach var="category" items="${requestScope.categorys}">
                            <li><a href="<%=basePath%>blog/list?type=0&paramCategory=${category}">${category}</a></li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div><!--end widget-->

            <div class="widget tags ">
                <h3>标签</h3>
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
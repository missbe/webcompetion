<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/16 0016
  Time: 下午 9:04
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
<%--瀑布流静态文件--%>
<style type="text/css">
    *{margin:0;padding:0;list-style-type:none;}
    a,img{border:0;}
    body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
</style>

<script type="text/javascript" src="<%=basePath%>static/front/stream/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/front/stream/js/notification.js"></script>
<script type="text/javascript" src="<%=basePath%>static/front/stream/js/bigimg.js"></script>
<script type="text/javascript" src="<%=basePath%>static/front/stream/js/jquery.lazyload.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>static/front/stream/js/blocksit.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/front/stream/js/pubu.js"></script>

<link rel="stylesheet" href="<%=basePath%>static/front/stream/css/bigimg.css" type="text/css"/>
<link rel="stylesheet" href="<%=basePath%>static/front/stream/css/pubu.css" type="text/css" media='screen'/>
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

<div id="stream-wrapper">
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
                    <h2>图片墙</h2>
                    <div class="clear"></div>
                </div><!--end title-content-->
            </div>
        </div><!--end title-wrapper-->
    </section>

    <div class="centered-wrapper">
        <!--瀑布流  start-->
        <div id="wrapper">
            <div id="container" style="width:995px;">
                <c:if test="${!empty requestScope.list}">
                    <c:forEach items="${requestScope.list}" var="image" varStatus="num">
                        <div class="grid">
                            <div class="imgholder">
                                <img class="lazy thumb_photo" title="${num.count}" src="<%=basePath%>static/front/stream/images/pixel.gif"
                                     data-original="<%=basePath%>${image}" width="225" />
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>

        <!--瀑布流 end-->
        <div class="clear"></div>
        <div class="load_more">
            <span class="load_more_text">加载完成.</span>
        </div>

        <!--大图弹出层 start-->
        <div class="container">
            <div class="close_div">
                <img src="<%=basePath%>static/front/stream/images/closelabel.gif" class="close_pop"
                     title="关闭" alt="关闭" style="cursor:pointer" >　
            </div>
            <!-- 代码 开始 -->
            <div class="content">
                <span style="display:none"><img src="<%=basePath%>static/front/stream/images/load.gif" /></span>
                <div class="left"></div>
                <div class="right"></div>
                <c:if test="${!empty requestScope.list}">
                    <c:forEach items="${requestScope.list}" var="image" varStatus="num">
                         <img class="img" src="<%=basePath%>${image}"/>
                    </c:forEach>
                </c:if>

            </div>
            <div class="bottom">共 <span id="img_count">x</span> 张 / 第 <span id="xz">x</span> 张</div>
            <!-- 代码 结束 -->
        </div><!--end-->
    </div>
    <div class="space"></div>
    <jsp:include page="common/copy.jsp" />

</div><!--end wrapper-->
<!--瀑布流JS-->
<script type="text/javascript">
    $(document).ready(function(){

        var count = 14;
        // 点击加载更多
        $('.load_more').click(function(){
            var html = "";
            var img = '';
            for(var i = count; i < count+13; i++){
                var n = Math.round(Math.random(1)*13);
                var src = '<%=basePath%>static/front/stream/images/'+n+'.jpg';
                html = html + "<div class='grid'>"+
                        "<div class='imgholder'>"+
                        "<img class='lazy thumb_photo' title='"+i+"' src='<%=basePath%>static/front/stream/images/pixel.gif' data-original='"+src+"' width='225' onclick='seeBig(this)'/>"+
                        "</div>"+
                        "</div>";
                img = img + "<img class='img' src='"+src+"'>";
            }
            count = count + 13;
            $('#container').append(html);
            $('.content').append(img);
            $('#container').BlocksIt({
                numOfCol:4,  //每行显示数
                offsetX: 5,  //图片的间隔
                offsetY: 5   //图片的间隔
            });
            $("img.lazy").lazyload();
        });

    });
    //关闭查看大图
    function closeImage() {
        alert('close');
        $('.container').fadeOut(300);
    }
</script>
<!--end-->
</body>
</html>

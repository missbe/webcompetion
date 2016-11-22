<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="common/header.jsp"/>
<!-- 圆形头像格式(自定义) -->
<link rel="stylesheet"
      href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

<body>

<!-- setting a fullscreen image as background:
<img id="bg" src="<%=basePath%>static/front/images/apple.jpg" alt="apple-background" />
-->

<!-- 左侧改变颜色 -->
<div class="theme-changer-wrap">
    <div class="theme-changer">
        <div class="changer-inner">
            <span> COLOR SCHEME </span>
            <ul id="colors">
                <li><a href="?style=yellow" rel="yellow" class="styleswitch color-yellow">yellow</a></li>
                <li><a href="?style=orange" rel="orange" class="styleswitch color-orange">orange</a></li>
                <li><a href="?style=blue" rel="blue" class="styleswitch color-blue">blue</a></li>
                <li><a href="?style=green" rel="green" class="styleswitch color-green">blue</a></li>
                <li><a href="?style=red" rel="red" class="styleswitch color-red">blue</a></li>
                <li><a href="?style=purple" rel="purple" class="styleswitch color-purple">blue</a></li>

            </ul>
            <div style="clear: both; height: 10px; width: 100%"></div>
        </div>
    </div>
    <div class="open-close"></div>
</div>
<div id="wrapper">
    <jsp:include page="common/nav.jsp"/>

    <div class="top-shadow"></div>
    <!-- 图片 -->
    <section class="page-title">
        <div class="page-background">
            <img src="<%=basePath%>static/front/images/bg/title-bg1.jpg" />
        </div>
        <div class="bottom-shadow"></div>
        <div class="title-wrapper">
            <div class="title-bg">
                <div class="title-content">
                    <div class="two-third">
                        <h2>--开发人员--</h2>
                    </div>
                    <div class="one-third column-last"></div>
                    <div class="clear"></div>
                </div>
                <!--end title-content-->
            </div>
        </div>
        <!--end title-wrapper-->
    </section>
    <!-- 小组成员头像+昵称+联系方式 -->
    <div class="row">
        <div class="col-md-2 col-md-offset-3" align="center">
            <img src="<%=basePath%>static/front/headImage/lei.bmp" width="100px" height="100px" class="img-circle">
            <br>
            <br>刚刚
            <br>
            <br>QQ:1195317565
        </div>
        <div class="col-md-2" align="center">
            <img src="<%=basePath%>static/front/headImage/zhang.png" width="100px" height="100px" class="img-circle">
            <br>
            <br>柯柯
            <br>
            <br>QQ:534737859
        </div>
        <div class="col-md-2" align="center">
            <img src="<%=basePath%>static/front/headImage/huang.png" width="100px" height="100px" class="img-circle">
            <br>
            <br>峰峰
            <br>
            <br>QQ:200562782
        </div>
    </div>
    <hr>
    <!-- 填写联系时的必要信息 -->
    <div class="centered-wrapper">

        <div class="three-fourth column-last">
            <h3>CONTACT US:</h3>
            <div id="contactform">
                <div id="message"></div>
                <form method="post" action="<%=basePath%>contact/save" name="myform" id="myform">

                    <label>Name<span>*</span></label>
                    <input id="name" type="text" style="width: 95%; height: 10px" name="name" />

                    <br>

                    <label>Email<span>*</span></label>
                    <input type="text" style="width: 95%; height: 10px" name="email" id="email" />

                    <br>

                    <label>Items<span>*</span></label>
                    <input type="text" style="width: 95%; height: 10px" name="items" id="subject" />

                    <fieldset class="clear">
                        <label>Your Message <span>*</span></label>
                        <textarea name="comments" id="comments"></textarea>
                    </fieldset>
                    <fieldset>
                        <input type="button" name="send" value="Send Message" id="sure" class="button red" />
                    </fieldset>
                    <script>
                        $("#sure").click(function () {
                            alert('这是一个内联框架。。');
                            $("#myform").submit();
                            return false;
                        });
                    </script>
                </form>
            </div>
            <!--end contactform-->
        </div>

        <div class="one-fourth" style="position: relative; left: 5%">
            <aside>
                <p>
                    <br>
                    <br>
                    <br>
                <h3>OUR OFFICE:</h3>
                <font size="3px"> 四川理工学院<br /> <br> 汇南校区<br /> 4-612<br />
                    <br> 15808239155<br /> <br> <a href="#">www.lovesora.cn</a><br />
                </font>
                </p>
                <br />
                <div class="contact-info">
                    <h3>CONTACT INFO:</h3>
                    <p>
                        <span>Phone:</span> +86 15808239155
                    </p>
                    <br />
                    <p>
                        <span>Email:</span> <a href="mailto:missbe@missbe.cn">missbe@missbe.cn</a>
                    </p>
                </div>
            </aside>
            <!--end aside-->
        </div>
        <!--end one-fourth-->
        <div class="clear"></div>
    </div>
    <!--end centered-wrapper-->

    <div class="space"></div>
    <jsp:include page="common/copy.jsp"/>
</div>
<!--end wrapper-->
<script>
    document.title = '联系我们|CONTACT';
</script>
</body>

</html>
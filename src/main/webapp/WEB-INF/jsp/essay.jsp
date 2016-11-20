<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="basePath" value="<%=basePath %>" />
<!DOCTYPE html>
<html>
<jsp:include page="common/header.jsp"/>
<meta charset="UTF-8">
<!-- 圆形头像格式(自定义) -->
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
<link rel="stylesheet" href="<%=basePath %>static/front/css/default_2.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>static/front/css/jqtransform_2.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/front/css/frontend_2.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/front/css/android_2.css" />
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath %>static/front/css/set_ie7_2.css" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<link rel="stylesheet" href="<%=basePath %>static/front/css/set_ie6_2.css" type="text/css" />
<![endif]-->

<link rel="stylesheet" href="<%=basePath %>static/front/css/style_2.css" type="text/css" />
<script src="<%=basePath %>static/front/js/jquery_2.js" type="text/javascript"></script>
<script src="<%=basePath %>static/front/js/common_2.js" type="text/javascript"></script>
<script src="<%=basePath %>static/front/js/jquery.placeholder.min_2.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('input, textarea').placeholder();
    });
</script>


<body>
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
<div  id="wrapper" >
    <!--导航条-->
    <jsp:include page="common/nav.jsp"/>

    <div class="article-lectures">
        <a href="javascript:;">精品文章</a>
    </div>
    <%--  class="main-wrap"--%>
    <div class="main-wrap">
        <div class="main-container-left">
            <div class="mcl-center">
                <div class="mcl-top">
                    <div class="mcl-bott">
                        <div class="article-wrap">
                            <div>文章</div>
                            <div class="writing-box">
                                <div class="writing-right">
                                    <span><a href="javascript:;" class="c-share1" id="ico_view"></a>|</span>
                                    <span><a href="javascript:;" class="c-share2" id="ico_digg"></a></span>
                                </div>
                            </div>
                        </div>

                        <div class="details-img article-iBox show_ct"></div>
                        <!--正文-->
                        <div class="col-md-10 col-md-offset-1">
                            <p>
                                这是朴槿惠继上月25日后第二次发表“对国民讲话”并道歉。她首先就“闺蜜门”让国民失望表达歉意，尤其向公务人员、企业人员道歉。朴槿惠再一次解释她与“闺蜜门”主角崔顺实的关系，称自己曾经在最困难时候得到崔顺实的帮助，对她很信任。但是，发生现在这种情况，是自 己对身边人不察，没有严格要求，同作为总统推动国家经济社会发展的职责相违背。
                            </p>
                            <br/>
                        </div>
                        <!-- 评论 -->
                        <div class="comment-wrap">
                            <div class="want-comment clear">
                                <div class="article-comments"><a href="javascript;:">文章评论(<span id="ico_comment_total"></span>)</a></div>
                                <div class="pic-l">
                                    <a href="javascript:;"><img src="<%=basePath %>static/front/picture/pic-1.jpg" alt="" /></a>
                                </div>
                                <div class="comm-textar">
                                    <div class="c-textarea">
                                        <div class="c-case">
                                            <div class="c-case-top">
                                                <div class="c-case-bottom">
                                                    <p id="repeat_to" style="display:none; padding:0; text-align:left;" class="mb10"></p>
                                                    <textarea class="areaA" id="comment_text" postto="1"></textarea>
                                                    <input type="hidden" id="rp_id" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="c-add">
                                        <div class="add-pictures" style="display: none;"><a class="a-pic-ico" href="#">添加图片</a></div>
                                        <div class="add-c"><a class="adC-ico" href="javascript:postComment();" id="com_submit">评论</a></div>
                                    </div>
                                </div>
                            </div>
                            <div id="review-ul">
                            </div>
                        </div>
                        <!--推荐文章-->
                        <div class="sponsor-wrap">
                            <div class="sponsor-title">推荐文章</div>
                            <div class="sponsor-text" id="article-list">
                                <p>李白</p>
                                <p>床前明月光</p>
                                <p>疑似地上霜</p>
                                <p>举头望明月</p>
                                <p>低头思故乡</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 文章编辑者信息 -->
        <div class="main-container-right">
            <div class="contact-wrap">
                <div class="at-m">
                    <div class="atT-container">
                        <div class="circle-center">
                            <div class="circle-top">
                                <div class="circle-bottom" id="person-info">
                                    <div class="pay-attention">
                                        <a href="javascript:;">
                                            <img src="<%=basePath %>static/front/headImage/huang.png" alt="" width=></a>
                                        <div class="pay-pic">
                                            <a target="_blank" href="/master/detail?id=112332">
                                                <img src="<%=basePath %>static/front/headImage/lei.bmp" alt="黄峰"></a>
                                        </div>
                                        <div class="sigh"></div>
                                        <div class="pay-attention-box">
                                            <div class="pay-att-title">
                                                <a class="pa-t" target="_blank" href="/master/detail?id=112332">sciascia</a>
                                                <a class="pa-b" href="javascript:;" id="user_type">栏目编辑</a></div>
                                            <div class="personal-related pay-relat">
                                                <a class="per-re-ico1" href="javascript:;">自贡 汇南</a>
                                                <a class="per-re-ico2" href="javascript:;">文案/编辑/写作</a>
                                            </div>
                                            <div class="personality">我不是基佬</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--实时评论-->
            <!--热门文章-->
            <div class="contact-wrap">
                <div class="touch-container">
                    <div class="touch-container-top">
                        <div class="touch-container-bott">
                            <div class="available">
                                <div class="latest-title">热门文章</div>
                                <div class="latest-text">
                                    <div class="Pop-container ">
                                        <div class="h-portrait">
                                            <a href="/article/detail?id=22204" target="_blank"><img src="<%=basePath %>static/front/picture/5810549181446.jpg" alt="" /></a>
                                        </div>
                                        <div class="portrait-text">
                                            <div class="pT-tit"><a href="/article/detail?id=22204" target="_blank">日子那么苦，你个卖咖啡的还要往里加Shot！</a></div>
                                            <div class="pT-name">By<a href="/master/detail?id=112421"> 仙人掌</a></div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="Pop-container ">
                                        <div class="h-portrait">
                                            <a href="/article/detail?id=22177" target="_blank"><img src="<%=basePath %>static/front/picture/580cc6057766a.jpg" alt="" /></a>
                                        </div>
                                        <div class="portrait-text">
                                            <div class="pT-tit"><a href="/article/detail?id=22177" target="_blank">感觉丧的时候，就去看看他的画</a></div>
                                            <div class="pT-name">By<a href="/master/detail?id=193045"> 摇摇冻</a></div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="Pop-container ">
                                        <div class="h-portrait">
                                            <a href="/article/detail?id=22249" target="_blank"><img src="<%=basePath %>static/front/picture/5817ee7ad5616.png" alt="" /></a>
                                        </div>
                                        <div class="portrait-text">
                                            <div class="pT-tit"><a href="/article/detail?id=22249" target="_blank">六秒钟后你会恨死我，但六个月后你会成为更好的作家</a></div>
                                            <div class="pT-name">By<a href="/master/detail?id=121765"> Asakur</a></div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="Pop-container class=" poP-bor "">
                                    <div class="h-portrait">
                                        <a href="/article/detail?id=22188" target="_blank"><img src="<%=basePath %>static/front/picture/580f0e753cc05.jpg" alt="" /></a>
                                    </div>
                                    <div class="portrait-text">
                                        <div class="pT-tit"><a href="/article/detail?id=22188" target="_blank">我要在我的人生里，做一枚闪闪发亮的神经病</a></div>
                                        <div class="pT-name">By<a href="/master/detail?id=193045"> 摇摇冻</a></div>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<div class="clear"></div>
<!--  -->
<jsp:include page="common/copy.jsp"/>
</div>
</body>
</html>
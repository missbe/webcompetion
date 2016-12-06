<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="basePath" value="<%=basePath %>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${requestScope.webinfo.title}</title>
<meta charset="UTF-8">
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="description" content="${requestScope.webinfo.description}">
<meta name="keywords" content="${requestScope.webinfo.keywords}"/>
 
 
<link rel="shortcut icon" type="image/x-icon" href="${basePath}static/upload/company/favicon.ico"/>
 
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/font-awesome.min.css" media="screen"/>
<!--加载QQ交谈窗口-->
<link href="${basePath}static/company/css/lanrenzhijia.css" rel="stylesheet" type="text/css" />

<link href="${basePath}static/company/css/component.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/bootstrap.min.css" media="screen"/>
 
 
<!--[if lt IE 9]>
        <script src="${basePath}static/company/js/html5shiv.js"></script>
        <script src="${basePath}static/company/js/respond.min.js"></script>
    <![endif]-->
 
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/style.css" media="screen" media="screen"/>
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/fallback.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/slick-theme.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/jquery.fullpage.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/jquery.mcustomscrollbar.css"/>
<!--[if IE 8]>        
        <link rel="stylesheet" type="text/css" href="${basePath}static/company/css/ei8.css" media="screen" />
    <![endif]-->
 
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/flexslider.css" media="screen"/>
 
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/jquery.fancybox.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/jquery.fancybox-thumbs.css" media="screen"/>
 
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/supersized.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/supersized.shutter.css" media="screen"/>
 
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/jcarousel.css" media="screen"/>
 
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/jquery.selectbox.css" media="screen"/>
 
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/minimal.css" media="screen"/>
 
<script src="${basePath}static/company/js/jquery.min.js"></script>
<script src="${basePath}static/company/js/jquery-ui.min.js"></script>
<script type="${basePath}static/company/text/javascript" src="${basePath}static/company/js/modernizr.custom.26633.js"></script>
<script type="${basePath}static/company/text/javascript" src="${basePath}static/company/js/instafeed.js"></script>
<script>
<noscript><img height="1" width="1" style="display:none" src="${basePath}static/company/picture/dfbfbe56be7d46c9bbf453e8791a93a2.gif"/></noscript>
 <script>
$(function(){
	$('#close_im').bind('click',function(){
		$('#main-im').css("height","0");
		$('#im_main').hide();
		$('#open_im').show();
	});
	$('#open_im').bind('click',function(e){
		$('#main-im').css("height","272");
		$('#im_main').show();
		$(this).hide();
	});
	$('.go-top').bind('click',function(){
		$(window).scrollTop(0);
	});
	$(".weixing-container").bind('mouseenter',function(){
		$('.weixing-show').show();
	})
	$(".weixing-container").bind('mouseleave',function(){        
		$('.weixing-show').hide();
	});
});
</script>
</head>
<body class="home blog">
	
	<!--加载QQ交谈窗口的DIV-->
<div class="drag">
	<div class="main-im">
	<div id="open_im" class="open-im">&nbsp;</div>  
	<div class="im_main" id="im_main">
		<div id="close_im" class="close-im"><a href="javascript:void(0);" title="点击关闭">&nbsp;</a></div>
		<a href="http://wpa.qq.com/msgrd?v=3&uin=534737859&site=qq&menu=yes" target="_blank" class="im-qq qq-a" title="在线QQ客服">
			<div class="qq-container"></div>
			<div class="qq-hover-c"><img class="img-qq" src="${basePath}static/company/images/qq.png"></div>
			<span> QQ在线咨询</span>
		</a>
		<div class="im-tel">
			<div>售前咨询热线</div>
			<div class="tel-num">400-123-45678</div>
			<div>售后咨询热线</div>
			<div class="tel-num">500-12345678</div>
		</div>
		<div class="im-footer" style="position:relative">
			<div class="weixing-container">
				<div class="weixing-show">
					<div class="weixing-txt">微信扫一扫<br>盐都科技</div>
					<img class="weixing-ma" src="${basePath}static/company/images/weixing-ma.jpg">
					<div class="weixing-sanjiao"></div>
					<div class="weixing-sanjiao-big"></div>
				</div>
			</div>
			<div class="go-top"><li data-menuanchor="Home" class="current"><a href="#Home" title="返回顶部"></a></li> </div>
			<div style="clear:both"></div>
		</div>
	</div>
</div>
</div>




<div class="fisrtOverLay"></div>
<div class="rotateOriontatio"></div>
<div id="header">
<header>
<div class="container-fluid">
<div class="row">
<div class="col-xs-3 logo">
<a href="${basePath}">
<img class="dMobile" src="${basePath}static/upload/company/mobilelogo.png" height="50" width="210">
<img class="dDesktop" src="${basePath}static/upload/company/logo.png" height="50" width="210">
</a>
</div>
<div class="col-xs-9 nav">
<nav>
<a href="#" class="menu-toggle">
<span id="line-1">&nbsp;</span>
<span id="line-2">&nbsp;</span>
<span id="line-3">&nbsp;</span>
</a>
<ul id="menu">
<li data-menuanchor="Home" class="current"><a href="#Home">Home</a></li>
<li data-menuanchor="Work"><a href="#Gallery">Gallery</a></li>
<li data-menuanchor="Company"><a href="#Company">Company</a></li>
<li data-menuanchor="Services"><a href="#Services">Service</a></li>
<li data-menuanchor="Blog"><a href="${basePath}blog/list">Blog</a></li>
<li data-menuanchor="Contact"><a href="#Contact">Contact</a></li>
</ul>
</nav>
</div>
</div>
</div>
</header>
</div>
<div id="singleWrapper">
</div>
<div id="fullpage">
<div class="section oh" id="section0">
     <video autoplay loop muted id="myVideo">
<source src="http://ohgkgpp28.bkt.clouddn.com/578204362.mp4 " type="video/mp4">
</video>
<div class="element">
<div class="element-middle">
<div class="intro">
<div class="firstPageDsc">
<h2>WHAT</h2>
<h1>YOU SEE</h1>
<h2>IS WHAT YOU BELIEVE</h2>
<a class="more hlp" href="">Portfolio</a>
</div>
</div>
</div>
<a href="" class="bottomArrow"></a>
</div>
</div>
<div class="section works" id="section1">
<div class="intro height100">
<div class="container-fluid height100">
<div class="row text-center sliderCount caruselItem height100">
<c:if test="${!empty requestScope.imagelist}" >
<c:forEach items="${requestScope.imagelist}" var="imagelist" 
    varStatus="num" begin="0" end="${requestScope.size}"  step="2" >
<c:choose>
<c:when test="${num.index+2<=requestScope.size}">
<div class="height100 col-xs-6 itemWrappers">
<div class="row height100">
<div  class="col-xs-12 workItems oh 1 aside " 
                              style='background-image:url( ${requestScope.imagelist[num.index].image.get(0)} );' > 
                                     

                                    <a href="${basePath}/webgallery?id=${num.index}"> 
                                        <div class="workThumbnails">
                                            <div class="element">
                                                <div class="element-middle">
                                                    <span class="icon" syle="background-image:url();"></span>
                                                    <h2>${requestScope.imagelist[num.index].title}</h2>
                                                    <p>${requestScope.imagelist[num.index].date}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>  
                                                         <c:if test="${!empty requestScope.imagelist[num.index+1].image.get(0)}" >
                                                                                          <div  class="col-xs-12 workItems oh 3 aside " 
                              style='background-image:url( ${requestScope.imagelist[num.index+1].image.get(0)} );'data-lazy='${requestScope.imagelist[num.index+1].image.get(0)}' > 
                                     

                                    <a href="${basePath}/webgallery?id=${num.index+1}"> 
                                        <div class="workThumbnails">
                                            <div class="element">
                                                <div class="element-middle">
                                                    <span class="icon" syle="background-image:url();"></span>
                                                    <h2>${requestScope.imagelist[num.index+1].title}</h2>
                                                    <p>${requestScope.imagelist[num.index].date}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>  
                               </c:if>
                            </div></div>
                            </c:when>
<c:otherwise>
<div  class="col-xs-12 workItems oh 1 aside " 
                              style='background-image:url( ${requestScope.imagelist[num.index].image.get(0)} );' > 
                                     

                                    <a href="${basePath}/webgallery?id=${num.index}"> 
                                        <div class="workThumbnails">
                                            <div class="element">
                                                <div class="element-middle">
                                                    <span class="icon" syle="background-image:url();"></span>
                                                    <h2>${requestScope.imagelist[num.index].title}</h2>
                                                    <p>${requestScope.imagelist[num.index].date}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>  
</c:otherwise>
                            </c:choose>
                            
                       </c:forEach>     
</c:if>

                                                         
                                                                                          
                            </div>
                            
                                      
                                </div>  
                                                                                                                         
                                                         
                                                                                          
                                                    </div>
                        </div>
    <div class="section company compSlide" id="section2">  
        <div class="slideComp" style="background-image:url(${basePath}static/company/images/careers_image2.jpg);">
            <div class="element mmelement">
                <div class="element-middle pt30">
                    <div class="intro"> 
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="firstPageDsc"> 
                                        
                                         
                                                                                            <div class="dMobile">
                                                    <h2>简历投递</h2>
<h3>Looking for a job?</h3>
<p><a href="http://www.suse.edu.cn/">WEB DEVELOPER</a></p>
 
                                                </div>
                                                <div class="dDesktop">
                                                    <h2>简历投递</h2>
<h3>Looking for a job?</h3>
<p><a href="http://www.suse.edu.cn/">WEB DEVELOPER</a></p>
                                                </div>
                                              
                                             
                                           
                                          
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div> 
            </div> 
        </div> 
        <div class="slideComp companyBg">
            <div class="element mmelement">
                <div class="element-middle pt30">
                    <div class="intro"> 
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="firstPageDsc"> 
                                        
                                         <!--移动端-->
                                                                                            <div class="dMobile">
                                                    <h1>盐都科技</h1>
<p>通过专业的团队化管理以及对于市场需求的充分把握。成立了盐都科技有限公司，依托同四川理工学院的校企合作，提升公司的市场竞争力。与高校一起培养和发掘优秀的人才。公司应用了互联网开发模式开发产品的模式，用极客精神做产品，用互联网模式干掉中间环节，致力于让各行各业，都能跟上来自互联网时代的风暴浪潮。</p>
<p>Through professional team management and fully grasp the market demand. Founded the science and Technology Co., Ltd., relying on the school enterprise cooperation with Sichuan University of Science and Engineering, to enhance the company's market competitiveness. Together with the universities to develop and explore outstanding talents. The company used the Internet product development model development model, products made with geek spirit, get rid of the intermediate links with the Internet model, dedicated to all walks of life, from the age of the Internet can keep up with the tide of the storm.</p>
 
                                                </div>
                                                <!--桌面端-->
                                                <div class="dDesktop">
                                                    <h2>盐都科技</h2>
<h3>Growth firms with professional technology &amp; technology ,Look forward to your joining.</h3>
<p>通过专业的团队化管理以及对于市场需求的充分把握。成立了盐都科技有限公司，依托同四川理工学院的校企合作，提升公司的市场竞争力。与高校一起培养和发掘优秀的人才。公司应用了互联网开发模式开发产品的模式，用极客精神做产品，用互联网模式干掉中间环节，致力于让各行各业，都能跟上来自互联网时代的风暴浪潮。</p>
<p>Through professional team management and fully grasp the market demand. Founded the science and Technology Co., Ltd., relying on the school enterprise cooperation with Sichuan University of Science and Engineering, to enhance the company's market competitiveness. Together with the universities to develop and explore outstanding talents. The company used the Internet product development model development model, products made with geek spirit, get rid of the intermediate links with the Internet model, dedicated to all walks of life, from the age of the Internet can keep up with the tide of the storm.</p>
                                                </div>
                                              
                                             
                                           
                                           
                                        <ul class="subMenu">
                                            <li><a id="CaL"href="">简历投递</a></li>
                                            <li><a id="GaL"href="">Looking for more information.....</a></li>
                                            <li data-menuanchor="Services"><a href="#Services">Services</a></li>
                                            <li data-menuanchor="People"><a href="#Blog">Blog</a></li>
                                            <li data-menuanchor="Contact"><a href="#Contact">Contact</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div> 
            </div> 
        </div>  
        <div class="slideComp galerie prelativ">  
    		<div class="overGalery">
                <div class="element">
                    <div class="element-middle text-center">
                        <h2 class="insideAgency">more information....</h2>
                    </div>
                </div>      
            </div>
            <div id="ri-grid" class="ri-grid ri-grid-size-3"> 
                <ul id="instafeed"></ul>
                 
                     
                                                    
                     
                   
                    
            </div> 
        </div>  
    </div>
    <div class="section " id="section3"> 
        <div class="element sevices"> 
            <div class="element-middle">
                <div class="intro"> 
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="firstPageDsc">
                                   
                                         
                                            <h2>产品与服务</h2>
<h4>公司现在主要有以下方面的业务，并不断拓展....</h4>
 
                                         
                                                                          <!--只能这样了-->
                                                                          <ul class="servicesList" style="margin-top:-30px;">
                                     
                                         
                                                 
                                                     <li>
                                                        <div class="iconHolder">
                                                            <img width="57" height="49" src="${basePath}static/company/picture/database.png" class="attachment-post-thumbnail wp-post-image" alt="3dDesignIcon" />                                                        </div>
                                                        <h3>数据库安装与维护<strong>&amp; 调试</strong></h3>
<p>运用专业的方式，让客户能够轻松建立数据库;</p>
                                                    </li>
                                                  
                                                     <li>
                                                        <div class="iconHolder">
                                                            <img width="54" height="42" src="${basePath}static/company/picture/websafe.png" class="attachment-post-thumbnail wp-post-image" alt="visualEffectIcon" />                                                        </div>
                                                        <h3>网站<strong>安全</strong></h3>
<p>守护网站安全，保护客户重要数据不被窃取;</p>
                                                    </li>
                                                  
                                                     <li>
                                                        <div class="iconHolder">
                                                            <img width="50" height="40" src="${basePath}static/company/picture/domain.png" class="attachment-post-thumbnail wp-post-image" alt="videoIcon" />                                                        </div>
                                                        <h3>域名<strong>服务</strong></h3>
<p>提供高质量，可靠的域名解析服务;</p>
                                                    </li>
                                                  
                                                     <li>
                                                        <div class="iconHolder">
                                                            <img width="54" height="41" src="${basePath}static/company/picture/bigdata.png" class="attachment-post-thumbnail wp-post-image" alt="postProductionIcon" />                                                        </div>
                                                        <h3>大数据<strong>分析</strong></h3>
<p>依托大数据分析平台，分析海量数据变得触手可及; </p>
                                                    </li>
                                                  
                                                     <li>
                                                        <div class="iconHolder">
                                                            <img width="55" height="51" src="${basePath}static/company/picture/app.png" class="attachment-post-thumbnail wp-post-image" alt="graphicIcon" />                                                        </div>
                                                        <h3>安卓<strong>应用</strong></h3>
<p>打造高效，通用的安卓开发平台; </p>
                                                    </li>
                                                  
                                                     <li>
                                                        <div class="iconHolder">
                                                            <img width="58" height="40" src="${basePath}static/company/picture/video.png" class="attachment-post-thumbnail wp-post-image" alt="uiIcon" />                                                        </div>
                                                        <h3>视频后期<strong>制作与处理</strong></h3>
<p>专业的剪辑与处理</p>
                                                    </li>
                                                  
                                             
                                           
                                                                          </ul>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div> 
            </div> 
        </div> 
    </div>
    <div class="section " id="section5"> 
        <div class="element sevices team kontakt"> 
            <div class="element-middle">
                <div class="intro"> 
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="firstPageDsc">
                                    <h2>联系我们</h2>
                                    <h4>Please feel free to contact us by phone, email or QQ.</h4> 
                                    <ul class="servicesList">
                                        <li>
                                            <div class="iconHolder">
                                                <img src="${basePath}static/company/picture/googlepin.png" height="56" width="46">
                                            </div>
                                            ${requestScope.webinfo.address}
                                            <!--  
                                            <p>Sichuan University of Science & Engineering</p>
                                            <p><strong>Huichuang Road,</strong>Zigong,  South Wast China</p>
                                            -->
                                            <p><a href="#mapholder" class="fancybox" data-fancybox-group="grup"><strong>View Baidu Maps</strong></a></p>
                                        </li>
                                        <li>
                                            <div class="iconHolder">
                                                <img src="${basePath}static/company/picture/mailicon.png" height="57" width="48">
                                            </div>
                                            <p><strong>反馈</strong><a href="Mailto:${requestScope.webinfo.email}"><span class="__cf_email__" data-cfemail="0c65626a634c7c7960606d22787a">${requestScope.webinfo.email}</span></a></p>
                                            <p><strong>招聘</strong><a href="Mailto:${requestScope.webinfo.email}"><span class="__cf_email__" data-cfemail="15627a677e5565607979743b6163">${requestScope.webinfo.email}</span></a></p>  
                                            
                                        </li>
                                        <li>
                                            <div class="iconHolder">
                                                <img src="${basePath}static/company/picture/telephone.png" height="50" width="45">
                                            </div>
                                            <p><strong>OFFICE</strong>${requestScope.webinfo.phone_400}</p>
                                            
                                            <!-- <p><strong>ZiGong</strong>+ 44 . 56 . 000 . 44466</p>
                                            <p><strong>ChengDu</strong>+ 1 . 310 . 923 . 7163</p> -->
                                        </li> 
                                    </ul>
                                    <ul class="social">
                                        <li><a target="_blank" href="http://www.souweixin.com/personal?id=${requestScope.webinfo.title}"><img src="${basePath}static/company/picture/weixingicon.png" height="50" width="50"></a></li>
                                        <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${requestScope.webinfo.qq}&site=qq&menu=yes"><img src="${basePath}static/company/picture/qqicon.png" height="50" width="50"> </a></li>
                                        <li><a target="_blank" href="https://www.youtube.com/user/${requestScope.webinfo.title}"><img src="${basePath}static/company/picture/youtube.png" height="50" width="50"> </a></li>
                                        <li><a target="_blank" href="https://www.tudou.com/${requestScope.webinfo.title}"><img src="${basePath}static/company/picture/tudouicon.png" height="50" width="50"> </a></li>
                                        <!-- <li><a target="_blank" href=""><img src="${basePath}static/company/picture/icon.png" height="50" width="50"> </a></li> -->
                                    </ul>
                                    <div class="footInfo">
                                        <div class="dMobile">
                                            <p>${requestScope.webinfo.footer_info}<!-- <a target="_blank" href="http://www.drawingart.org/">DrawingArt</a> --></p> 
                                        </div>
                                        <div class="dDesktop">
                                            <p>Copyright © 2016 by 盐都科技. All rights reserved.</p>
                                            <!-- <p>Site by <a target="_blank" href="http://www. .org/"> </a></p> -->
                                        </div> 
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div> 
                </div> 
            </div> 
        </div> 
    </div>
    <div id="mapholder" style="display: none;">
        <div id="map" ></div>
    </div>
</div>
 <script type="text/javascript" src="${basePath}static/company/js/jquery.fullpage.js"></script> 
 <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ns1ekPnu9FvaWaubWthsoUW17yrNSeZU"></script>
 <script type="text/javascript">
			        // 百度地图API功能
			  var sContent ="公司目前的办公地址。";
	      var map = new BMap.Map("map");    // 创建Map实例
	      map.centerAndZoom(new BMap.Point(104.76168,29.346538), 17);  // 初始化地图,设置中心点坐标和地图级别
	      map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	      map.setCurrentCity("自贡");          // 设置地图显示的城市 此项是必须设置的
	      map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	      var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
	      map.openInfoWindow(infoWindow,new BMap.Point(104.771328,29.33958)); //开启信息窗口
	      
    </script>
    
    
 	  
    <!-- Bootstrap Scripts -->
    <script type="text/javascript" src="${basePath}static/company/js/bootstrap.min.js"></script>
    <!-- flexslider Scripts -->
    <script type="text/javascript" src="${basePath}static/company/js/jquery.flexslider.js"></script>
    <!-- Fancybox Scripts -->
    <script type="text/javascript" src="${basePath}static/company/js/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/jquery.fancybox-thumbs.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/jquery.fancybox.media.js"></script>
    <!-- Supersized Scripts --> 
    <script type="text/javascript" src="${basePath}static/company/js/supersized.3.2.7.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/supersized.shutter.min.js"></script>
    <!-- Selectbox -->
    <script type="text/javascript" src="${basePath}static/company/js/jquery.selectbox-0.2.js"></script>
    <!-- Jcarousel -->
    <script type="text/javascript" src="${basePath}static/company/js/jquery.jcarousel.min.js"></script>
    <!-- icheck -->
    <script type="text/javascript" src="${basePath}static/company/js/jquery.icheck.min.js"></script>
    <!-- Parsley Scripts -->
    <script type="text/javascript" src="${basePath}static/company/js/parsley.min.js"></script>
    <!-- Scripts -->
    <script type="text/javascript" src="${basePath}static/company/js/jquery.gridrotator.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/jquery.masonry.min.js"></script> 
    <script type="text/javascript" src="${basePath}static/company/js/js-url.min.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/jquerypp.custom.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/instafeed.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/slick.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/scripts.js"></script>
    <script type="text/javascript" src="${basePath}static/company/js/gamma.js"></script>
    <!-- Scripts -->
    <script type="text/javascript">  

        jQuery(function() { 
            var GammaSettings = {
                    // order is important!
                    viewport : [ {
                        width : 1200,
                        columns : 3
                    }, {
                        width : 900,
                        columns : 3
                    }, {
                        width : 500,
                        columns : 2
                    }, { 
                        width : 320,
                        columns : 2
                    }, { 
                        width : 0,
                        columns : 2
                    } ]
            };

            Gamma.init( GammaSettings ); 
        });
 

        </script>

<!--拖动代码部分-->
<script>
 var clicked = "Nope.";
        var mausx = "0";
        var mausy = "0";
        var winx = "0";
        var winy = "0";
        var difx = mausx - winx;
        var dify = mausy - winy;

        $("html").mousemove(function (event) {
            mausx = event.pageX;
            mausy = event.pageY;
            winx = $(".drag").offset().left;
            winy = $(".drag").offset().top;
            if (clicked == "Nope.") {
                difx = mausx - winx;
                dify = mausy - winy;
            }

            var newx = event.pageX - difx - $(".drag").css("marginLeft").replace('px', '');
            var newy = event.pageY - dify - $(".drag").css("marginTop").replace('px', '');
            $(".drag").css({ top: newy, left: newx });

            
        });

        $(".drag").mousedown(function (event) {
            clicked = "Yeah.";
        });

        $("html").mouseup(function (event) {

            clicked = "Nope.";
        });

 



$(function(){
	$('#close_im').bind('click',function(){
		$('#main-im').css("height","0");
		$('#im_main').hide();
		$('#open_im').show();
	});
	$('#open_im').bind('click',function(e){
		$('#main-im').css("height","272");
		$('#im_main').show();
		$(this).hide();
	});
	$('.go-top').bind('click',function(){
		$(window).scrollTop(0);
	});
	$(".weixing-container").bind('mouseenter',function(){
		$('.weixing-show').show();
	})
	$(".weixing-container").bind('mouseleave',function(){        
		$('.weixing-show').hide();
	});
});
</script>
<!--拖动代码结束-->
<script type="text/javascript">/* <![CDATA[ */(function(d,s,a,i,j,r,l,m,t){try{l=d.getElementsByTagName('a');t=d.createElement('textarea');for(i=0;l.length-i;i++){try{a=l[i].href;s=a.indexOf('/cdn-cgi/l/email-protection');m=a.length;if(a&&s>-1&&m>28){j=28+s;s='';if(j<m){r='0x'+a.substr(j,2)|0;for(j+=2;j<m&&a.charAt(j)!='X';j+=2)s+='%'+('0'+('0x'+a.substr(j,2)^r).toString(16)).slice(-2);j++;s=decodeURIComponent(s)+a.substr(j,m-j)}t.innerHTML=s.replace(/</g,'&lt;').replace(/>/g,'&gt;');l[i].href='mailto:'+t.value}}catch(e){}}}catch(e){}})(document);/* ]]> */</script>
</body>
</html>
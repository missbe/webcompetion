<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="basePath" value="<%=basePath %>" />
<html>
<title>${requestScope.webinfo.title}</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="description" content="${requestScope.webinfo.description}">
<meta name="keywords" content="${requestScope.webinfo.keywords}"/>
<link rel="shortcut icon" type="image/x-icon" href="${basePath}static/upload/company/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="${basePath}static/company/css/font-awesome.min.css" media="screen"/>
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
 
<script>
    !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
    n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
    document,'script','https://connect.facebook.net/en_US/fbevents.js');

    fbq('init', '1722882471316362');
    fbq('track', "PageView");</script>
<noscript><img height="1" width="1" style="display:none" src="picture/2062db79d9bc45adb84bd53660bf3c98.gif"/></noscript>
 
</head>
<body class="single single-works postid-552 single-format-aside">
<div class="fisrtOverLay"></div>
<div class="rotateOriontatio"></div>
<div id="fullpageSingle">
<div class="section sectionMaxSingle oh" id="section0">
<div class="element">
<div class="element-middle">
<a href="${basePath}#Gallery" id="closeItem">
<img src="${basePath}static/company/images/closebuttonxx.png" height="55" width="55">
</a>
<!-- 设置第一幅的大图片 -->
<img class="iframeH" src="${basePath}${requestScope.imagelist[requestScope.id].image.get(0)}" style="width:100%;height:auto;opacity:0;">
<div class="sl-slidemedia sl-type-youtube" style="background-image:url(${basePath}${requestScope.imagelist[requestScope.id].image.get(0)});" data-index="" data-type="Vimeo" data-videourl="187343944">
<span></span>
</div>
<div class="intro single">
<div class="element">
<div class="element-middle text-center">

</div>
</div>
</div>
</div>
</div>
</div>
<div class="sectionn" id="section2">
<div class="element company work">
<div class="element-middle">
<div class="intro">
<div class="container">
<div class="row">
<div class="col-xs-12">
<div class="firstPageDsc">
<h4>${requestScope.imagelist[requestScope.id].date}</h4>
<h2>${requestScope.imagelist[requestScope.id].title}</h2>
<p>${requestScope.imagelist[requestScope.id].content}<br/>
<div id='gallery-1' class='gallery galleryid-552 gallery-columns-3 gallery-size-full'>
<c:forEach items="${requestScope.imagelist}" var="imageshowlist" varStatus="num" begin="0"  end="${requestScope.imagecount-1}">
<figure class='gallery-item'>
<div class='gallery-icon landscape'>
<a href='#'><img width="1280" height="720" src="${requestScope.imagelist[requestScope.id].image.get(num.index)}" class="attachment-full" /></a>
</div></figure>
</c:forEach>



</div>
</p>

</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="sectionn" id="section1">
<div class="container-fluid">
<div id="galeryHolder" class="row text-center">
<script type="text/javascript">
	                       $(document).ready(function() {
	                        		$('.firstPageDsc .gallery figure').each(function(){
	                        			var imgSrc = $(this).find('img').attr('src');
	                        			var caption = $(this).find('.wp-caption-text').text(); 
	                        			if( caption.trim() == '3' ){
	                        				$('#galeryHolder').append('<div class="col-xs-12 galHeight sectionSingle height3" style="background-image:url('+imgSrc+');"></div>')
	                        			}
	                        			else if( caption.trim() == '2' ||  caption.trim() == '2/3'){
	                        				$('#galeryHolder').append('<div class="col-xs-8 galHeight height2" style="background-image:url('+imgSrc+');"></div>')
	                        			} 
	                        			else if( caption.trim() == '4'){
	                        				$('#galeryHolder').append('<div class="col-xs-4 galHeight height2" style="background-image:url('+imgSrc+');"></div>')
	                        			}
	                        			else if( caption.trim() == '5'){
	                        				$('#galeryHolder').append('<div class="col-xs-8 galHeight height4" style="background-image:url('+imgSrc+');"></div>')
	                        			}
	                        			else{
	                        				$('#galeryHolder').append('<div class="col-xs-4 galHeight" style="background-image:url('+imgSrc+');"></div>')
	                        			}
	                        		});
	                        	});
	                        	</script>
</div>
</div>
</div>
<div class="sectionn" id="section2">
<div class="element company work">
<div class="element-middle">
<div class="intro">
<div class="container">
<div class="row">
<div class="col-xs-12">
<div class="firstPageDsc">
<div id='gallery-1' class='gallery galleryid-552 gallery-columns-3 gallery-size-full'><figure class='gallery-item'>
<figcaption class='wp-caption-text gallery-caption' id='gallery-1-557'>
2
</figcaption></figure>

<figure class='gallery-item'>

<figcaption class='wp-caption-text gallery-caption' id='gallery-1-523'>
${requestScope.imagecount}
</figcaption></figure><figure class='gallery-item'>

<a href='http://pulla.tv/works/proline-2/baseball_bats/'><img width="1280" height="720" src="picture/baseball_bats.jpg" class="attachment-full" alt="baseball_bats"/></a>
</div></figure>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="sectionn" id="section2">
<div class="element company work pd60">
<div class="element-middle">
<div class="intro">
<div class="container">
<div class="row">
<div class="col-xs-12">
<div class="firstPageDsc">
<ul class="paggination  ">
<c:if test="${requestScope.id-1>=0}">
<li><a class="more" href="${basePath}/webgallery?id=${requestScope.id-1}">Prev Work</a></li>
</c:if>

<li><p>Work : <span>${requestScope.id}</span> / ${requestScope.size-1}</p></li>
<c:if test="${requestScope.id+1<requestScope.size}">
<li><a class="more" href="${basePath}/webgallery?id=${requestScope.id+1}">Next Work</a></li>
</c:if>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
 
<script type="text/javascript" src="${basePath}static/company/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="${basePath}static/company/js/jquery.flexslider.js"></script>
 
<script type="text/javascript" src="${basePath}static/company/js/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/jquery.fancybox-thumbs.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/jquery.fancybox.media.js"></script>
 
<script type="text/javascript" src="${basePath}static/company/js/supersized.3.2.7.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/supersized.shutter.min.js"></script>
 
<script type="text/javascript" src="${basePath}static/company/js/jquery.selectbox-0.2.js"></script>
 
<script type="text/javascript" src="${basePath}static/company/js/jquery.jcarousel.min.js"></script>
 
<script type="text/javascript" src="${basePath}static/company/js/jquery.icheck.min.js"></script>
 
<script type="text/javascript" src="${basePath}static/company/js/parsley.min.js"></script>
 
<script type="text/javascript" src="${basePath}static/company/js/jquery.gridrotator.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/jquery.masonry.min.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/js-url.min.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/jquerypp.custom.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/instafeed.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/slick.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/scripts.js"></script>
<script type="text/javascript" src="${basePath}static/company/js/gamma.js"></script>
 
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  
    <!-- mobile meta tag -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" href="<%=basePath%>static/favicon.ico">

    <!-- main style -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/style.css" media="screen" />

    <!-- color scheme -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/color-schemes/red/red.css" media="screen" title="red" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/color-schemes/yellow/yellow.css" media="screen" title="yellow" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/color-schemes/orange/orange.css" media="screen" title="orange" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/color-schemes/blue/blue.css" media="screen" title="blue" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/color-schemes/green/green.css" media="screen" title="green" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/color-schemes/purple/purple.css" media="screen" title="purple" />

    <!--miscellaneous-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/css/superfish.css" media="screen">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/css/prettyPhoto.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/css/font-awesome.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/css/audioplayer.css" media="screen" />

    <!-- revolution slider settings -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/rs-plugin/css/settings.css" media="screen" />

    <!-- setting mobile environment -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/css/responsive.css" media="screen" />

    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/css/font-awesome-ie7.min.css">
    <![endif]-->

    <!--[if lt IE 9]>
    <script src="../../../html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/hoverIntent.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/superfish.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.jcarousel.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.tweet.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jflickrfeed.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/slides.min.jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.mobilemenu.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.contact.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.preloadify.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.jplayer.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.isotope.min.js"></script>

    <!-- jQuery Revolution Slider -->
    <script type="text/javascript" src="<%=basePath%>static/front/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <script type="text/javascript" src="<%=basePath%>static/front/js/custom.js"></script>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/front/template-changer.css" media="screen"/>
    <script type="text/javascript" src="<%=basePath%>static/front/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/front/js/styleswitch.js"></script>

    <!-- Google Web Fonts -->
    <link href='../../../fonts.googleapis.com/css@family=Open+Sans_3A300,400,600,700' rel='stylesheet' type='text/css'>


    <script type="text/javascript">
        $(function()
                {
                    // Call stylesheet init so that all stylesheet changing functions
                    // will work.
                    $.stylesheetInit();

                    // This code loops through the stylesheets when you click the link with
                    // an ID of "toggler" below.
                    $('#toggler').bind(
                            'click',
                            function(e)
                            {
                                $.stylesheetToggle();
                                return false;
                            }
                    );

                    // When one of the styleswitch links is clicked then switch the stylesheet to
                    // the one matching the value of that links rel attribute.
                    $('.styleswitch').bind(
                            'click',
                            function(e)
                            {
                                $.stylesheetSwitch(this.getAttribute('rel'));
                                return false;
                            }
                    );
                }
        );
    </script>

</head>
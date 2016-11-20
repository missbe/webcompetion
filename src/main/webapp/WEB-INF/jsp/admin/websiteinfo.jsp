<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="basePath" value="<%=basePath %>" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Missbe | 后台</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <base href="${basePath}">
    <link rel="stylesheet" href="${basePath}static/admin/bootstrap/css/ssi-uploader.css"/>
    <link rel="icon" type="image/png" href="${basePath}static/admin/assets/i/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="${basePath}static/admin/assets/i/favicon.ico">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="${basePath}static/admin/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="${basePath}static/admin/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${basePath}static/admin/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${basePath}static/admin/assets/css/app.css">
    <link rel="stylesheet" href="${basePath}static/admin/assets/css/pintuer.css">
    <script src="${basePath}static/admin/assets/js/jquery.min.js"></script>
    <script src="${basePath}static/admin/assets/js/lang.js"></script>
    <script src="${basePath}static/admin/bootstrap/js/bootstrap.min.js"></script>
    <script src="${basePath}static/admin/assets/js/jquery.min.js"></script>
    <script src="${basePath}static/admin/assets/js/pintuer.js"></script>
    <link rel="stylesheet" href="${basePath}static/admin/assets/css/admin1.css" />
    <link rel="Stylesheet" href="${basePath}static/admin/assets/css/bootstrap.min.css" />
    <link rel="Stylesheet" href="${basePath}static/admin/assets/css/imgupload.css" />
    <script src="${basePath}static/admin/bootstrap/js/bootstrap.min.js"></script>
    <script src="${basePath}static/admin/assets/js/imgupload.js"></script>
    
</head>

<body data-type="index">
<script src="${basePath}static/admin/assets/js/theme.js"></script>
<div class="am-g tpl-g">
    <!-- 头部 -->
    <header>
        <!-- logo -->
        <div class="am-fl tpl-header-logo">
            <a href="javascript:;"><img src="<%=basePath%>static/admin/assets/img/logo.png"   alt=""></a>
        </div>
        <!-- 右侧内容 -->
        <div class="tpl-header-fluid">
            <!-- 侧边切换 -->
            <div class="am-fl tpl-header-switch-button am-icon-list">
                    <span>

                </span>
            </div>
            <!-- 语言切换 -->
            <div class="am-fl tpl-header-search" style="margin:1.2% auto 0px">
                <ul class="bread" style="margin:1.2% auto 0px 0px">
                
  <li><b>当前语言：</b><span style="color:red;" id="locallanguage">中文</span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="javascript:zh_tran('s');">中文</a> &nbsp;&nbsp;<a href="javascript:zh_tran('t');">繁体</a> </li>
</ul>
            </div>
            <!-- 其它功能-->
            <div class="am-fr tpl-header-navbar">
                <ul>
                    <!-- 欢迎语 -->
                    <li class="am-text-sm tpl-header-navbar-welcome">
                        <a href="javascript:;">欢迎你, <span>${sessionScope.manager.nickName}</span> </a>
                    </li>

                    <!-- 新邮件 -->
                    <li class="am-dropdown tpl-dropdown" data-am-dropdown>
                        <a href="javascript:;" class="am-dropdown-toggle tpl-dropdown-toggle" data-am-dropdown-toggle>
                            <i class="am-icon-envelope"></i>
                            <span class="am-badge am-badge-success am-round item-feed-badge">1</span>
                        </a>
                        <!-- 弹出列表 -->
                        <ul class="am-dropdown-content tpl-dropdown-content">
                            <li class="tpl-dropdown-menu-messages">
                                <a href="javascript:;" class="tpl-dropdown-menu-messages-item am-cf">
                                    <div class="menu-messages-ico">
                                        <img src="<%=basePath%>${sessionScope.manager.image}" alt="">
                                    </div>
                                    <div class="menu-messages-time">
                                        3小时前
                                    </div>
                                    <div class="menu-messages-content">
                                        <div class="menu-messages-content-title">
                                            <i class="am-icon-circle-o am-text-success"></i>
                                            <span>${sessionScope.manager.nickName}</span>
                                        </div>
                                        <div class="am-text-truncate"> 你有新的邮件通知哦！请尽快去邮箱查看^_^ </div>
                                        <div class="menu-messages-content-time">2016-09-21 下午 16:40</div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- 新提示 -->
                    <li class="am-dropdown" data-am-dropdown>
                        <a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>
                            <i class="am-icon-bell"></i>
                            <span class="am-badge am-badge-warning am-round item-feed-badge">2</span>
                        </a>

                        <!-- 弹出列表 -->
                        <ul class="am-dropdown-content tpl-dropdown-content">
                            <li class="tpl-dropdown-menu-notifications">
                                <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                    <div class="tpl-dropdown-menu-notifications-title">
                                        <i class="am-icon-line-chart"></i>
                                        <span> 你的博客被点击了哦^_^</span>
                                    </div>
                                    <div class="tpl-dropdown-menu-notifications-time">
                                        12分钟前
                                    </div>
                                </a>
                            </li>
                            <li class="tpl-dropdown-menu-notifications">
                                <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                    <div class="tpl-dropdown-menu-notifications-title">
                                        <i class="am-icon-star"></i>
                                        <span> 你的摄影作品被查看了哦^_^</span>
                                    </div>
                                    <div class="tpl-dropdown-menu-notifications-time">
                                        30分钟前
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- 退出 -->
                    <li class="am-text-sm">
                        <a href="${basePath}admin/exit">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </header>
    <!-- 风格切换 -->
    <div class="tpl-skiner">
        <div class="tpl-skiner-toggle am-icon-cog">
        </div>
        <div class="tpl-skiner-content">
            <div class="tpl-skiner-content-title">
                选择主题
            </div>
            <div class="tpl-skiner-content-bar">
                <span class="skiner-color skiner-white" data-color="theme-white"></span>
                <span class="skiner-color skiner-black" data-color="theme-black"></span>
            </div>
        </div>
    </div>
    <!-- 侧边导航栏 -->
    <div class="left-sidebar">
        <!-- 用户信息 -->
        <div class="tpl-sidebar-user-panel">
            <div class="tpl-user-panel-slide-toggleable ">
                <div class="tpl-user-panel-profile-picture radius-circle rotate-hover">
                    <img src="<%=basePath%>static/upload/admin/logo.jpg" width="100px" height="100px" alt="">
                </div>
                <span class="user-panel-logged-in-text">
              <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>
                 ${sessionScope.manager.nickName}
          </span>
                <a href="${basePath}admin/manager/setting" class="tpl-user-panel-action-link"> <span class="am-icon-pencil"></span> 账号设置</a>
            </div>
        </div>

        <!-- 菜单 -->
        <ul class="sidebar-nav">

            <li class="sidebar-nav-link">
                <a href="${basePath}admin" class="active">
                    <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="<%=basePath %>admin/manager/list?pageNo=1">
                    <i class="am-icon-user sidebar-nav-link-logo"></i> 帐户管理
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="javascript:;" class="sidebar-nav-sub-title">
                    <i class="am-icon-file-text sidebar-nav-link-logo"></i> 博客管理
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="<%=basePath %>admin/blog/report">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span>发表博客
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="<%=basePath %>admin/blog/list">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 博客列表
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-nav-link">
                <a href="javascript:;" class="sidebar-nav-sub-title">
                    <i class="am-icon-image sidebar-nav-link-logo"></i> 画廊管理
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="<%=basePath %>admin/image/report">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 新增图文
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="table-list-img.html">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 图文列表
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-nav-link">
                <a href="javascript:;" class="sidebar-nav-sub-title">
                    <i class="am-icon-code sidebar-nav-link-logo"></i> 项目管理
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="table-list.html">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 项目内容管理
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="table-list-img.html">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 项目权限管理
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-nav-link">
                <a href="javascript:;" class="sidebar-nav-sub-title">
                    <i><img src="${basePath}static/admin/assets/img/company.png" style="width:1.5em;height:1.5em;"></i>&nbsp;&nbsp;&nbsp;公司页面管理
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="<%=basePath %>admin/company/websiteinfo">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 网站基本信息管理
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="table-list-img.html">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 项目权限管理
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
  <script>
    var language = navigator.browserLanguage ? navigator.browserLanguage : navigator.language;
    if (language.indexOf('en') > -1) document.location.href = 'english.htm';
    else if (language.indexOf('nl') > -1) document.getElementById('locallanguage').innerHTML = "English";
    else if (language.indexOf('fr') > -1) document.getElementById('locallanguage').innerHTML = "Français";
    else if (language.indexOf('de') > -1) document.getElementById('locallanguage').innerHTML = "Deutsch";
    else if (language.indexOf('ja') > -1) document.getElementById('locallanguage').innerHTML = "日本語";
    else if (language.indexOf('it') > -1) document.getElementById('locallanguage').innerHTML = "In Italiano";
    else if (language.indexOf('pt') > -1) document.getElementById('locallanguage').innerHTML = "Português";
    else if (language.indexOf('es') > -1) document.getElementById('locallanguage').innerHTML = "El español";
    else if (language.indexOf('sv') > -1) document.getElementById('locallanguage').innerHTML = "svenska";
    else if (language.indexOf('zh') > -1) document.getElementById('locallanguage').innerHTML = "中文";
    else
        document.getElementById('locallanguage').innerHTML = "中文";
   
</script>
    <style >
        .none 
         { 
          width:0px; 
          height:0px; 
          display: none; 
          } 
        .tpl-content-wrapper-replace {
           transition: all 0.4s ease-in-out;
  		   position: relative;
           margin-left: 240px;
           min-height: 922px;
           border-bottom-left-radius: 3px;
           }
    </style>
    <script text="text/javascript">
        $(document).ready(function () {
            $("#image1").click(function () {
                return $("#upload").click();
            });
        });
    </script>
     <!-- 内容区域 -->
    <div class="tpl-content-wrapper" style="z-index:0">
    <div class="row-content am-cf">
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 网站信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=basePath %>admin/company/uploadForm" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>网站标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="stitle" value="${requestScope.webinfo.title}" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站LOGO：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="slogo" class="input tips" style="width:25%; float:left;" value="" data-toggle="hover" data-place="right" data-image="${basePath}static/upload/company/logo.png"   />
          <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传" /><div class="none"><input id="upload" class="imginput" type="file" onchange="document.getElementById('url1').value=this.value" /></div><input type="button" class="button bg-yellow margin-left" value="上传" onclick="uploadimg();" /><div class="imgzip"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站域名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="surl" value="${requestScope.webinfo.domain}" />
        </div>
      </div>
      <div class="form-group" style="display:none">
        <div class="label">
          <label>副加标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="sentitle" value="" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站关键字：</label>
        </div>
        <div class="field">
          <textarea class="input" name="skeywords" style="height:80px" >${requestScope.webinfo.keywords}</textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站描述：</label>
        </div>
        <div class="field">
          <textarea class="input" name="sdescription" >${requestScope.webinfo.description}</textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>联系人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_name" value="${requestScope.webinfo.person}" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>手机：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_phone" value="${requestScope.webinfo.phone}" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_tel" value="${requestScope.webinfo.phone_400}" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group" style="display:none;">
        <div class="label">
          <label>400电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_400" value="" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>传真：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_fax" value="${requestScope.webinfo.fax}" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>QQ：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_qq" value="${requestScope.webinfo.qq}" />
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>Email：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_email" value="${requestScope.webinfo.email}" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_address" value="${requestScope.webinfo.address}" />
          <div class="tips"></div>
        </div>
      </div>  
              
      <div class="form-group">
        <div class="label">
          <label>底部信息：</label>
        </div>
        <div class="field">
          <textarea name="scopyright" class="input" style="height:120px;" >${requestScope.webinfo.footer_info}</textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</div>
</div>
<span id="tpl-echarts" />
<jsp:include page="common/footer.jsp" />
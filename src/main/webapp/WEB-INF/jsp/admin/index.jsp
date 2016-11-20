<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7 0007
  Time: 下午 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="common/header.jsp" />
<div class="container-fluid am-cf">
    <div class="row">
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
            <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> Missbe | 后台首页
                <small>依然慢节奏</small>
            </div>
            <p class="page-header-description">---------下面是你的概要信息---------</p>
        </div>
    </div>

</div>
<div class="row-content am-cf">

    <div class="row am-cf">

        <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
            <div class="widget widget-primary am-cf widget-body-md">
                <div class="widget-statistic-header">
                    ==发表博客数目===
                </div>
                <div class="widget-statistic-body">
                    <div class="widget-statistic-value">
                        【${sessionScope.blogCount}】
                    </div>
                    <div class="widget-statistic-description">
                        --- 本月比上月多发表了 <strong>0</strong> 篇哦----
                    </div>
                    <span class="widget-statistic-icon am-icon-credit-card-alt"></span>
                    <span id="tpl-echarts"/> <!--加id才能够进行隐藏操作-->

                </div>
            </div>
        </div>

        <div class="am-u-sm-12 am-u-md-6 am-u-lg-4 am-u-end">
            <div class="widget widget-purple am-cf widget-body-md">
                <div class="widget-statistic-header">
                    ==发表图文数目===
                </div>
                <div class="widget-statistic-body">
                    <div class="widget-statistic-value">
                        【${sessionScope.galleryCount}】
                    </div>
                    <div class="widget-statistic-description">
                        --- 本月比上月少发表了 <strong>0</strong> 篇哦----
                    </div>
                    <span class="widget-statistic-icon am-icon-support"></span>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="common/footer.jsp" />
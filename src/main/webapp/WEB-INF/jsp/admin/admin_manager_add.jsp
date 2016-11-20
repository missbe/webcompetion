<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7 0007
  Time: 下午 11:36
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

<div class="row-content am-cf">
    <div class="row">
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
            <div class="widget am-cf">
                <div class="widget-head am-cf">
                    <div class="widget-title am-fl">----管理员信息--</div>
                    <!--
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
-->
                </div>
                <div class="widget-body am-fr">

                    <form class="am-form tpl-form-border-form tpl-form-border-br" method="post" enctype="multipart/form-data"
                          action="<%=basePath %>admin/manager/addManager" id="managerForm">
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">管理员名称 <span class="tpl-form-line-small-title">管理员</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" class="tpl-form-input" name="userName" id="user-name" placeholder="请输入管理员昵称">
                               <small style="color: red">*</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-nickname" class="am-u-sm-3 am-form-label">管理员昵称 <span class="tpl-form-line-small-title">昵称</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" class="tpl-form-input" name="nickname" id="user-nickname" placeholder="请输入管理员密码">
                                <small style="color: red">*</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">管理员密码 <span class="tpl-form-line-small-title">密码</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" class="tpl-form-input" name="userPass" id="user-pass" placeholder="请输入管理员密码">
                                <small style="color: red">*</small>
                            </div>
                        </div>


                        <div class="am-form-group">
                            <label for="user-permission" class="am-u-sm-3 am-form-label">管理权限 <span class="tpl-form-line-small-title">权限</span></label>
                            <div class="am-u-sm-9">
                                <select data-am-selected="{searchBox: 1}" style="display: none;" name="userPermiss" id="user-permission">
                                    <option value="1">--普通管理员--</option>
                                    <option value="0">--超级管理员--</option>
                                </select>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">管理员个性签名 <span class="tpl-form-line-small-title">签名</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" placeholder="输入个性签名" name="userDescription">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-image" class="am-u-sm-3 am-form-label">头像 <span class="tpl-form-line-small-title">photo</span></label>
                            <div class="am-u-sm-9">
                                <div class="am-form-group am-form-file">
                                    <div class="tpl-form-file-img" id="user-image" name="userImage">
                                        <img src="<%=basePath%>static/admin/assets/img/user_admin.jpg" alt="">
                                    </div>
                                    <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                        <i class="am-icon-cloud-upload"></i> 添加头像</button>
                                    <input id="doc-form-file" type="file" name="multipartFile" >
                                </div>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <div class="am-u-sm-9 am-u-sm-push-3">
                                <button type="button" id="buttonSubmit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<span id="tpl-echarts" />
<!--加id才能够进行隐藏操作-->
<!-- content end-->
<script>
    $("#buttonSubmit").click(function () {
        var $name=$("#user-name").val();
        var $pass=$("#user-pass").val();
        var $permiss=$("#user-permission").val();

        if($name=="" ){
            $("#message span").text("用户名不能为空");
            $("#message").fadeIn().delay(2000).fadeOut();
        }
        else if($pass=="" ){
            $("#message span").text("密码不能为空");
            $("#message").fadeIn().delay(2000).fadeOut();
        }else if($permiss==""){
            $("#message span").text("权限不能为空");
            $("#message").fadeIn().delay(2000).fadeOut();
        }else{
           $("#managerForm").submit();
        }
        return false;
    });
</script>
<jsp:include page="common/footer.jsp" />

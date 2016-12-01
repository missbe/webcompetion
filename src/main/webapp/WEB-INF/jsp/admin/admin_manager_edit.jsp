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
                </div>
                <div class="widget-body am-fr">

                    <form class="am-form tpl-form-border-form tpl-form-border-br" enctype="multipart/form-data"
                         method="post" action="<%=basePath %>admin/manager/saveManager" id="managerForm">
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">管理员名称 <span class="tpl-form-line-small-title">管理员</span></label>
                            <div class="am-u-sm-9">
                                <input type="hidden" name="id" value="${requestScope.manager.id}" />
                                <input type="text" class="tpl-form-input"
                                       <c:if test="${!empty requestScope.manager.name}">
                                         value="${requestScope.manager.name}"
                                       </c:if>
                                       name="userName" id="user-name" placeholder="请输入管理员昵称">
                                <small style="color: red">*</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-nickname" class="am-u-sm-3 am-form-label">管理员昵称 <span class="tpl-form-line-small-title">昵称</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" class="tpl-form-input" value="${requestScope.manager.nickName}" name="nickname" id="user-nickname" placeholder="请输入管理员密码">
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
                            <label for="user-permission" class="am-u-sm-3 am-form-label">管理级别 <span class="tpl-form-line-small-title">权限</span></label>
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
                                <input type="text" placeholder="输入个性签名"
                                <c:if test="${!empty requestScope.manager.description}">
                                       value="${requestScope.manager.description}"
                                </c:if>
                                 name="userDescription">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-image" class="am-u-sm-3 am-form-label">头像 <span class="tpl-form-line-small-title">photo</span></label>
                            <div class="am-u-sm-9">
                                <div class="am-form-group am-form-file">
                                    <div class="tpl-form-file-img" id="user-image" name="userImage">
                                        <img height="100px" height="100px" <c:if test="${!empty requestScope.manager.image}">
                                                src="<%=basePath%>${requestScope.manager.image}"
                                                </c:if>
                                         alt="" class="img-dynic" id="img-first">
                                    </div>
                                    <button type="button" id="modifyImage" class="am-btn am-btn-danger am-btn-sm">
                                        <i class="am-icon-cloud-upload"></i> 修改头像</button>
                                    <input id="doc-form-file" onchange="getImgURL(this)" name="multipartFile" type="file" >
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
    $("#modifyImage").click(function () {
        var path=document.getElementById("#doc-form-file").value;
        $("#image").attr("src",path);
    });
</script>
<script type="text/javascript">

    var imgurl = "";
    var index=0;

    function getImgURL(node) {
        var imgURL = "";
        try{
            var file = null;
            if(node.files && node.files[0] ){
                file = node.files[0];
            }else if(node.files && node.files.item(0)) {
                file = node.files.item(0);
            }
            //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
            try{
                //Firefox7.0
                imgURL =  file.getAsDataURL();
                //alert("//Firefox7.0"+imgRUL);
            }catch(e){
                //Firefox8.0以上
                imgRUL = window.URL.createObjectURL(file);
                //alert("//Firefox8.0以上"+imgRUL);
            }
        }catch(e){      //这里不知道怎么处理了，如果是遨游的话会报这个异常
            //支持html5的浏览器,比如高版本的firefox、chrome、ie10
            if (node.files && node.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    imgURL = e.target.result;
                };
                reader.readAsDataURL(node.files[0]);
            }
        }
        //imgurl = imgURL;
        creatImg(imgRUL);
        return imgURL;
    }

    function creatImg(imgRUL){   //根据指定URL创建一个Img对象
        index = index+1;
        $("#img-first").attr("src",imgRUL);
    }

</script>
<script>
    document.title = '管理员编辑';
</script>
<script>    
    $("#header_zhanghu").attr("class","active")    
</script>
<jsp:include page="common/footer.jsp" />

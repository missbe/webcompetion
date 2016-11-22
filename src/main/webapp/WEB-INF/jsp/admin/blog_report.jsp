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
<script type="text/javascript" charset="utf-8" src="<%=basePath%>static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>static/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=basePath%>static/ueditor/lang/zh-cn/zh-cn.js"></script>

<div class="row-content am-cf">

    <div class="row">

        <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
            <div class="widget am-cf">
                <div class="widget-head am-cf">
                    <div class="widget-title am-fl">---发表博客--</div>
                    <!--
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
-->
                </div>
                <div class="widget-body am-fr">

                    <form class="am-form tpl-form-border-form tpl-form-border-br" enctype="multipart/form-data"
                          <c:if test="${!empty requestScope.blog}">
                              action="<%=basePath %>admin/blog/saveBlog?flagUpdate=update&id=${requestScope.blog.id}"
                          </c:if>
                          <c:if test="${empty requestScope.blog}">
                              action="<%=basePath %>admin/blog/saveBlog"
                           </c:if>
                          method="post"  id="managerForm">
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">标题 <span class="tpl-form-line-small-title">Title</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" class="tpl-form-input" id="user-name"
                                       <c:if test="${!empty requestScope.blog}">
                                          value="${ requestScope.blog.blogTitle}"
                                       </c:if>
                                       name="title" placeholder="请输入标题文字">
                                <small>请填写标题文字10-20字左右。</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-date" class="am-u-sm-3 am-form-label">发布时间 <span class="tpl-form-line-small-title">Time</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" id="user-date" name="date"
                                <c:if test="${!empty requestScope.blog}">
                                       value="${ requestScope.blog.blogTime}"
                                 </c:if>
                                class="am-form-field tpl-form-no-bg" placeholder="发布时间" data-am-datepicker="" readonly="">
                                <small>发布时间为必填</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-label" class="am-u-sm-3 am-form-label">添加标签 <span class="tpl-form-line-small-title">TAG</span></label>
                            <div class="am-u-sm-9">
                                <select data-am-selected="{searchBox: 1}" style="display: none;" name="tags" id="user-label">
                                    <c:if test="${!empty requestScope.tags}">
                                        <c:forEach var="tag" items="${requestScope.tags}">
                                           <option value="${tag}"
                                                   <c:if test="${tag==requestScope.blog.tags}">
                                                       selected="selected"
                                                   </c:if>
                                           >${tag}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-image" class="am-u-sm-3 am-form-label">封面图 <span class="tpl-form-line-small-title">Images</span></label>
                            <div class="am-u-sm-9">
                                <div class="am-form-group am-form-file" id="user-image">
                                    <div class="tpl-form-file-img">
                                        <img class="img-dynic" id="img-first"
                                        <c:if test="${!empty requestScope.blog}">
                                           src="<%=basePath%>${requestScope.blog.blogImage}"
                                        </c:if>
                                        <c:if test="${empty requestScope.blog}">
                                            src="<%=basePath%>static/admin/assets/img/k.jpg"
                                        </c:if>
                                        alt="" width="300px" height="200px">
                                    </div>
                                    <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                        <i class="am-icon-cloud-upload"></i> ==添加封面图片==</button>
                                    <input id="doc-form-file" onchange="getImgURL(this)"  type="file" name="multipartFile">
                                </div>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-category" class="am-u-sm-3 am-form-label">添加分类 <span class="tpl-form-line-small-title">CATEGORY</span></label>
                            <div class="am-u-sm-9">
                                <select data-am-selected="{searchBox: 1}" style="display: none;" name="category" id="user-category">
                                    <c:if test="${!empty requestScope.catgorys}">
                                        <c:forEach var="catgory" items="${requestScope.catgorys}">
                                            <option value="${catgory}"
                                                    <c:if test="${catgory ==requestScope.blog.category}">
                                                        selected="selected"
                                                    </c:if>
                                            >${catgory}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-intro" class="am-u-sm-3 am-form-label">是否可见</label>
                            <div class="am-u-sm-9">
                                <div class="tpl-switch">
                                    <input type="checkbox" class="ios-switch bigswitch tpl-switch-btn" name="visible" checked="">

                                    <div class="tpl-switch-btn-view">
                                        <div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="editor" class="am-u-sm-3 am-form-label">文章内容</label>
                            <div class="am-u-sm-9">
                                <input type="hidden" name="content" id="content"/>
                                <script id="editor"  type="text/plain" style="width:auto;height:300px;"></script>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <div class="am-u-sm-9 am-u-sm-push-3">
                                <button type="button" id="sure" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
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
<script type="text/javascript">

    var ue = UE.getEditor('editor');
    //对编辑器的操作最好在编辑器ready之后再做
    ue.ready(function() {
        if(${!empty requestScope.blog}){
            ue.setContent('${requestScope.blog.blogContent}');
        }else{
            //设置编辑器的内容
            ue.setContent('---在这里写博客--');
        }
        //获取html内容，返回: <p>hello</p>
        var html = ue.getContent();
        //获取纯文本内容，返回: hello
        var txt = ue.getContentTxt();
    });

    $("#sure").click(function () {
        var $name=$("#user-name").val();
        var $date=$("#user-date").val();
//        var $permiss=$("#user-permission").val();

        if($name=="" ){
            $("#message span").text("用户名不能为空");
            $("#message").fadeIn().delay(2000).fadeOut();
        }
        else if($date=="" ){
            $("#message span").text("时间不能为空");
            $("#message").fadeIn().delay(2000).fadeOut();
        }else{
            document.getElementById("content").value=ue.getContent();
//            console.log(ue.getContent());
//            console.log(  document.getElementById("content").value);
           $("#managerForm").submit();
       }
        return false;
    });
    $("#modifyImage").click(function () {
        var path=document.getElementById("doc-form-file").value;
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
    document.title = '博客发表';
</script>
<jsp:include page="common/footer.jsp" />

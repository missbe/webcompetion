<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7 0007
  Time: 下午 11:13
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
                        <div class="widget-title am-fl">----图文发表----</div>
                    </div>
                    <div class="widget-body am-fr">

                        <form class="am-form tpl-form-border-form tpl-form-border-br" id="myForm" method="post"
                             action="<%=basePath%>admin/gallery/saveGallery" enctype="multipart/form-data" >
                            <div class="am-form-group">
                                <label for="user-title" class="am-u-sm-3 am-form-label">标题 <span class="tpl-form-line-small-title">Title</span></label>
                                <div class="am-u-sm-9">
                                    <input type="hidden" value="${requestScope.gallery.id}" />
                                    <input type="text" class="tpl-form-input" id="user-title"
                                           <c:if test="${!empty requestScope.gallery.galleryTitle}">
                                             value="${requestScope.gallery.galleryTitle}"
                                           </c:if>
                                           name="title" placeholder="请输入标题文字">
                                    <small>请填写标题文字10-20字左右。</small>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label  class="am-u-sm-3 am-form-label">发布时间 <span class="tpl-form-line-small-title">Time</span></label>
                                <div class="am-u-sm-9">
                                    <input type="text" class="am-form-field tpl-form-no-bg"
                                    <c:if test="${!empty requestScope.gallery.galleryTime}">
                                           value="${requestScope.gallery.galleryTime}"
                                    </c:if>
                                           name="date" placeholder="发布时间" data-am-datepicker="" readonly="">
                                    <small>发布时间为必填</small>
                                </div>
                            </div>


                            <div class="am-form-group">
                                <label for="user-category" class="am-u-sm-3 am-form-label">添加分类 <span class="tpl-form-line-small-title">CATEGORY</span></label>
                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1}" style="display: none;" name="category" id="user-category">
                                        <c:if test="${!empty requestScope.catgorys}">
                                            <c:forEach var="catgory" items="${requestScope.catgorys}">
                                                <option value="${catgory}"
                                                 <c:if test="${requestScope.gallery.category == catgory}">
                                                    selected="selected" aria-selected="true"
                                                </c:if> >${catgory}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>

                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-intro" class="am-u-sm-3 am-form-label">图文介绍</label>
                                <div class="am-u-sm-9">
                                    <textarea class="" rows="10" id="user-intro" name="content" placeholder="请输入图文介绍">
                                    </textarea>
                                </div>
                            </div>


                            <div class="am-form-group">
                                <label for="user-label" class="am-u-sm-3 am-form-label">添加标签 <span class="tpl-form-line-small-title">TAG</span></label>
                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1}" style="display: none;" name="tags" id="user-label">
                                        <c:if test="${!empty requestScope.tags}">
                                            <c:forEach var="tag" items="${requestScope.tags}">
                                                <option value="${tag}">${tag}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>

                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-image" class="am-u-sm-3 am-form-label">==添加新的==
                                    <span class="tpl-form-line-small-title">Images</span></label>
                                <div class="am-u-sm-9">
                                    <button type="button" class="am-btn am-btn-danger am-btn-md" onclick="createHtml()">
                                        ==添加新的==</button>
                                    <button type="button" class="am-btn am-btn-danger am-btn-md" onclick="deleteHtml()">
                                        ==去掉新建==</button>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-image" class="am-u-sm-3 am-form-label">
                                    <span class="tpl-form-line-small-title"></span></label>
                                <div class="am-u-sm-9">
                                    <div class="am-form-group am-form-file" id="user-image">
                                       <div id="fileRoot">
                                           <div class="tpl-form-file-img">
                                               <img class="doc-form-file" id="doc-form-filecopy"
                                               <c:if test="${!empty requestScope.blog}">
                                                    src="<%=basePath%>${requestScope.blog.blogImage}"
                                               </c:if>
                                               <c:if test="${empty requestScope.blog}">
                                                    src="<%=basePath%>static/admin/assets/img/k.jpg"
                                               </c:if>
                                                    alt="" width="200px" height="120px">
                                           </div>
                                           <button type="button" class="am-btn am-btn-danger am-btn-sm addButton" >
                                               <i class="am-icon-cloud-upload"></i> ==选择图片==</button>
                                           <input id="doc-form-file" class="doc-form-file" onchange="getImgURL(this)" type="file" multiple="multiple" name="file">
                                       </div>

                                    </div>
                                </div>
                            </div>

                            <%--<div class="am-form-group">--%>
                                <%--<label for="user-image" class="am-u-sm-3 am-form-label">--%>
                                    <%--<span class="tpl-form-line-small-title"></span></label>--%>
                                <%--<div class="am-u-sm-9">--%>
                                    <%--<div class="am-form-group am-form-file" id="user-image">--%>
                                        <%--<div id="fileRoot">--%>
                                            <%--<div class="tpl-form-file-img">--%>
                                                <%--<img class="doc-form-file" id="doc-form-file2copy"--%>
                                                <%--<c:if test="${!empty requestScope.blog}">--%>
                                                     <%--src="<%=basePath%>${requestScope.blog.blogImage}"--%>
                                                <%--</c:if>--%>
                                                <%--<c:if test="${empty requestScope.blog}">--%>
                                                     <%--src="<%=basePath%>static/admin/assets/img/k.jpg"--%>
                                                <%--</c:if>--%>
                                                     <%--alt="" width="200px" height="120px">--%>
                                            <%--</div>--%>
                                            <%--<button type="button" class="am-btn am-btn-danger am-btn-sm addButton" >--%>
                                                <%--<i class="am-icon-cloud-upload"></i> ==选择图片==</button>--%>
                                            <%--<input id="doc-form-file2" class="doc-form-file" onchange="getImgURL(this)" type="file" multiple="multiple" name="file">--%>
                                        <%--</div>--%>

                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>

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
</div>
</div>
</div>
<script src="<%=basePath%>static/admin/assets/js/amazeui.min.js"></script>
<script src="<%=basePath%>static/admin/assets/js/amazeui.datatables.min.js"></script>
<script src="<%=basePath%>static/admin/assets/js/dataTables.responsive.min.js"></script>
<script src="<%=basePath%>static/admin/assets/js/app.js"></script>

<script type="text/javascript">
    $("#buttonSubmit").click(function () {
//        alert("buttonSubmit");

        var $title=$("#user-title").val();
        var $content=$("#user-intro").val();

        if($title=="" ){
            $("#message span").text("标题不能为空");
            $("#message").fadeIn().delay(2000).fadeOut();
        }else if($content=="" ){
            $("#message span").text("内容不能为空");
            $("#message").fadeIn().delay(2000).fadeOut();
        }else{
            $("#myForm").submit();
        }
        return false;
    });
    $(".addButton").click(function () {
       alert("选择文件中");
    });
    function change() {
        alert("Love TT");
    }

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
        console.log("CLASS"+$(node).attr('class'));
        console.log("ID"+$(node).attr('id'));
        var cla=$(node).attr('id')+'copy';
        //imgurl = imgURL;
        creatImg(imgRUL,cla);
        return imgURL;
    }

    function creatImg(imgRUL,cla){   //根据指定URL创建一个Img对象
        $('#'+cla).attr("src",imgRUL);
    }
    
    function createHtml() {
        var ids='doc-form-file'+index;
        var idsCopy=ids+'copy';

        var fileHtml="<div class='newFile'><div class='tpl-form-file-img'>"+
        " <img id='"+idsCopy+"' id='img-first'src='<%=basePath%>static/admin/assets/img/k.jpg' width='200px' height='120px'>"+ " </div>"+
          "<button type='button' class='am-btn am-btn-danger am-btn-sm addButton' >"+
          "<i class='am-icon-cloud-upload'"+"></i> ==选择图片==</button>"+
           "<input id='"+ids+"' onchange='getImgURL(this)' type='file' name='file' '></div>";

        $("#fileRoot").after(fileHtml);
        console.log(ids+"--:---"+idsCopy);
    }
    function  deleteHtml() {
        $(".newFile").remove();
    }
</script>
<script>
    document.title = '图文发表';
</script>

<script>    
    $("#header_gallery").attr("class","sidebar-nav-sub-title active")    
</script>
</body>

</html>

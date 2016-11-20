<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/14 0014
  Time: 下午 5:50
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
        <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm" style="z-index: 99999">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">确认窗口</div>
                <div class="am-modal-bd">
                    你，确定要删除这篇图文吗？
                </div>
                <div class="am-modal-footer">
                    <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                    <span class="am-modal-btn" data-am-modal-confirm>确定</span>
                </div>
            </div>
        </div>
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
            <div class="widget am-cf">
                <div class="widget-head am-cf">
                    <div class="widget-title  am-cf">----图文列表----</div>


                </div>
                <div class="widget-body  am-fr">

                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                        <div class="am-form-group">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 全选</button>
                                    <button type="button" id="buttonAdd" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
                                    <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                    <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="am-form-group tpl-table-list-select">
                            <select data-am-selected="{btnSize: 'sm'}" id="blog_category" onchange="findCategory()">
                                <option value="all">所有类别</option>
                                <c:if test="${!empty requestScope.catgorys}">
                                    <c:forEach var="catgory" items="${requestScope.catgorys}">
                                        <option value="${catgory}" <c:if test="${requestScope.paramCategory == catgory}">
                                            aria-checked="true" selected="selected"</c:if>>${catgory}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                        <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                            <input type="text" class="am-form-field ">
                            <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button"></button>
          </span>
                        </div>
                    </div>

                    <div class="am-u-sm-12">
                        <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                            <thead>
                            <tr>
                                <th>图文封面</th>
                                <th>图文标题</th>
                                <th>作者</th>
                                <th>时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--<%   //request.getParameter("managerList");--%>
                            <%--Map<Integer,String> map=(HashMap<Integer,String>)request.getAttribute("managerList");--%>
                            <%--List<Blog> blogListCopy=(ArrayList<Blog>)request.getAttribute("blogList");////创建一个副本--%>
                            <%--%>--%>
                            <c:if test="${!empty requestScope.gallerys}">
                                <c:forEach var="gallery" items="${requestScope.gallerys}">
                                    <tr class="gradeX">
                                        <td>
                                            <c:forTokens items="${gallery.galleryImgage}" var="path" delims="," >
                                                <c:set var="imagePath" value="${path}"/>
                                            </c:forTokens>
                                            <img src="<%=basePath%>${imagePath}" class="tpl-table-line-img" alt="">
                                        </td>
                                        <td class="am-text-middle">${gallery.galleryTitle}</td>
                                        <td class="am-text-middle">${requestScope.managerList[gallery.adminId]}</td>
                                        <td class="am-text-middle">${gallery.galleryTime}</td>
                                        <td class="am-text-middle">
                                            <div class="tpl-table-black-operation">
                                                <a href="javascript:;" value="${gallery.id}" class="blog_edit">
                                                    <i  class="am-icon-pencil "  data-toggle="modal" data-target="#myModal"></i> 编辑
                                                </a>
                                                <a href="javascript:;" value="${gallery.id}" class="tpl-table-black-operation-del doc-confirm-toggle">
                                                    <i class="am-icon-trash "></i> 删除
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            <!-- more data -->
                            </tbody>
                        </table>

                    </div>

                    <div class="am-u-lg-12 am-cf">

                        <div class="am-fr">
                            <ul class="am-pagination tpl-pagination">
                                <li ><a href="#" id="previus">«</a></li>
                                <c:if test="${requestScope.pageCurrent-1 > 0}">
                                    <li >
                                        <span  class="pageNumber">${requestScope.pageCurrent-1}</span>
                                    </li>
                                </c:if>
                                <li  class="am-active">
                                    <span  class="pageNumber">${requestScope.pageCurrent}</span>
                                </li>
                                <c:if test="${requestScope.pageCurrent+1 <= requestScope.pageCount}">
                                    <li >
                                        <span  class="pageNumber">${requestScope.pageCurrent+1}</span>
                                    </li>
                                </c:if>
                                <li><a href="#" id="nextPage">»</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<span id="tpl-echarts" />
<!--加id才能够进行隐藏操作-->
<!-- content end-->
<script>
    var id=0;
    $(function () {
        $("#previus").click(function () {
            <%--alert("${requestScope.pageCurrent-1}");--%>
            if(0 >= ${requestScope.pageCurrent-1} ){
                return false;
            }
            $.post("<%=basePath %>admin/gallery/list",
                    {"paramCategory": $('#blog_category option:selected') .val(),"pageNo":1},
                    function(){
                        $("#message span").text("刷新成功");
                        $("#message").fadeIn().delay(2000).fadeOut();

                        window.location.reload();//刷新当前页面
                    }
            )
            return false;
        });
        $("#nextPage").click(function () {
            <%--alert("${requestScope.pageCurrent+1}");--%>
            if( ${requestScope.pageCurrent+1} > ${requestScope.pageCount}){
                return false;
            }
            $.post("<%=basePath %>admin/gallery/list",
                    {"paramCategory": $('#blog_category option:selected') .val(),"pageNo":1},
                    function(){

                        $("#message span").text("刷新成功");
                        $("#message").fadeIn().delay(2000).fadeOut();

                        window.location.reload();//刷新当前页面
                    }
            )
            return false;
        });
        $(".pageNumber").click(function () {
//            alert($(this).text());
            $.post("<%=basePath %>admin/gallery/list",
                    {"paramCategory": $('#blog_category option:selected') .val(),"pageNo":1},
                    function(){
                        $("#message span").text("刷新成功");
                        $("#message").fadeIn().delay(2000).fadeOut();
                        window.location.reload();//刷新当前页面
                    }
            );
            return false;
        });
        $(".blog_edit").click(function () {
            id=$(this).attr("value");
//            alert(id);
            window.location.href="<%=basePath %>admin/gallery/edit?id="+id;
        });
        $('.doc-confirm-toggle').on('click', function() {
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                    console.log("ID:"+id);
                    window.location.href="<%=basePath %>admin/gallery/delete?id="+id;
                }
            });
            $(".am-dimmer").attr('style','');
            return false;
        });
        $(".doc-confirm-toggle.tpl-table-black-operation-del").click(function () {
            id=$(this).attr("value");
        });
        $("#buttonAdd").click(function () {
            window.location.href="<%=basePath %>admin/gallery/report";
        });
    });
    function  findCategory() {
        // alert('findCategory');
        alert($('#blog_category option:selected') .val());//选中的值);
        $.ajax({
            type:"post",
            url:"<%=basePath %>admin/gallery/list",
            data: {"paramCategory":$('#blog_category option:selected') .val(),"pageNo":1},
            success:function(data){
//                    window.location.reload();//刷新当前页面
            },
            async:false
        });
        return false;
    }
</script>
<jsp:include page="common/footer.jsp" />

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7 0007
  Time: 下午 11:34
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

    <jsp:include page="common/message.jsp"/>

    <div class="row">
        <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm" style="z-index: 99999">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">确认窗口</div>
                <div class="am-modal-bd">
                    你，确定要删除这条记录吗？
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
                    <div class="widget-title  am-cf">管理员列表</div>
                </div>
                <div class="widget-body  am-fr">

                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                        <div class="am-form-group">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" id="buttonAdd" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
                                    <button type="button" id="buttonSave" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                    <button type="button" id="buttonDelete" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="am-u-sm-12">
                        <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                            <thead>
                            <tr>
                                <th>管理员ID</th>
                                <th>管理员用名</th>
                                <th>管理员昵称</th>
                                <th>个性签名</th>
                                <th>获得权限</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach begin="0" items="${requestScope.managerList}" var="manager">
                                <tr class="even gradeC">
                                    <td>${manager.id}</td>
                                    <td>${manager.name}</td>
                                    <td>${manager.nickName}</td>
                                    <td>${manager.description}</td>
                                    <td>${manager.permission}</td>
                                    <td>
                                        <div class="tpl-table-black-operation">
                                            <a href="javascript:;" value="${manager.id}" class="managerEdit">
                                                <i class="am-icon-pencil"></i> 编辑
                                            </a>
                                            <a href="javascript:;" value="${manager.id}" class="doc-confirm-toggle tpl-table-black-operation-del  ">
                                                <i class="am-icon-trash"></i> 删除
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- more data -->
                            </tbody>
                        </table>
                    </div>
                    <!--分布操作-->
                    <div class="am-u-lg-12 am-cf">

                        <div class="am-fr">
                            <ul class="am-pagination tpl-pagination">
                                <%--<c:out value="${requestScope.pageCurrent}">
                                class="am-disabled"</c:out>--%>
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
<script>
    var id=0;
    $(function () {
        $("#message span").text("刷新成功");
        $("#message").fadeIn().delay(2000).fadeOut();

        $("#previus").click(function () {
            <%--alert("${requestScope.pageCurrent-1}");--%>
            if(0 >= ${requestScope.pageCurrent-1} ){
                return false;
            }
            $.post("<%=basePath %>admin/manager/list",
                    {"pageNo":"${requestScope.pageCurrent-1}"},
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
            $.post("<%=basePath %>admin/manager/list",
                    {"pageNo":"${requestScope.pageCurrent+1}"},
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
            $.post("<%=basePath %>admin/manager/list",
                    {"pageNo":$(this).text()},
                    function(){
                        $("#message span").text("刷新成功");
                        $("#message").fadeIn().delay(2000).fadeOut();

                        window.location.reload();//刷新当前页面
                    }
            );
            return false;
        });

        $("#buttonAdd").click(function () {
            window.location.href="<%=basePath %>admin/manager/add";
        });
        $(".managerEdit").click(function () {
             id=$(this).attr("value");
            console.log("id:"+id);
            window.location.href="<%=basePath %>admin/manager/edit?id="+id;
        });
        $('.doc-confirm-toggle').on('click', function() {
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                    window.location.href="<%=basePath %>admin/manager/delete?id="+id;

                },
                // closeOnConfirm: false,
                onCancel: function() {
//                    alert('算求，不弄了');
                }
            });
            $(".am-dimmer").attr('style','');
            return false;
        });
        $(".doc-confirm-toggle.tpl-table-black-operation-del").click(function () {
            id=$(this).attr("value");
        });

    });
</script>

<jsp:include page="common/footer.jsp" />

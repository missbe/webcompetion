<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="basePath" value="<%=basePath %>" />
<jsp:include page="common/header.jsp"/>
<link rel="stylesheet" href="${basePath}static/admin/bootstrap/css/bootstrap.min.css">
<div class="container">
    <div class="row clearfix" style="margin-top:10%;">
        <div class="col-md-3 col-md-offset-2 ">
            <img alt="200*200" src="${basePath }/static/admin/assets/img/message.jpg" />
        </div>
        <div class="col-md-6 " style="margin-top:7%;">
            <dl>
                <dt>
				<span style="font-size:32px">
				<p class="text-info" ><b>提示信息</b></p>
				</span>
                </dt>
                <dd>
					<span style="font-size:20px">
					<p class="text-warning" ><b>Message:<%=request.getAttribute("message")%></b></p>
					</span>
                </dd>
            </dl>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"/>
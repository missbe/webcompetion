<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/15 0015
  Time: 下午 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>WebUploader演示</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/webupload/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/webupload/style.css" />
</head>
<body>
<div id="wrapper">
    <div id="container">
        <!--头部，相册选择和格式选择-->
        <form action="/upload/save" enctype="multipart/form-data">
            <div id="uploader">
                <div class="queueList">
                    <div id="dndArea" class="placeholder">
                        <div id="filePicker"></div>
                        <p>或将照片拖到这里，单次最多可选300张</p>
                    </div>
                </div>
                <div class="statusBar" style="display:none;">
                    <div class="progress">
                        <span class="text">0%</span>
                        <span class="percentage"></span>
                    </div><div class="info"></div>
                    <div class="btns">
                        <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                    </div>
                </div>
            </div>
        </form>

    </div>
</div>
<script type="text/javascript" src="<%=basePath%>static/webupload/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>static/webupload/webuploader.js"></script>
<script type="text/javascript" src="<%=basePath%>static/webupload/upload.js"></script>
</body>
</html>

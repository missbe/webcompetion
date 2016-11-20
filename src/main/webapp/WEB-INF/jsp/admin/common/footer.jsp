<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7 0007
  Time: 下午 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    </div>
   </div>
</div>
<script src="<%=basePath%>static/admin/assets/js/amazeui.min.js"></script>
<script src="<%=basePath%>static/admin/assets/js/amazeui.datatables.min.js"></script>
<script src="<%=basePath%>static/admin/assets/js/dataTables.responsive.min.js"></script>
<script src="<%=basePath%>static/admin/assets/js/app.js"></script>
</body>

</html>
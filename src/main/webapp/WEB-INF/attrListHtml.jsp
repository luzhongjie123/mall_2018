<%--
  Created by IntelliJ IDEA.
  User: 卢中杰
  Date: 2018/12/6
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script TYPE="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<body>



<table class="table table-hover">
    <tr>
        <th>id</th>
        <td>属性名</td>
        <td>创建时间</td>
        <td>属性值</td>
    </tr>
<c:forEach items="${list_attr}" var="attr">
    <tr>
        <td>${attr.id}</td>
        <td>${attr.shxm_mch}</td>
        <td><fmt:formatDate value="${attr.chjshj}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
        <td>
    <c:forEach items="${attr.list_value}" var="val">
      ${val.shxzh}${val.shxzh_mch}
    </c:forEach>
        </td>
    </tr>
</c:forEach>
</table>


</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/15
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:include page="ln.jsp"></jsp:include>
<body>
<div class="container" style="width: 1300px">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <button type="button" class="btn btn-default btn-info" onclick="addProductCategory()">添加</button>
            <button type="button" class="btn btn-default btn-warning">刷新</button>
            <table class="table">
                <thead>
                <tr class="success">
                    <td>名称</td>
                    <td>排序</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${category}" var="category">
                    <tr class="warning">
                        <td>${category.name}</td>
                        <td>${category.orders}</td>
                        <td>
                            <a href="/grr/showProduct.jsp">[查看]</a>
                            <a href="/grr/updateCategory.jsp">[编辑]</a>
                            <a href="">[删除]</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    function addProductCategory(){
        location.href="<%=request.getContextPath()%>/productCateguryController/addCategory.jhtml"
    }
</script>
</body>
</html>

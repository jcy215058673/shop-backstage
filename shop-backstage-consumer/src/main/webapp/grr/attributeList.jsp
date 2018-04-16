<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/15
  Time: 18:32
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
            <button type="button" class="btn btn-default btn-info" onclick="addProductAttribute()">添加</button>
            <button type="button" class="btn btn-default btn-danger disabled">删除</button>
            <button type="button" class="btn btn-default btn-warning">刷新</button>
            <div class="btn-group">
                <button class="btn btn-default">每页显示</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li class="divider">
                        <a href="#">10</a>
                    </li>
                    <li class="divider">
                        <a href="#">20</a>
                    </li>
                    <li class="divider">
                        <a href="#">50</a>
                    </li>
                    <li class="divider">
                        <a href="#">100</a>
                    </li>
                </ul>
            </div>
            <table class="table">
                <thead>
                <tr class="success">
                    <td><input type="checkbox"/></td>
                    <td>名称</td>
                    <td>绑定分类</td>
                    <td>可选项</td>
                    <td>排序</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${attributes}" var="attributes">
                    <tr class="warning">
                        <td><input type="checkbox"/></td>
                        <td>${attributes.name}</td>
                        <td>${attributes.productCategory}</td>
                        <td>${attributes.propertyIndex}</td>
                        <td>${attributes.orders}</td>
                        <td>
                            <a href="/grr/updateAttribute.jsp">[编辑]</a>
                            <a href="/grr/showProduct.jsp">[查看]</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    //新增商品属性
    function addProductAttribute(){
        location.href="<%=request.getContextPath()%>/productAttributeController/addAttribute.jhtml"
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 意中人
  Date: 2018/04/08
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<form id="add-form" method="post">
    <input type="hidden" name="id" value="${deliverytemplate.id}">

    <table width="600px">
        <tr>
            <td>名称：</td>
            <td><input type="text" name="name" value="${deliverytemplate.name}"></td>
        </tr>

        <tr>
            <td>内容：</td>
            <td><input type="text" name="content" value="${deliverytemplate.content}"></td>
        </tr>
        <tr>
            <td>背景图：</td>
            <td><input type="text" name="background" value="${deliverytemplate.background}"><input type="file" name="background"></td>
        </tr>
        <tr>
            <td>宽度：</td>
            <td><input type="text" name="width" value="${deliverytemplate.width}"></td>
        </tr>
        <tr>
            <td>高度：</td>
            <td><input type="text" name="height" value="${deliverytemplate.height}"></td>
        </tr>
        <tr>
            <td>偏移量X：</td>
            <td><input type="text" name="offsetx" value="${deliverytemplate.offsetx}"></td>
        </tr>
        <tr>
            <td>偏移量Y：</td>
            <td><input type="text" name="offsety" value="${deliverytemplate.offsety}"></td>
        </tr>
        <tr>
            <td>是否默认：</td>
            <td><input type="checkbox" name="isDefault" value="1" ${deliverycenter.isDefault==1?'checked':''}></td>
        </tr>
        <tr>
            <td>备注：</td>
            <td><input type="text" name="memo" value="${deliverytemplate.memo}"></td>
        </tr>
    </table>
</form>

</body>
</html>

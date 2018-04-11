<%--
  Created by IntelliJ IDEA.
  User: wbn
  Date: 2018/4/10
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>


</head>
<body>
<!-- 定义添加表单 -->
<form id="add_shop_form" method="post">
    <table border="0">
        <tr>
            <td>名称<td>
            <td><input class="easyui-textbox" name="wname"><td>
        </tr>
        <tr>
            <td>网址<td>
            <td><input class="easyui-textbox" name="wurl"><td>
        </tr>
        <tr>
            <td>代码<td>
            <td><input class="easyui-textbox" name="wcode"><td>
        </tr>
        <tr>
            <td>排序<td>
            <td><input class="easyui-textbox" name="worders"><td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    function return_add_emp_data(){
        return $("#add_shop_form").serialize();
    }

</script>
</body>
</html>
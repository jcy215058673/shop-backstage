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
<!-- 定义编辑表单 -->
<form id="editForm">
    <input type="hidden" name="wid" value="${delico.wid}">
    名称<input name="wname" class="easyui-textbox"  value="${delico.wname}"/><p>
    网址<input name="wurl" class="easyui-textbox"  value="${delico.wurl}"/><p>
    代码<input name="wcode" class="easyui-textbox"  value="${delico.wcode}"/><p>
    排序<input name="worders" class="easyui-textbox"  value="${delico.worders}"/><p>
</form>
<script type="text/javascript">
    function return_edit_emp_data(){
        return $("#editForm").serialize();
    }
</script>
</body>
</html>

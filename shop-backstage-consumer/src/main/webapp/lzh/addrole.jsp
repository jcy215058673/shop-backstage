<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <jsp:include page="inc.jsp"></jsp:include>
</head>
<body>
<!-- 定义添加表单 -->
<form id="add_shop_form">

    <input type="hidden" name="id" id="id">
    <table border="0">
        <tr>
            <td>创建时间<td>
            <td><input type="text" id="createDate" name="createDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><td>

        </tr>
        <tr>
        <td>修改时间<td>
        <td><input type="text" id="modifyDate" name="modifyDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"><td>
        </tr>
        <tr>
            <td>描述<td>
            <td><input class="easyui-textbox" name="description" id="description"><td>
        </tr>
        <tr>
            <td>状态<td>
            <td><input class="easyui-textbox" name="isSystem" id="isSystem"><td>
        </tr>
        <tr>
            <td>姓名<td>
            <td><input class="easyui-textbox" name="name" id="name"><td>
        </tr>



    </table>
</form>
<script type="text/javascript">



   $(function() {
        var today=new Date()
        var month=today.getMonth()+1
        $("#createDate").val(1900 + today.getYear() + "-" + month+"-" + today.getDate() + " " + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds());
        $("#modifyDate").val(1900 + today.getYear() + "-" + today.getMonth() + "-" + today.getDate() + " " + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds());


   })

$(function(){

    if($("#shop_dg2").datagrid('getSelected')!=null){

        var tr = $("#shop_dg2").datagrid('getSelected');
        $("#id").val(tr.id)
        $("#description").val(tr.description);
        $("#isSystem").val(tr.isSystem);
        $("#name").val(tr.name);
    }

})


</script>
</body>
</html>
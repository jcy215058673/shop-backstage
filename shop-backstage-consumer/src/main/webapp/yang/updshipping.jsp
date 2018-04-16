<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/12
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="ssi" style="padding-top: 20px">
    <input type="hidden" name="id" id="zhujian2">

    <table>
        <tr>
            <td>配送方式</td>
            <td>
                <input id="shippingMethod" class="easyui-textbox" name="shippingMethod">
            </td>
        </tr>
        <tr>
            <td>物流公司</td>
            <td><input id="deliveryCorp" class="easyui-textbox" name="deliveryCorp"> </td>
        </tr>
        <tr>
            <td>运单号</td>
            <td><input id="trackingNo" class="easyui-textbox" name="trackingNo"> </td>
        </tr>
        <tr>
            <td>收货人</td>
            <td><input id="consignee" class="easyui-textbox" name="consignee"> </td>
        </tr>
        <tr>
            <td>创建日期</td>
            <td><input id="createDate"  name="createDate" class="Wdate" onClick="WdatePicker()"> </td>
        </tr>
    </table>
</form>
</center>
<script type="text/javascript">
    //getSelected none 返回第一个被选中的行或如果没有选中的行则返回null。
    if($("#shipping").datagrid('getSelected') != null){
        var tr = $("#shipping").datagrid('getSelected');
        $("#zhujian2").val(tr.id);
        $("#shippingMethod").val(tr.shippingMethod);
        $("#deliveryCorp").val(tr.deliveryCorp);
        $("#trackingNo").val(tr.trackingNo);
        $("#consignee").val(tr.consignee);
        $("#createDate").val(tr.createDate);
    }



</script>
</body>
</html>

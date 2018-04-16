<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/9
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--m97--%>
<%--    <script type="text/javascript" src="<%=request.getContextPath() %>/js/My97DatePicker/WdatePicker.js"></script>--%>
</head>
<body>
<center>
    <form id="xinzengbd" style="padding-top: 20px">
        <input type="hidden" name="id" id="zhujian">

        <table>
            <tr>
                <td>方式</td>
                <td>
                    <select name="method" id="method">
                        <option>--请选择--</option>
                        <option value="1">在线支付</option>
                        <option value="2">线下支付</option>
                        <option value="3">预存款支付</option>
                    </select>
                   </td>
            </tr>
            <tr>
                <td>支付方式</td>
                <td><input id="paymentmethod" class="easyui-textbox" name="paymentmethod"> </td>
            </tr>
            <tr>
                <td>退款金额</td>
                <td><input id="amount" class="easyui-textbox" name="amount"> </td>
            </tr>
            <tr>
                <td>收款人</td>
                <td><input id="payee" class="easyui-textbox" name="payee"> </td>
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
    if($("#refunds").datagrid('getSelected') != null){
        var tr = $("#refunds").datagrid('getSelected');
        $("#zhujian").val(tr.id);
        $("#method").val(tr.method);
        $("#paymentmethod").val(tr.paymentmethod);
        $("#amount").val(tr.amount);
        $("#payee").val(tr.payee);
        $("#createDate").val(tr.createDate);
    }

</script>
</body>
</html>

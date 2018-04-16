
  <%--Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/10
  Time: 20:19
  To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<center>
    <form id="ggg" style="padding-top: 20px">
      <input type="hidden" name="id" id="sn" class="easyui-textbox">
        <table>
            <%--<tr>
                <td>编号:</td>
                <td>
                    <input type="text" name="id" id="sn" class="easyui-textbox" >
                </td>
            </tr>--%>
            <tr>
                <td>会员:</td>
                <td>
                    <input id="member" class="easyui-textbox" name="member">
                </td>
            </tr>
            <tr>
                <td>收货人:</td>
                <td><input id="consignee" class="easyui-textbox" name="consignee"> </td>
            </tr>
           <tr>
                <td>支付方式名称:</td>
                <td><input id="paymentmethodname" class="easyui-textbox" name="paymentmethodname"> </td>
            </tr>
            <%--<tr>
                <td>配送方式名称:</td>
                <td><input id="shippingmethodname" class="easyui-textbox" name="shippingmethodname"> </td>
            </tr>--%>
            <tr>
                <td>订单状态:</td>
                <td>
                    <select name="orderStatus" id="orderStatus">
                        <option>--请选择--</option>
                        <option value="1">未确认</option>
                        <option value="2">已确认</option>
                        <option value="3">已完成</option>
                        <option value="4">已取消</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>支付状态:</td>
                <td>
                    <select name="paymentStatus" id="paymentStatus">
                        <option>--请选择--</option>
                        <option value="1">未支付</option>
                        <option value="2">部分支付</option>
                        <option value="3">已支付</option>
                        <option value="4">部分退款</option>
                        <option value="5">已退款</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>配送状态:</td>
                <td>
                    <select name="shippingStatus" id="shippingStatus">
                        <option>--请选择--</option>
                        <option value="1">未发货</option>
                        <option value="2">部分发货</option>
                        <option value="3">已发货</option>
                        <option value="4">部分退货</option>
                        <option value="5">已退货</option>
                    </select>
                </td>
            </tr>--%>

          <tr>
                <td>创建日期:</td>
                <td><input id="createdate" class="easyui-textbox" name="createdate"> </td>
            </tr>

        </table>
    </form>
</center>
<script type="text/javascript">
    /*$(function (){
    function huidata(){
        alert(111);
        return $("#ggg").serialize();
    }
    })*/
    //getSelected none 返回第一个被选中的行或如果没有选中的行则返回null。
   if($("#order").datagrid('getSelected') != null){
        var tr = $("#order").datagrid('getSelected');
        $("#sn").val(tr.id);
        $("#member").val(tr.member);
        $("#consignee").val(tr.consignee);
       $("#paymentmethodname").val(tr.paymentmethodname);
       // $("#shippingmethodname").val(tr.shippingmethodname);
        $("#orderStatus").val(tr.orderStatus);
        $("#paymentStatus").val(tr.paymentStatus);
        $("#shippingStatus").val(tr.shippingStatus);
        $("#createdate").val(tr.createdate);

    }

</script>
</body>
</html>

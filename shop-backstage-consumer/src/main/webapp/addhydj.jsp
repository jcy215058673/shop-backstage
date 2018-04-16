<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/11
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<center>
    <form id="addhydjform" style="padding-top: 20px">
        <input type="hidden" name="id" id="id">
        <table>
            <tr>
                <td>名称</td>
                <td>
                    <input id="name" class="easyui-textbox" type="text" name="name"/>
                </td>
            </tr>
            <tr>
                <td>优惠比例</td>
                <td>
                    <input id="scale" class="easyui-textbox" type="text" name="scale"/>
                </td>
            </tr>
            <tr>
                <td>消费金额</td>
                <td>
                    <input id="amount" class="easyui-textbox" type="text" name="amount"/>
                </td>
            </tr>
            <tr>
                <td>是否默认</td>
                <td>
                    <input type="radio" name="isDefault" value="1">是
                    <input type="radio" name="isDefault" value="2">否
                </td>
            </tr>
        </table>
    </form>
</center>
<script type="text/javascript">
    function addhydjtab(){
        return $("#addhydjform").serialize();
    }
</script>
</body>
</html>

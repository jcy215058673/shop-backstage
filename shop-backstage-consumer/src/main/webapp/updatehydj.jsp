<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12
  Time: 15:32
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
    <form id="updatehydjform" style="padding-top: 20px">
        <input type="hidden" name="id" id="id">
        <table>
            <tr>
                <td>名称</td>
                <td>
                    <input id="name" class="easyui-textbox" type="text" name="name" <%--value="${hydj.name}"--%>/>
                </td>
            </tr>
            <tr>
                <td>优惠比例</td>
                <td>
                    <input id="scale" class="easyui-textbox" type="text" name="scale" <%--value="${hydj.scale}"--%>/>
                </td>
            </tr>
            <tr>
                <td>消费金额</td>
                <td>
                    <input id="amount" class="easyui-textbox" type="text" name="amount" <%--value="${hydj.amount}"--%>/>
                </td>
            </tr>
            <tr>
                <td>是否默认</td>
                <td>
                    <input type="radio" name="isDefault" value="1" <%--${hydj.isDefault==1?'checked':''}--%>>是
                    <input type="radio" name="isDefault" value="2" <%--${hydj.isDefault==2?'checked':''}--%>>否
                </td>
            </tr>
        </table>
    </form>
</center>
<script>
    if($("#hydjData").datagrid('getSelected')!=null){
        var tr = $("#hydjData").datagrid('getSelected');
        $("#id").val(tr.id);
        $("#name").val(tr.name);
        $("#scale").val(tr.scale);
        $("#amount").val(tr.amount);
        $("input[name='isDefault']").each(function(){
            if($(this).val()==tr.isDefault){
                $(this).attr("checked",true)
            }
        })

    }

</script>
</body>
</html>

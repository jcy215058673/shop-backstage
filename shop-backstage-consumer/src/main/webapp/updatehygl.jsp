<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10
  Time: 16:54
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
    <form id="updatehyglform" style="padding-top: 20px">
        <input type="hidden" name="id" id="id">
        <table>
            <tr>
                <td>用户名</td>
                <td>
                    <input id="username" class="easyui-textbox" type="text" name="username" <%--value="${hygl.username}"--%>/>
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <input id="password" class="easyui-textbox" type="text" name="password" <%--value="${hygl.password}"--%>/>
                </td>
            </tr><%--
            <tr>
                <td>确认密码</td>
                <td>
                    <input id="passwor" class="easyui-textbox" type="text" name="passwor" value="${hygl.passwor}"/>
                </td>
            </tr>--%>
            <tr>
                <td>E-mail</td>
                <td>
                    <input id="email" class="easyui-textbox" type="text" name="email" <%--value="${hygl.email}"--%>/>
                </td>
            </tr>
            <tr>
                <td>会员等级</td>
                <td>
                    <select class="easyui-combobox" name="member_rank" id="member_rank" <%--value="${hygl.member_rank}"--%>>
                        <option value="1">普通会员</option>
                        <option value="2">白银会员</option>
                        <option value="3">黄金会员</option>
                        <option value="4">钻石会员</option>
                        <option value="4">王者会员</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>是否启用</td>
                <td>
                    <input type="radio" name="is_enabled" value="1" <%--${hygl.is_enabled==1?'checked':''}--%>>是
                    <input type="radio" name="is_enabled" value="2" <%--${hygl.is_enabled==2?'checked':''}--%>>否
                </td>
            </tr>
            <%--<tr>
                <td>消费金额</td>
                <td><input class="easyui-textbox" id="je" name="je" value="${hygl.je}"/></td>
            </tr>--%>
            <tr>
                <td>创建日期</td>
                <td><input id="create_date" name="create_date" type="text"   <%--value="${hygl.create_date}"--%>/></td>
            </tr>
            <tr>
                <td>注册IP</td>
                <td><input class="easyui-textbox" id="register_ip" name="register_ip" <%--value="${hygl.register_ip}"--%>/></td>
            </tr>
        </table>
    </form>
</center>
<script>
    $('#create_date').datebox({
        required:true
    });
    if($("#hyglData").datagrid('getSelected')!=null){
        var tr = $("#hyglData").datagrid('getSelected');
        $("#id").val(tr.id);
        $("#username").val(tr.username);
        $("#password").val(tr.password);
        $("#email").val(tr.email);
        $("#member_rank").val(tr.member_rank);

        $("input[name='is_enabled']").each(function(){
            if($(this).val()==tr.is_enabled){
                $(this).attr("checked",true)
            }
        })
        $("#register_ip").val(tr.register_ip);
        $("#create_date").datebox("setValue",tr.create_date);

    }
</script>
</body>
</html>

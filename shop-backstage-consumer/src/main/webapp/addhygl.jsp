<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10
  Time: 10:40
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
    <form id="addhyglform" style="padding-top: 20px">
        <input type="hidden" name="id" id="id">
        <table>
            <tr>
                <td>用户名</td>
                <td>
                    <input id="username" class="easyui-textbox" type="text" name="username"/>
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <input id="password" class="easyui-textbox" type="text" name="password"/>
                </td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td>
                    <input id="passwor" class="easyui-textbox" type="text" name="passwor"/>
                </td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td>
                    <input id="email" class="easyui-textbox" type="text" name="email"/>
                </td>
            </tr>
            <tr>
                <td>积分</td>
                <td>
                    <input id="point" class="easyui-textbox" type="text" name="point"/>
                </td>
            </tr>
            <tr>
                <td>余额</td>
                <td>
                    <input id="balance" class="easyui-textbox" type="text" name="balance"/>
                </td>
            </tr>
            <tr>
                <td>会员等级</td>
                <td>
                    <select class="easyui-combobox" name="member_rank" id="member_rank">
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
                    <input type="radio" name="is_enabled" value="1">是
                    <input type="radio" name="is_enabled" value="2">否
                </td>
            </tr>
        </table>
    </form>
</center>
<script type="text/javascript">
    function addhygltab(){
        return $("#addhyglform").serialize();
    }

    /*if($("#studentData").datagrid('getSelected')!=null){
        var tr = $("#studentData").datagrid('getSelected');
        $("#stuid").val(tr.stuid);
        $("#stuname").val(tr.stuname);
        $("input[name='stusex']").each(function(){
            if($(this).val()==tr.stusex){
                $(this).attr("checked",true)
            }
        })
        $("#stuclass").val(tr.stuclass);
        $("#stuphone").val(tr.stuphone);
        $("#stuimg").val(tr.stuimg);
    }*/
    </script>
</body>
</html>

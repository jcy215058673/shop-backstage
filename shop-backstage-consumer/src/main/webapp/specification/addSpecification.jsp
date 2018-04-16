<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>

<body onload="xiugaisGuige()">
<form id="speclification-form" method="post">
    <table width="100%" border="1" rules=rows style="border:1px solid #cad9ea;font-size:14px;">
        <tr>
            <td colspan="2" style="background-repeat:repeat-x;background-color:#f5fafe;">添加规格</td>
        </tr>
        <tr>
            <td colspan="2">名称：<input type="text" name="name"></td>
        </tr>
        <tr>
            <td colspan="2">
                类型：
                <select name="type" onchange="xiugaiGuige()">
                    <option value="1">文本</option>
                    <option value="2">图片</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">备注：<input type="text" name="memo"></td>
        </tr>
        <tr>
            <td colspan="2">排序：<input type="text" name="orders"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="button" value="增加规格值" onclick="addGuige()"></td>
        </tr>
    </table>

    <table width="100%" border="1" rules=rows style="border:1px solid #cad9ea;font-size:14px;">
        <thead style="background-repeat:repeat-x;background-color:#f5fafe;">
            <tr>
                <td>规格值名称</td>
                <td>规格值图片</td>
                <td>规格值排序</td>
                <td>删除</td>
            </tr>
        </thead>
        <tbody id="specificationTable"></tbody>
    </table>
    <input type="button" onclick="addSpecification()" value="确定">
    <input type="button" onclick="backyemian()" value="返回">
</form>
    <script type="text/javascript">
        //页面加载
        function xiugaisGuige(){
            var aa = "<tr id='specificationValueTr'><td><input class='easyui-textbox' type='text' name='svname'></td>"+
                    "<td valign='middle'><input type='text' name='svorders' class='sepcdisable' disabled><input type='button' value='上传图片' class='sepcdisable'></td>"+
                    "<td><input type='text' name='svorders' size='2'></td>"+
                    "<td><a href='javascript:void(0)' onclick='delteGuige()'><font color='#000000'>[删除]</font></a></td></tr>";
            $("#specificationTable").html(aa);
            var leixing = $("[name='type']").val();
            if (leixing == 1) {
                $(".sepcdisable").prop("disabled", true);
            } else {
                $(".sepcdisable").prop("disabled", false);
            }


        }
        // 修改规格类型
        function xiugaiGuige(){
            var leixing = $("[name='type']").val();
            if (leixing == 1) {
                $(".sepcdisable").prop("disabled", true);
            } else {
                $(".sepcdisable").prop("disabled", false);
            }

        }
        //添加规格值
        function addGuige(){
            var index = 1;
            var leixing = $("[name='type']").val();
            if(leixing == 1){
                var aa = "<tr id='specificationValueTr'><td><input class='easyui-textbox' type='text' name='svname'></td>"+
                        "<td valign='middle'><input type='text' name='' class='sepcdisable' disabled><input type='button' class='sepcdisable' value='上传图片' disabled></td>"+
                        "<td><input type='text' name='svorders' size='2'></td>"+
                        "<td><a href='javascript:void(0)' onclick='delteGuige()'><font color='#000000'>[删除]</font></a></td></tr>";
            }else{
                var aa = "<tr id='specificationValueTr'><td><input class='easyui-textbox' type='text' name='svname'></td>"+
                        "<td valign='middle'><input type='text' name='' class='sepcdisable'><input type='button' value='上传图片' class='sepcdisable'></td>"+
                        "<td><input type='text' name='svorders' size='2'></td>"+
                        "<td><a href='javascript:void(0)' onclick='delteGuige()'><font color='#000000'>[删除]</font></a></td></tr>";
            }

            $("#specificationTable").append(aa);
        }

        function delteGuige(){
            /* $("#sss").remove(); */
            var i = $("#specificationTable").find("tr").size();
            if (i <= 1) {
                 $.messager.alert('警告','必须至少保留一个规格值');
                /*alert("warn必须至少保留一个规格值");*/
            } else {
                $("#specificationValueTr").remove();
            }
        }
        //返回
        function backyemian(){
            location.href = "<%=request.getContextPath()%>/specification/specificationList.jsp";
        }
        //添加
        function addSpecification(){
            $.ajax({
                url:"<%=request.getContextPath()%>/specification/addSpecification.jhtml",
                type:"post",
                data:$("#speclification-form").serialize(),
                dataType:"text",
                success:function (data){
                    if(data > 0){
                        $.messager.show({
                            title:'提示消息',
                            msg:'添加成功',
                            timeout:2000,
                            showType:'slide',
                            style:{

                            }
                        });
                        location.href = "<%=request.getContextPath()%>/specification/specificationList.jsp";
                    }
                },
                error:function (){

                    alert("添加错误");
                }

            })
        }
    </script>

</body>
</html>

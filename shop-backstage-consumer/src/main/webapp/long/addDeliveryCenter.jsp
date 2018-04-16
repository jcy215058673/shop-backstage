<%--
  Created by IntelliJ IDEA.
  User: 意中人
  Date: 2018/04/09
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 引入JQuery -->
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <!-- 引入EasyUI -->
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/EasyUI/jquery.easyui.min.js"></script>
    <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/EasyUI/locale/easyui-lang-zh_CN.js"></script></head>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet"
      href="<%=request.getContextPath()%>/js/EasyUI/themes/default/easyui.css" type="text/css"/>
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"
      href="<%=request.getContextPath()%>/js/EasyUI/themes/icon.css" type="text/css"/>
<!-- My97 -->
<script type="text/javascript"
        src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<body>
<form id="add-form" method="post">
<table>
    <input type="hidden" name="id" value="${deliverycenter.id}">
    <tr>
        <td>名称：</td>
        <td><input type="text" name="name" value="${deliverycenter.name}"></td>
    </tr>
    <tr>
        <td>联系人：</td>
        <td><input type="text" name="contact" value="${deliverycenter.contact}"></td>
    </tr>
    <tr>
        <td>地区：</td>
        <td><input type="text" name="areaName" value="${deliverycenter.areaName}"></td>
    </tr>
    <tr>
        <td>地址：</td>
        <td><input type="text" name="address" value="${deliverycenter.address}"></td>
    </tr>
    <tr>
        <td>邮编：</td>
        <td><input type="text" name="zipCode" value="${deliverycenter.zipCode}"></td>
    </tr>
    <tr>
        <td>电话：</td>
        <td><input type="text" name="phone" value="${deliverycenter.phone}"></td>
    </tr>
    <tr>
        <td>手机：</td>
        <td><input type="text" name="mobile" value="${deliverycenter.mobile}"></td>
    </tr>
    <tr>
        <td>是否默认：</td>
        <td><input type="checkbox" name="isDefault" value="1" ${deliverycenter.isDefault==1?'checked':''}></td>
    </tr>
    <tr>
        <td>备注：</td>
        <td><input type="text" name="memo" value="${deliverycenter.memo}"></td>
    </tr>
</table>
</form>
<%--省:<select id="provice">
    <option value="">-请选择-</option>
</select>

市:<select id="city">
    <option value="">-请选择-</option>
</select>

县:<select id="county">
    <option value="">-请选择-</option>
</select>--%>
<script type="text/javascript">
    //-----------------------------------------请求三次的联动
    /*//页面刷新加载省级数据
    $.ajax({
        url:"<%=request.getContextPath()%>/areacontroller/queryArea.jhtml",
        type:"post",
        data:{"areaparent":1},
        dataType:"json",
        success:function (provice){
            //var option = "<option value=''>-请选择-</option>";
            var option = "";
            $(provice).each(function (){
                option += "<option value='"+this.areaid+"'>"+this.areaname+"</option>";
            });
            //清空之前数据,格式化当前数据
            //append 追加
            $("#provice").append(option);
        },
        error:function (){
            alert("有毒");
        }
    });

    //省级数据发生改变,相应的市级数据刷新
    $("#provice").on("change",function (){
        $("#county").html("<option value=''>-请选择-</option>");
        var proviceid = this.value;
        $.ajax({
            url:"<%=request.getContextPath()%>/areacontroller/queryArea.jhtml?areaparent="+proviceid,
            type:"post",
            //data:{"areaparent":proviceid},
            dataType:"json",
            success:function (city){
                //var option = "<option value=''>-请选择-</option>";
                var option = "<option value=''>-请选择-</option>";
                $(city).each(function (){
                    option += "<option value='"+this.areaid+"'>"+this.areaname+"</option>";
                });
                //清空之前数据,格式化当前数据
                //append 追加
                $("#city").html(option);
            },
            error:function (){
                alert("有毒");
            }
        });
    });

    //市级数据发生改变,相应的县级数据刷新
    $("#city").on("change",function (){
        var cityid = this.value;
        $.ajax({
            url:"<%=request.getContextPath()%>/areacontroller/queryArea.jhtml?areaparent="+cityid,
            type:"post",
            //data:{"areaparent":cityid},
            dataType:"json",
            success:function (county){
                //var option = "<option value=''>-请选择-</option>";
                var option = "<option value=''>-请选择-</option>";
                $(county).each(function (){
                    option += "<option value='"+this.areaid+"'>"+this.areaname+"</option>";
                });
                //清空之前数据,格式化当前数据
                //append 追加
                $("#county").html(option);
            },
            error:function (){
                alert("有毒");
            }
        });
    });*/
</script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/10
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../inc.jsp"></jsp:include>
</head>
<body>
<table id="shipping"></table>
<div id="shp">
    <!-- 刷新按钮 -->
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
    <!-- 新建按钮 -->
    <a href="javascript:addshipping()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
    <!-- 修改按钮 -->
    <!--<a href="javascript:toUpdship()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>-->
    <!-- 删除按钮 -->
    <a href="javascript:delship()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
</div>

<div id="xinship"></div>
<div id="xiuship"></div>

<script>

    $("#shipping").datagrid({
        url:"<%=request.getContextPath()%>/shippingController/findshipping.jhtml",
        fit:true,
        fitColumns:true,
        striped:true,
        toolbar:'#shp',
        pagination:true,
        pageSize:15,
        pageNumber:1,
        //singleSelect:true,
        ctrlSelect:true,
        pageList:[1,2,3,5,15],
        columns:[[
            {field:'hg',title:'xx',checkbox:true},
            {field:'id',title:'编号',align:'center'},
            {field:'shippingMethod',title:'配送方式',width:100,align:'center'},
            {field:'deliveryCorp',title:'物流公司',width:100,align:'center'},
            {field:'trackingNo',title:'运单号',width:100,align:'center'},
            {field:'consignee',title:'收货人',width:120,align:'center'},
            {field:'createDate',title:'创建日期',width:120,align:'center'},

        ]],

    })

    //.....................................................................................................
    //删除
    function delship(){
        //getSelected  返回第一个被选中的行或如果没有选中的行则返回null
        //getChecked  none 在复选框呗选中的时候返回所有行。（该方法自1.3版开始可用）
        //getSelections 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组
        var ff = $("#shipping").datagrid('getSelections');
        if(ff.length<1){
            $.messager.alert('重要提示！！！','至少选择一个进行删除','warning');
            //				return false 时 函数不再继续执行
            return false;
        }
        var ids = "";
        for (var i = 0; i < ff.length; i++) {
            ids+= ","+ff[i].id;
        }
        ids= ids.substr(1);
        //alert(ids);

        $.ajax({
            url:"<%=request.getContextPath()%>/shippingController/deleteship.jhtml",
            type:"post",
            data:{"ids":ids},
            dataType:"json",
            async:false,
            success:function(data){
               // alert(111);
                $.messager.show({
                    title:'提示消息',
                    msg:'已成功删除'+ff.length+'条数据',
                    timeout:2000,
                    showType:'slide',
                });
                $('#shipping').datagrid("reload");

            }
        })

    }
//....................................................................................
    //新增
    function addshipping(){
        $("#xinship").dialog({
            title:'新增',
            width: 400,
            height: 300,
            closed: false, //定义是否可以关闭窗口。
            href: '<%=request.getContextPath()%>/shippingController/Toshipping.jhtml',
            //modal: true   //定义是否将窗体显示为模式化窗口
            buttons:[{
                text:'提交',
                handler:function(){
                    $.ajax({
                        url:'<%=request.getContextPath()%>/shippingController/addshp.jhtml',
                        type:'post',
                        data:$("#ssip").serialize(),
                        dataType:'json',
                        success:function(data){
                            alert(data)
                            if(data.success){
                                $.messager.show({
                                    title:'提示消息',
                                    msg:'新增成功',
                                    timeout:2000,
                                    showType:'slide',
                                });
                                $("#xinship").dialog('close');
                                $("#shipping").datagrid('reload');

                            }
                        }
                    })
                }
            },{
                text:'重置',
                handler:function(){}
            }]
        })
    }
    //。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。

    //修改
    function toUpdship(){
        $("#xiuship").dialog({
            title:'修改',
            width: 400,
            height: 300,
            closed: false, //定义是否可以关闭窗口。
            href: '<%=request.getContextPath()%>/shippingController/Toupdshipping.jhtml',
            //modal: true   //定义是否将窗体显示为模式化窗口
            buttons:[{
                text:'提交',
                handler:function(){
                    if(confirm("是否确认修改")){
                        $.ajax({
                            url:'<%=request.getContextPath()%>/shippingController/updship.jhtml',
                            type:'post',
                            data:$("#ssi").serialize(),
                            dataType:'json',
                            success:function(data){
                                $.messager.show({
                                    title:'提示消息',
                                    msg:'修改成功',
                                    timeout:2000,
                                    showType:'slide',
                                });
                                $("#xiuship").dialog('close');
                                $("#shipping").datagrid('reload');
                            },
                            error:function(){
                                alert("系統錯誤,請用DEBUG調試");
                            }
                        })
                    }
                }
            },{
                text:'重置',
                handler:function(){}
            }]
        })
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/11
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<table id="hydjData"></table>
<div id="hydjbtn">
    <a href="javascript:addhydj()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
    <a href="javascript:delByIdhydj()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<div id="addhydjdiv"></div>
<div id="updatehydjdiv"></div>
<script>
    $("#hydjData").datagrid({
        url:'<%=request.getContextPath()%>/shopController/gethydj.jhtml',
        columns:[[
            {field:'id',title:'编号',hidden:true},
            {field:'name',title:'名称',width:100,align:'center'},
            {field:'scale',title:'优惠比例',width:100,align:'center'},
            {field:'amount',title:'消费金额',width:100,align:'center'},
            {field:'isDefault',title:'是否默认',width:100,align:'center',formatter:function(value,rows,index){
                if(value==1){
                    return '是';
                }
                if(value==2){
                    return '否';
                }
            }},
            {field:'act',title:'操作',width:100,
                formatter: function(value,row,index){
                    console.info(row.id);
                    return "<a href='javascript:void(0)' onclick='toEdithydj("+row.id+")'>[编辑]</a>";
                }
            },

        ]],
        fit:true,
        fitColumns:true,
        striped:true,
        pagination:true,
        ctrlSelect:true,
        toolbar:'#hydjbtn',
        pageNumber:1,
        pageSize:10,
        pageList:[10,20,30,50]

    })
    //新增
    //打开添加对话框
    function addhydj(){
        $("#addhydjdiv").dialog({
            title:"添加会员等级",
            href:"<%=request.getContextPath()%>/shopController/toHydjAddTab.jhtml",
            modal:true,
            width:800,
            height:360,
            buttons:[{
                text:'保存',
                iconCls:"icon-add",
                handler:function(){
                    //ajax向后台发送添加请求,回调函数中销毁对话框,刷新数据表格
                    $.ajax({
                        url:"<%=request.getContextPath()%>/shopController/insertHydj.jhtml",
                        data:addhydjtab(),//新增页面的函数方法
                        dataType:"json",
                        type:"post",
                        success:function(data){
                            $.messager.show({
                                title: '提示',
                                msg: '保存成功',
                                timeout: 2000,
                                showType: 'slide'
                            });
                            $("#addhydjdiv").dialog("close");
                            $("#hydjData").datagrid('reload');
                        }
                    })
                }
            },{
                text:'取消',
                iconCls:"icon-cancel",
                handler:function(){
                    //销毁对话框
                    $("#addhydjdiv").dialog("close");
                }
            }]
        });
    }
    //批量删除选中的系列
    function delByIdhydj(){
        var checked_emp_arr = $('#hydjData').datagrid("getSelections");
        if(0<checked_emp_arr.length){
            $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
                if (r){
                    var emp_ids="";
                    for(var i=0;i<checked_emp_arr.length;i++){
                        emp_ids +=","+checked_emp_arr[i].id;
                    }
                    emp_ids=emp_ids.substring(1);
                    $.ajax({
                        url:"<%=request.getContextPath()%>/shopController/deleteHydj.jhtml",
                        type:"get",
                        dataType:"json",
                        data:{ids:emp_ids},
                        success:function(data){
                            $.messager.alert('提示','删除成功');
                            $.messager.show({
                                title:'提示',
                                msg:'你成功删除'+checked_emp_arr.length+'条数据',
                                timeout:2000,
                                showType:'slide'
                            });
                            //刷新数据表格
                            $('#hydjData').datagrid("load");
                        }
                    })
                }
            });
        }else{
            $.messager.alert('提示','请至少选择一条数据');
        }
    }
    //修改
    function toEdithydj(id){
        $('#updatehydjdiv').dialog({
            title: '修改',
            width: 800,
            height: 600,
            closed: false,
            href: '<%=request.getContextPath()%>/shopController/updateHydjById.jhtml?id='+id,
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $('#updatehydjform').form('submit', {
                        url:"<%=request.getContextPath()%>/shopController/updateHydj.jhtml",
                        success:function(){
                            $.messager.show({
                                title:'提示消息',
                                msg:'修改成功',
                                timeout:2000,
                                showType:'slide',
                                style:{
                                }
                            });
                            $('#updatehydjdiv').dialog("close");
                            $('#hydjData').datagrid('reload')
                        }
                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $('#updatehydjdiv').dialog("close");
                }
            }]
        });
    }
</script>
</body>
</html>

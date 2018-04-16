<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
	<jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<table id="hyzcData"></table>
<div id="hyzcbtn">
    <a href="javascript:addhyzc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
    <a href="javascript:delByIdhyzc()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<div id="addhyzcdiv"></div>
<div id="updatehyzcdiv"></div>
<script>
    $("#hyzcData").datagrid({
        url:'<%=request.getContextPath()%>/hyzcController/gethyzc.jhtml',
        columns:[[
            {field:'id',title:'编号',hidden:true},
            {field:'name',title:'名称',width:100,align:'center'},
            {field:'type',title:'类型',width:100,align:'center',formatter:function(value,rows,index){
                switch(value){
                    case 1:return '文本';break;
                    case 2:return '单选项';break;
                    case 3:return '多选项';break;
                }
            }},
            {field:'isRequired',title:'是否必填',width:100,align:'center',formatter:function(value,rows,index){
                if(value==1){
                    return '是';
                }
                if(value==2){
                    return '否';
                }
            }},
            {field:'isEnabled',title:'是否启用',width:100,align:'center',formatter:function(value,rows,index){
                if(value==1){
                    return '<b><font color="#32cd32" size="5">√</font></b>';
                }
                if(value==2){
                    return '<b><font color="red" size="5">×</font></b>';
                }
            }},
            {field:'orders',title:'排序',width:100,align:'center'},
            {field:'act',title:'操作',width:100,
                formatter: function(value,row,index){
                    console.info(row.id);
                    return "<a href='javascript:void(0)' onclick='toEdithyzc("+row.id+")'>[编辑]</a>";
                }
            },

        ]],
        fit:true,
        fitColumns:true,
        striped:true,
        pagination:true,
        ctrlSelect:true,
        toolbar:'#hyzcbtn',
        pageNumber:1,
        pageSize:10,
        pageList:[10,20,30,50]

    })

</script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/11
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../inc.jsp"></jsp:include>
</head>
<body>
<table id="shoukuan"></table>
<div id="hh">
   <%-- 收货人:<input type="text" id="consignee2" name="consignee" >--%>
    <a id="ss" href="javascript:delm()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">删除</a>
</div>
<div id="chakan"></div>
<input type="hidden" id="cc"/>
<script>

    //..................................................................................
    $("#shoukuan").datagrid({
        url:"<%=request.getContextPath()%>/depositController/findshoukuan.jhtml",
        fit:true,
        fitColumns:true,
        striped:true,
        toolbar:'#hh',
        pagination:true,
        pageSize:3,
        pageNumber:1,
        //singleSelect:true,
        ctrlSelect:true,
        pageList:[1,3,4,5],
        columns:[[
            {field:'a',title:'xx',checkbox:true},
            {field:'id',title:'编号',width:40,height:30},
            {field:'type',title:'类型',width:50,align:'center'},
            {field:'debit',title:'付款金额',width:100},
            {field:'member',title:'会员',width:100},
            {field:'orders',title:'订单',width:100},
            {field:'modifyDate',title:'付款日期',width:100},
            {field:'createDate',title:'创建日期',width:100},
            {field:'wef',title:'操作',width:100,align:'center',formatter:function(value,row,index){
                return "[<a  href='javascript:getShoukuan("+row.id+")'>查看</a>]";
            }},
        ]],

    })
    //.....................................................................................................
    //查看
    function getShoukuan(sn){
        $("#cc").val(sn);
        $("#chakan").dialog({
            title:'查看',
            width: 880,
            height: 300,
            closed: false, //定义是否可以关闭窗口。
            href: '<%=request.getContextPath()%>/depositController/TochaShoukuan.jhtml',
        })
    }
</script>
</body>
</html>

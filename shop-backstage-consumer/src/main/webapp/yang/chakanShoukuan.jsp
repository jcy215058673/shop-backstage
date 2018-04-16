<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/11
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table id="shouKuancha"></table>
<script>

    $(function (){
        bianhao = $("#cc").val();
        // alert(bianhao)
        loadshoukuan();
    })

    function loadshoukuan(){
        var ff =$("#cc").val();
    $("#shouKuancha").datagrid({
        url:"<%=request.getContextPath()%>/depositController/chaShoukuan.jhtml?ff="+ff,
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

        ]],

    })
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/9
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table id="refundscha"></table>
<script>

    $(function (){
        bianhao = $("#aa").val();
      // alert(bianhao)
        loadselect();
    })


    function loadselect(){
        var theid =$("#aa").val();
       // alert(theid)
    $("#refundscha").datagrid({
        url:"<%=request.getContextPath()%>/refundsController/findrefundsjb.jhtml?theid="+theid,
        fit:true,
        fitColumns:true,
        striped:true,
        toolbar:'#re',
        pagination:true,
        pageSize:15,
        pageNumber:1,
        //singleSelect:true,
        ctrlSelect:true,
        pageList:[15,20,25,30],
        columns:[[
            {field:'id',title:'编号',align:'center'},
            {field:'createDate',title:'创建日期',width:100,align:'center'},
            {field:'method',title:'方式',width:100,align:'center',formatter:function(value,row,index){
                if(value==1){
                    return "在线支付";
                }
                if(value==2){
                    return "线下支付";
                }
                if(value==3){
                    return "预存款支付";
                }
            }},

            {field:'account',title:'退款账号',width:100,align:'center'},
          {field:'amount',title:'退款金额',width:100,align:'center'},
           {field:'payee',title:'收款人',width:120,align:'center'},
            {field:'operator',title:'操作员',width:120,align:'center'},
            {field:'memo',title:'备注',width:120,align:'center'},
            {field:'paymentmethod',title:'支付方式',width:120,align:'center'},
            {field:'bank',title:'退款银行',width:120,align:'center'},
           {field:'orders',title:'订单',width:120,align:'center'},

        ]],

    })
    }
</script>
</body>
</html>

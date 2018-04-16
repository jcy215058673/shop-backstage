<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/10
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table id="ordercha"></table>
<script>

    $(function (){
        var bb =  $("#rt").val();
       // alert(bb);
        loadorder();
    })


    function loadorder(){
        var ff =$("#rt").val();
       // alert(ff)
        $("#ordercha").datagrid({
            url:"<%=request.getContextPath()%>/orderController/findorder.jhtml?ff="+ff,
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
                {field:'a',title:'xx',checkbox:true},
                {field:'id',title:'编号',width:40,height:30},
                {field:'member',title:'会员',width:100,align:'center'},
                {field:'consignee',title:'收货人',width:100,align:'center'},
               /* {field:'paymentMethodName',title:'支付方式名称',width:100},*/
                {field:'shippingmethodname',title:'配送方式名称',width:100},
                {field:'orderStatus',title:'订单状态',width:100,formatter:function(value,row,index){
                    if(value== 1){
                        return " 未确认";
                    }
                    if(value== 2){
                        return " 已确认";
                    }
                    if(value== 3){
                        return " 已完成";
                    }
                    if(value==4){
                        return " 已取消";
                    }
                }},
                {field:'paymentStatus',title:'支付状态',width:100,formatter:function(value,row,index){
                    if(value==1){
                        return " 未支付";
                    }
                    if(value==2){
                        return " 部分支付";
                    }
                    if(value==3){
                        return " 已支付";
                    }
                    if(value==4){
                        return " 部分退款";
                    }
                    if(value==5){
                        return " 已退款";
                    }


                }},
                {field:'shippingStatus',title:'配送状态',width:100,formatter:function(value,row,index){
                    if(value==1){
                        return " 未发货";
                    }
                    if(value==2){
                        return " 部分发货";
                    }
                    if(value==3){
                        return " 已发货";
                    }
                    if(value==4){
                        return " 部分退货";
                    }
                    if(value==5){
                        return " 已退货";
                    }
                }},
                {field:'createdate',title:'创建日期',width:200,align:'center'},

            ]],

        })
    }
</script>
</body>
</html>

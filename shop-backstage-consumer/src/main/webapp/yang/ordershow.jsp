<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/8
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../inc.jsp"></jsp:include>
</head>
<body>

<table id="order"></table>

<div id="aa">
   收货人:<input type="text" id="consignee2" name="consignee" >
   <a id="wherebtn" href="javascript:queryWhere()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>

    <a id="ss" href="javascript:delm()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">删除</a>
</div>
<div id="chaorder"></div>
<div id="gai"></div>
<input type="hidden" id="rt"/>
 <script>

     function queryWhere(){
         $("#order").datagrid('load',{
             consignee:$("#consignee2").val(),
            // span:

         });
     }

    //..................................................................................
     $("#order").datagrid({
         url:"<%=request.getContextPath()%>/orderController/findordergl.jhtml",
         fit:true,
        fitColumns:true,
         striped:true,
         toolbar:'#aa',
         pagination:true,
         pageSize:15,
         pageNumber:1,
         //singleSelect:true,
         ctrlSelect:true,
         pageList:[1,3,4,5,15],
         columns:[[
             {field:'a',title:'xx',checkbox:true},
             {field:'id',title:'编号',width:40,height:30},
             {field:'member',title:'会员',width:50,align:'center'},
             {field:'consignee',title:'收货人',width:100,align:'center'},
             {field:'paymentmethodname',title:'支付方式名称',width:100},
             //{field:'paymentmethodname',title:'配送方式名称',width:100},
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
             {field:'kk',title:'打印',width:120,formatter:function(value,rows,index){
                    return " <select name='shipping_Status' id='shipping_Status'>"+
                 "<option>--请选择--</option>"+
                 "<option value='1'>订单</option>"+
                         "<option value='2'>购物单</option>"+
                         "<option value='3'>配送单</option>"+
                         "<option value='4'>快递单</option>"+
                         "</select>"
             }},
             {field:'as',title:'操作',width:120,formatter:function(value,rows,index){
                 return "[<a  href='javascript:getOrder("+rows.id+")'>查看</a>]&nbsp;"+
                         "[<a  href='javascript:updOrder("+rows.id+")'>编辑</a>]"
             }},


         ]],

     })
//..................................................................................
     //查看
     function getOrder(id){
     $("#rt").val(id);

         $("#chaorder").dialog({
             title:'查看',
             width: 880,
             height: 300,
             closed: false, //定义是否可以关闭窗口。
             href: '<%=request.getContextPath()%>/orderController/TochakanOrder.jhtml',
         })
     }

     //。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。

     //删除
     function delm(){
         //getSelected  返回第一个被选中的行或如果没有选中的行则返回null
         //getChecked  none 在复选框呗选中的时候返回所有行。（该方法自1.3版开始可用）
         //getSelections 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组
         var ff = $("#order").datagrid('getSelections');
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
             url:"<%=request.getContextPath()%>/orderController/deletorder.jhtml?ids="+ids,
             type:"post",
            // data:{"ids":ids},
             dataType:"json",
             async:false,
             success:function(data){
                 $.messager.show({
                     title:'提示消息',
                     msg:'已成功删除'+ff.length+'条数据',
                     timeout:2000,
                     showType:'slide',
                 });
                 $('#order').datagrid("reload");

             }
         })

     }


     //修改
    function updOrder(sn){
         $("#gai").dialog({
             title:'修改',
             width: 400,
             height: 350,
             closed: false, //定义是否可以关闭窗口。
             href: '<%=request.getContextPath()%>/orderController/Toupdorder.jhtml?sn='+sn,
             //modal: true   //定义是否将窗体显示为模式化窗口
             buttons:[{
                 text:'提交',
                 handler:function(){
                     if(confirm("是否确认修改")){
                         $.ajax({
                             url:'<%=request.getContextPath()%>/orderController/updateorder.jhtml',
                             type:'post',
                             data:$("#ggg").serialize(),
                             dataType:'json',
                             success:function(data){
                                 $.messager.show({
                                     title:'提示消息',
                                     msg:'修改成功',
                                     timeout:2000,
                                     showType:'slide',
                                 });
                                 $("#gai").dialog('close');
                                 $("#order").datagrid('reload');
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

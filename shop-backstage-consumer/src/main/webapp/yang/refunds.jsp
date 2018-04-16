<%--
  Created by IntelliJ IDEA.
  User: 杨棋洋
  Date: 2018/4/9
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../inc.jsp"></jsp:include>
</head>
<body>

<table id="refunds"></table>
<div id="re">
    <!-- 刷新按钮 -->
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
    <!-- 新建按钮 -->
    <a href="javascript:addrefun()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新建</a>
    <!-- 修改按钮 -->
    <a href="javascript:toUpdrole()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    <!-- 删除按钮 -->
    <a href="javascript:delre()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<div id="xins"></div>
<div id="xiu"></div>
<div id="chakan"></div>
<input type="hidden" id="aa"/>
<script>
    $("#refunds").datagrid({
        url:"<%=request.getContextPath()%>/refundsController/refundsTiao.jhtml",
        fit:true,
        fitColumns:true,
        striped:true,
        toolbar:'#re',
        pagination:true,
        pageSize:15,
        pageNumber:1,
        //singleSelect:true,
        ctrlSelect:true,
        pageList:[1,2,3,5,15],
        columns:[[
            {field:'hg',title:'xx',checkbox:true},
            {field:'id',title:'编号',align:'center'},
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
            {field:'paymentmethod',title:'支付方式',width:100,align:'center'},
            {field:'amount',title:'退款金额',width:100,align:'center'},
            {field:'payee',title:'收款人',width:100,align:'center'},
            {field:'createDate',title:'创建日期',width:120,align:'center'},
            {field:'ghj',title:'操作',width:100,align:'center',formatter:function(value,row,index){
                return "[<a  href='javascript:getRefunds("+row.id+")'>查看</a>]";
            }},
        ]],

    })

 //.....................................................................................................
//查看
  function getRefunds(sn){
      $("#aa").val(sn);
      $("#chakan").dialog({
          title:'查看',
          width: 880,
          height: 300,
          closed: false, //定义是否可以关闭窗口。
          href: '<%=request.getContextPath()%>/refundsController/TochakanRefunds.jhtml',
      })
  }

    //......................................................................................
    //删除
    function delre(){
        //getSelected  返回第一个被选中的行或如果没有选中的行则返回null
        //getChecked  none 在复选框呗选中的时候返回所有行。（该方法自1.3版开始可用）
        //getSelections 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组
        var ff = $("#refunds").datagrid('getSelections');
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
            url:"<%=request.getContextPath()%>/refundsController/deletrefunds.jhtml",
            type:"post",
            data:{"ids":ids},
            dataType:"json",
            async:false,
            success:function(data){
              //  alert(111);
                $.messager.show({
                    title:'提示消息',
                    msg:'已成功删除'+ff.length+'条数据',
                    timeout:2000,
                    showType:'slide',
                });
                $('#refunds').datagrid("reload");

            }
        })

    }

    //新增
    function addrefun(){
        $("#xins").dialog({
            title:'新增',
            width: 400,
            height: 300,
            closed: false, //定义是否可以关闭窗口。
            href: '<%=request.getContextPath()%>/refundsController/Toaddrefunds.jhtml',
            //modal: true   //定义是否将窗体显示为模式化窗口
            buttons:[{
                text:'提交',
                handler:function(){
                    $.ajax({
                        url:'<%=request.getContextPath()%>/refundsController/addrefunds.jhtml',
                        type:'post',
                        data:$("#xinzengbd").serialize(),
                        dataType:'json',
                        success:function(data){
                       // alert(data)
                            if(data.success){
                                $.messager.show({
                                    title:'提示消息',
                                    msg:'新增成功',
                                    timeout:2000,
                                    showType:'slide',
                                });
                                $("#xins").dialog('close');
                                $("#refunds").datagrid('reload');

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
    function toUpdrole(){
        $("#xiu").dialog({
            title:'修改',
            width: 400,
            height: 300,
            closed: false, //定义是否可以关闭窗口。
            href: '<%=request.getContextPath()%>/refundsController/Toaddrefunds.jhtml',
            //modal: true   //定义是否将窗体显示为模式化窗口
            buttons:[{
                text:'提交',
                handler:function(){
                    if(confirm("是否确认修改")){
                        $.ajax({
                            url:'<%=request.getContextPath()%>/refundsController/updrefunds.jhtml',
                            type:'post',
                            data:$("#xinzengbd").serialize(),
                            dataType:'json',
                            success:function(data){
                                $.messager.show({
                                    title:'提示消息',
                                    msg:'修改成功',
                                    timeout:2000,
                                    showType:'slide',
                                });
                                $("#xiu").dialog('close');
                                $("#refunds").datagrid('reload');
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

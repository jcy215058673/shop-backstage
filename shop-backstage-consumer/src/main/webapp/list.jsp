<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/8
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<table id="hyglData"></table>
<div id="hyglbtn">
    <a href="javascript:addhygl()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
    <a href="javascript:delByIdhygl()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<span id ="empbtnSpan" style="display:none">
				<div id="emp_edit_btn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</div>
		</span>
<div id="addhygldiv"></div>
<div id="updatehygldiv"></div>
<script>
    $("#hyglData").datagrid({
        url:'<%=request.getContextPath()%>/shopController/gethygl.jhtml',
        columns:[[
            {field:'id',title:'编号',hidden:true},
            {field:'username',title:'用户名',width:100,align:'center'},
            {field:'member_rank',title:'会员等级',width:100,align:'center',formatter:function(value,rows,index){
                switch(value){
                    case 1:return '普通会员';break;
                    case 2:return '白银会员';break;
                    case 3:return '黄金会员';break;
                    case 4:return '钻石会员';break;
                    case 5:return '王者会员';break;
                }
            }},
            {field:'email',title:'E-mail',width:100,align:'center'},
            {field:'create_date',title:'创建日期',width:100,align:'center'},
            {field:'stuphone',title:'状态',width:100,align:'center'},
            {field:'stuimg',title:'操作',width:100,formatter:function(value,row,index){
                return "<input type='button' value='[查看]'/>";
            }},
            {field:'sdfsdf',title:'操作',width:100,
                formatter:function(value,row,index){
                    $("#emp_edit_btn").attr("onClick","toEdithygl("+row.id+")");
                    return $("#empbtnSpan").html();
                }},

        ]],
        fit:true,
        fitColumns:true,
        striped:true,
        pagination:true,
        ctrlSelect:true,
        toolbar:'#hyglbtn',
        pageNumber:1,
        pageSize:10,
        pageList:[10,20,30,50]

    })
    //新增
    //打开添加对话框
    function addhygl(){
        $("#addhygldiv").dialog({
            title:"添加会员",
            href:"<%=request.getContextPath()%>/shopController/toHyglAddTab.jhtml",
            modal:true,
            width:800,
            height:360,
            buttons:[{
                text:'保存',
                iconCls:"icon-add",
                handler:function(){
                    //ajax向后台发送添加请求,回调函数中销毁对话框,刷新数据表格
                    $.ajax({
                        url:"<%=request.getContextPath()%>/shopController/insertHygl.jhtml",
                        data:addhygltab(),//新增页面的函数方法
                        dataType:"json",
                        type:"post",
                        success:function(data){
                                $.messager.show({
                                    title: '提示',
                                    msg: '保存成功',
                                    timeout: 2000,
                                    showType: 'slide'
                                });
                            $("#addhygldiv").dialog("close");
                            $("#hyglData").datagrid('reload');
                        }
                    })
                }
            },{
                text:'取消',
                iconCls:"icon-cancel",
                handler:function(){
                    //销毁对话框
                    $("#addhygldiv").dialog("close");
                }
            }]
        });
    }
    //修改
    function toEdithygl(id){
        $('#addhygldiv').dialog({
            title: '修改',
            width: 800,
            height: 600,
            closed: false,
            href: '<%=request.getContextPath()%>/shopController/updateHyglById.jhtml?id='+id,
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $('#updatehyglform').form('submit', {
                        url:"<%=request.getContextPath()%>/shopController/updateHygl.jhtml",
                        success:function(){
                            $.messager.show({
                                title:'提示消息',
                                msg:'修改成功',
                                timeout:2000,
                                showType:'slide',
                                style:{
                                }
                            });
                            $('#addhygldiv').dialog("close");
                            $('#hyglData').datagrid('reload')
                        }
                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $('#addhygldiv').dialog("close");
                }
            }]
        });
    }

    //批量删除选中的系列
    function delByIdhygl(){
        var checked_emp_arr = $('#hyglData').datagrid("getSelections");
        if(0<checked_emp_arr.length){
            $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
                if (r){
                    var emp_ids="";
                    for(var i=0;i<checked_emp_arr.length;i++){
                        emp_ids +=","+checked_emp_arr[i].id;
                    }
                    emp_ids=emp_ids.substring(1);
                    $.ajax({
                        url:"<%=request.getContextPath()%>/shopController/deleteHygl.jhtml",
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
                            $('#hyglData').datagrid("load");
                        }
                    })
                }
            });
        }else{
            $.messager.alert('提示','请至少选择一条数据');
        }
    }
</script>
</body>
</html>

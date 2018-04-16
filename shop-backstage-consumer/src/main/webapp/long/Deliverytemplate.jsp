<%--
  Created by IntelliJ IDEA.
  User: 意中人
  Date: 2018/04/08
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../inc.jsp"></jsp:include>
</head>
<body>
<a href="javascript:addButton()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:plButton()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
<a href="javascript:sxButton()" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
<div id="add-div"></div>
<table id="deliverytemplateshow"></table>

<script type="text/javascript">
    function sxButton(){
        search();
    }
    $(function(){
        search();

    })
    //查询
    function search(){
        $('#deliverytemplateshow').datagrid({
            url:'<%=request.getContextPath()%>/deliverytemplatecontroller/queryDeliverytemplate.jhtml',
            //queryParams:{taskname:$("#taskname").val()},
            //queryParams:{taskstatus:$("[name='taskstatus']").val()},
            pagination:true,//开启分页
            pageNumber:1,//初始化页码
            pageSize:3,//每页条数
            pageList:[3,5,8,10],
            columns:[[
                {field:'che',checkbox:true},
                {field:'name',title:'名称',width:100},
                {field:'memo',title:'备注',width:100},
                {field:'isDefault',title:'默认',width:100,
                    formatter: function(value,row,index){
                        if(value==1 ){
                            return '√';
                        }else{
                            return '';
                        }
                    }
                },
                {field:'act',title:'操作',width:100,
                    formatter: function(value,row,index){
                        console.info(row.id);
                        return "<a href='javascript:void(0)' onclick='updateButton("+row.id+")'>[编辑]</a>";
                    }
                },
            ]],
        });
    }

    //新增
    function addButton(){
        $('#add-div').dialog({
            title: '添加',
            width: 650,
            height: 450,
            closed: false,
            href: '<%=request.getContextPath()%>/deliverytemplatecontroller/toAdd.jhtml',
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $('#add-form').form('submit', {
                        url:"<%=request.getContextPath()%>/deliverytemplatecontroller/addDeliverytemplate.jhtml",
                        onSubmit: function(){
                            return $('#add-form').form('validate');
                        },
                        success:function(){
                            $.messager.show({
                                title:'提示消息',
                                msg:'新增成功',
                                timeout:2000,
                                showType:'slide',
                                style:{
                                }
                            });
                            $('#add-div').dialog("close");
                            $('#deliverytemplateshow').datagrid('reload')
                        }
                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $('#add-div').dialog("close");
                }
            }]
        });
    }

    //批量删除
    function plButton(){
//					获取被选中的选项
        var colArr = $('#deliverytemplateshow').datagrid('getChecked');
        if(colArr.length<1){
            $.messager.alert('重要提示！！！','至少选择一个进行删除','warning');
//						return false 时 函数不再继续执行
            return false;
        }
        var idsStr = "";
        for(var i=0;i<colArr.length;i++){
            idsStr += ","+colArr[i].id;
        }
        idsStr = idsStr.substring(1);
        $.messager.confirm('确认','您确认想要删除'+colArr.length+'记录吗？',function(r){
            if (r){
                $.ajax({
                    url:"<%=request.getContextPath()%>/deliverytemplatecontroller/delDeliverytemplates.jhtml?ids="+idsStr,
                    success:function(msg){
                        $.messager.show({
                            title:'提示消息',
                            msg:'已成功删除'+colArr.length+'条数据',
                            timeout:2000,
                            showType:'slide',
                        });
                        search();
                    }
                })
            }
        })
    }

    //修改
    function updateButton(id){
        $('#add-div').dialog({
            title: '修改',
            width: 800,
            height: 600,
            closed: false,
            href: '<%=request.getContextPath()%>/deliverytemplatecontroller/updateDeliverytemplateById.jhtml?id='+id,
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $('#add-form').form('submit', {
                        url:"<%=request.getContextPath()%>/deliverytemplatecontroller/updateDeliverytemplate.jhtml",
                        success:function(){
                            $.messager.show({
                                title:'提示消息',
                                msg:'修改成功',
                                timeout:2000,
                                showType:'slide',
                                style:{
                                }
                            });
                            $('#add-div').dialog("close");
                            $('#deliverytemplateshow').datagrid('reload')
                        }
                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $('#add-div').dialog("close");
                }
            }]
        });
    }
</script>
</body>
</html>

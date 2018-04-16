<%--
  Created by IntelliJ IDEA.
  User: wbn
  Date: 2018/4/10
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    <jsp:include page="inc.jsp"></jsp:include>
</head>
<body>
<!-- 定义面板容器 -->
<div class="easyui-panel" data-options="fit:true">
		<span id ="empbtnSpan" style="display:none">
				<div id="emp_edit_btn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</div>
		</span>
    <!-- 定义表格容器 -->
    <table id="shop_dg2"></table>
    <div id="editrole"></div>
    <div id="edit"></div>
    <!-- 定义工具栏容器 -->
    <div id="emp_tool_div">
        <div onclick="open_emp_add_dialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</div>
        <div onclick="delete_all_checked_emp()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">批量删除</div>
    </div>

</div>
<script type="text/javascript">
    $(function(){
        //加载数据
        $('#shop_dg2').datagrid({
            url:"<%=request.getContextPath()%>/roleController/roleList.jhtml",
            fit:true,
            //分页数据
            pagination:false,
            pagePosition:'top',
            pageNumber:1, //number 在设置分页属性的时候初始化页码。 1
            pageSize:3, //number 在设置分页属性的时候初始化页面大小。 10
            pageList:[3,5,10,15], //
            //引入工具栏
            toolbar:"#emp_tool_div",
            checkOnSelect:false,
            selectOnCheck:false,
            //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
            fitColumns:true,
            columns:[[
                {field:'che',checkbox:true},
                {field:'name',title:'名称',width:100},
                {field:'isSystem',title:'是否内置',width:100,align:'center',formatter:function(value,rows,index){
                    if(value==1){
                        return '是';
                    }
                    if(value==2){
                        return '否';
                    }
                }},
                {field:'description',title:'描述',width:100},
                {field:'createDate',title:'创建日期',width:100},
                {field:'sdfsdf',title:'操作',width:100,
                    formatter:function(value,row,index){
                        $("#emp_edit_btn").attr("onClick","open_emp_edit_dialog("+row.id+")");
                        return $("#empbtnSpan").html();
                    }},
            ]],
        });

    });

    //搜索方法
    function emp_search(){
        var search_emp_degree = $("#search_emp_degree").combobox("getValue");
        $("#shop_dg2").datagrid('load',{
            shlxid:search_emp_degree,
        });
    }
    //重置方法
    function emp_search_reset(){
        $("#emp_form_search").form("reset");
    }

    //批量删除选中的系列
    function delete_all_checked_emp(){
        var checked_emp_arr = $('#shop_dg2').datagrid("getChecked");
        if(0<checked_emp_arr.length){
            $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
                if (r){
                    var emp_ids="";
                    for(var i=0;i<checked_emp_arr.length;i++){
                        emp_ids +=","+checked_emp_arr[i].id;
                    }
                    emp_ids=emp_ids.substring(1);
                    $.ajax({
                        url:"<%=request.getContextPath()%>/roleController/deleteShopByIDs.jhtml",
                        type:"get",
                        dataType:"json",
                        data:{hrmempIDS:emp_ids},
                        success:function(data){
                            $.messager.alert('提示','删除成功');
                            $.messager.show({
                                title:'提示',
                                msg:'你成功删除'+checked_emp_arr.length+'条数据',
                                timeout:2000,
                                showType:'slide'
                            });
                            //刷新数据表格
                            $('#shop_dg2').datagrid("load");
                        }
                    })
                }
            });
        }else{
            $.messager.alert('提示','请至少选择一条数据');
        }
    }

    //新增
    //打开添加对话框
    function open_emp_add_dialog(){
        var emp_add_dialog = $("<div></div>").dialog({
            title:"添加员工",
                href:"<%=request.getContextPath()%>/roleController/toRoleAdd.jhtml",
            modal:true,
            width:800,
            height:360,
            buttons:[{
                text:'保存',
                iconCls:"icon-add",
                handler:function(){
                    //ajax向后台发送添加请求,回调函数中销毁对话框,刷新数据表格
                    $.ajax({
                        url:"<%=request.getContextPath()%>/roleController/insertRole.jhtml",
                        data:$("#add_shop_form").serialize(),//新增页面的函数方法
                        dataType:"json",
                        type:"post",
                        success:function(data){
                            $.messager.show({
                                title:'提示',
                                msg:'保存成功',
                                timeout:2000,
                                showType:'slide'
                            });
                            //销毁对话框

                            //刷新数据表格
                            $('#shop_dg2').datagrid("load");
                        }
                    })
                }
            },{
                text:'取消',
                iconCls:"icon-cancel",
                handler:function(){
                    
                    //销毁对话框
                    emp_add_dialog.dialog("destroy");
                }
            }]
        });
    }

    //修改
    function open_emp_edit_dialog(){
        var ff = $("#shop_dg2").datagrid('getSelections');

        if(ff.length=="null"){
            $.messager.alert('重要提示！！！','请选中数据后再进行编辑','warning');
            //		return false 时 函数不再继续执行
            return false;
        }

        $("#editrole").dialog({
            title:'修改',
            width: 600,
            height: 400,
            closed: false, //定义是否可以关闭窗口。
            href: '<%=request.getContextPath()%>/roleController/toRoleAdd.jhtml',
            //modal: true   //定义是否将窗体显示为模式化窗口
            buttons:[{
                text:'提交',
                handler:function(){
                    $.ajax({
                        url:'<%=request.getContextPath()%>/roleController/updateRoleById.jhtml',
                        type:'post',
                        data:$("#add_shop_form").serialize(),
                        dataType:'json',
                        success:function(data){
                            $.messager.show({
                                title:'提示消息',
                                msg:'修改成功',
                                timeout:2000,
                                showType:'slide',
                            });
                            $("#editfangyuan").dialog('close');
                            $("#aa").datagrid('reload');
                            
                        },
                        error:function(){
                            alert("系统错误,請用DEBUG调试");
                        }
                    })
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

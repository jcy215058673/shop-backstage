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
    <table id="shop_dg1"></table>
    <div id="edit"></div>
    <!-- 定义工具栏容器 -->
    <div id="emp_tool_div">
        <div onclick="open_emp_add_dialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</div>
        <div onclick="delete_all_checked_emp1()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">批量删除</div>
        <!-- 条件查询 -->
        <form id="emp_form_search">
            名称:<input id="mingchenglist1" class="easyui-searchbox" data-options="searcher:emp_search">
            <div onClick="emp_search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</div>
            <div onClick="emp_search_reset()" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">重置</div>
        </form>


    </div>


</div>
<script type="text/javascript">
    $(function(){
        //加载数据
        $('#shop_dg1').datagrid({
            url:"<%=request.getContextPath()%>/zhifuController/zhifuList.jhtml",
            fit:true,
            //按ctrl多选
            ctrlSelect:true,
            //开启分页
            //pagination:true,
            //每页条数
            pageSize:3,
            pageList:[1,3,5,7,9],
            //引入工具栏
            toolbar:"#emp_tool_div",
            //根据选中的checked进行删除
            checkOnSelect:false,
            selectOnCheck:false,
            //表格占满
            fitColumns:true,
            columns:[[
                {field:'che',checkbox:true},
                {field:'zname',title:'名称',width:100},
                {field:'zmethod',title:'支付方式',width:100,
                    formatter:function(value,row,index){
                        if(value==0){                        //在这判断的都是Integer类型的
                            return"在线支付";
                        }else if(value==1){
                            return "线下支付";
                        }
                    }},
                {field:'zdescription',title:'介绍',width:100},
                {field:'zorders',title:'排序',width:100},
                {field:'peiname',title:'配送方式',width:100},
                {field:'zicon',title:'图标',width:20,hight:20,
                    formatter: function(value,row,index){
                        return "<img src="+value+" width='20px'>";
                    }
                },
                {field:'sdfsdf',title:'操作',width:100,
                    formatter:function(value,row,index){
                        $("#emp_edit_btn").attr("onClick","open_emp_edit_dialog("+row.zid+")");
                        return $("#empbtnSpan").html();
                    }},
            ]],
        });

    });

    //搜索方法
    function emp_search(){
        var mingchenglist1 = $("#mingchenglist1").val();
        $("#shop_dg1").datagrid('load',{
            zname:mingchenglist1,
        });
    }
    //重置方法
    function emp_search_reset(){
        $("#emp_form_search").form("reset");
    }

    //批量删除选中的系列
    function delete_all_checked_emp1(){
        //根据CTRL多选删除
        /*var checked_emp_arr = $('#shop_dg').datagrid("getSelections");*/
        //根据选中的checked进行删除
        var checked_emp_arr = $('#shop_dg1').datagrid('getChecked');
        if(0<checked_emp_arr.length){
            $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
                if (r){
                    var emp_ids="";
                    for(var i=0;i<checked_emp_arr.length;i++){
                        emp_ids +=","+checked_emp_arr[i].zid;
                    }
                    emp_ids=emp_ids.substring(1);
                    $.ajax({
                        url:"<%=request.getContextPath()%>/zhifuController/deleteShopByIDss.jhtml",
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
                            $('#shop_dg1').datagrid("load");
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
            href:"<%=request.getContextPath()%>/zhifuController/toZhifuAdd.jhtml",
            modal:true,
            width:800,
            height:360,
            buttons:[{
                text:'保存',
                iconCls:"icon-add",
                handler:function(){
                    //ajax向后台发送添加请求,回调函数中销毁对话框,刷新数据表格
                    $.ajax({
                        url:"<%=request.getContextPath()%>/zhifuController/insertZhifu.jhtml",
                        data:return_add_emp_data(),//新增页面的函数方法
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
                            emp_add_dialog.dialog("destroy");
                            //刷新数据表格
                            $('#shop_dg1').datagrid("load");
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
    //打开员工编辑对话框
    function open_emp_edit_dialog(zid){
        var emp_edit_dialog = $("<div></div>").dialog({
            title:"编辑员工",
            href:"<%=request.getContextPath()%>/zhifuController/toEditZhifu.jhtml?zid="+zid,
            modal:true,
            width:350,
            height:300,
            buttons:[{
                text:'保存',
                iconCls:"icon-add",
                handler:function(){
                    var r=confirm("您确认修改")
                    if (r==true)
                    {
                        //ajax向后台发送添加请求 回调函数中销毁对话框  刷新数据表格
                        $.ajax({
                            url:"<%=request.getContextPath()%>/zhifuController/updateZhifuById.jhtml",
                            type:"post",
                            data:return_edit_emp_data(),
                            dataType:"json",
                            success:function(data){
                                $.messager.show({
                                    title:'提示',
                                    msg:'保存成功',
                                    timeout:2000,
                                    showType:'slide'
                                });
                                //销毁对话框
                                emp_edit_dialog.dialog("destroy");
                                //刷新数据表格
                                $('#shop_dg1').datagrid("reload");
                            },

                        })
                    }else{
                        emp_edit_dialog.dialog("destroy");
                    }

                }
            },{
                text:'取消',
                iconCls:"icon-cancel",
                handler:function(){
                    //销毁对话框
                    emp_edit_dialog.dialog("destroy");
                }
            }]
        })
    }

</script>
</body>
</html>
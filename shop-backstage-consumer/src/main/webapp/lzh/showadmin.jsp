<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<jsp:include page="inc.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	 <div id="gp" class="easyui-panel" title="条件查询" style="padding: 10px"    
        data-options="collapsed:true,collapsible:true">   
         
    	名称:<input  id="cname"><br><br>
    	
	<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
	<a href="javascript:reset1()" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	</div> 
	<span id ="empbtnSpan" style="display:none">
				<div id="edit_btn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</div>	
		</span>
	
 <table id="admin"></table>
<div id="add"></div>
<div id="edit"></div>
	 <!-- 定义工具栏容器 -->
	 <div id="emp_tool">
		 <div onclick="open_emp_add_dialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</div>
		 <div onclick="deleteadmin()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">批量删除</div>
	 </div>
<!-- <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit1',plain:true" id="up">修改</a> -->
<script type="text/javascript">

//新增弹框
$(function(){
	search();
})

function search(){
	$('#admin').datagrid({    
	    url:'<%=request.getContextPath()%>/adminController/queryadmin.jhtml',
		fit:true,
		//分页数据
		pagination:false,
		pagePosition:'top',
		pageNumber:1, //number 在设置分页属性的时候初始化页码。 1
		pageSize:3, //number 在设置分页属性的时候初始化页面大小。 10
		pageList:[3,5,10,15], //
		//引入工具栏
		toolbar:"#emp_tool",
		checkOnSelect:false,
		selectOnCheck:false,
		//真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		fitColumns:true,
	    columns:[[ 
			{field:'che',checkbox:true}, 
			{field:'username',title:'用户名',width:100},
			{field:'email',title:'邮件',width:100},
			{field:'name',title:'姓名',width:100},
			{field:'department',title:'部门',width:100},
			{field:'loginDate',title:'最后登录日期',width:100},
			{field:'loginIp',title:'最后登录IP',width:100},
			{field:'isLocked',title:'状态',width:100},
			{field:'createDate',title:'创建日期',width:100},
			{field:'xx',title:'操作',width:100}

	  		]],
	  		queryParams: {
		    	cname:$("#cname").val(),
			},


	});
	
}

//批量删除选中的系列
function deleteadmin(){
	var checkedarr = $('#admin').datagrid("getChecked");
	if(0<checkedarr.length){
		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){
			if (r){
				var ids="";
				for(var i=0;i<checkedarr.length;i++){
					ids +=","+checkedarr[i].id;
				}
				ids=ids.substring(1);
				
				$.ajax({
					url:"<%=basePath%>/adminController/deladmin.jhtml",
					type:"get",
					dataType:"json",
					data:{hrmempIDS:ids},
					success:function(data){
						$.messager.alert('提示','删除成功');
						$.messager.show({
							title:'提示',
							msg:'你成功删除'+checkedarr.length+'条数据',
							timeout:2000,
							showType:'slide'
						});
						//刷新数据表格
						$('#admin').datagrid("load");
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
<%--
  Created by IntelliJ IDEA.
  User: 意中人
  Date: 2018/04/11
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<jsp:include page="../inc2.jsp"></jsp:include>
</head>
<body>
     <table class='table' id='log_table'></table>
     <script type="text/javascript">
     $(function(){
    	 $("#log_table").bootstrapTable({
    		 url:'<%=request.getContextPath()%>/areacontroller/queryMongo.jhtml',
    	     striped: true,                      //是否显示行间隔色
    	     showColumns: true,                  //是否显示所有的列
    	     showPaginationSwitch:true,
    	     minimumCountColumns: 1,             //最少允许的列数
    	     showRefresh: true,                  //是否显示刷新按钮
    	     showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
    	     search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
    	     searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
    	     pagination: true,                   //是否显示分页（*）
    	     paginationLoop:true, //开启分页无限循环
    	     pageNumber:1,                       //初始化加载第一页，默认第一页
    	     pageSize:3,                       //每页的记录行数（*）
    	     pageList:[3,6,9],              //如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
    	     sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
    	     method:'post',//发送请求的方式
    	     contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
    	     queryParams: function(data){
    	   	 return {
    					page:this.pageNumber,//当前页
    					rows:this.pageSize,//每页条数
    				}
    	     },
    	columns:[
    	{
    	checkbox:true,
    	},{
    	field: 'returnval',
    	title: '返回值',
    	width: 100
    	},
    	{
    	field: 'method',
    	title: '方法名',
    	width: 100
    		},
    	{
    	  field: 'paramVal',
    	  title: '参数',
    	  width: 100
    		},
    	{
    		   field: 'implUrl',
    		   title: '路径',
    		   width: 100
    		  
    		},
    		{
    			   field: 'mondate',
    			   title: '操作时间',
    			   width: 100
    			  
    			}
    	      ]
    	});

     })
 	
     </script>
</body>
</html>
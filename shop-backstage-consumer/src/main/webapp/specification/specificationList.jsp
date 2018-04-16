<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../inc.jsp"></jsp:include>
</head>
<body>
<div>
    <a href="javascript:void(0)" onclick="addSpecification()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
    <a href="javascript:void(0)" onclick="deleteSpecification()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">删除</a>
    <a href="javascript:void(0)" onclick="reloadSpecification()" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">刷新</a>

</div>
    <table id="specification-table" ></table>
    <script type="text/javascript">
        //刷新
        function reloadSpecification(){
            specificationSearch();
        }
        $(function (){
            specificationSearch();
        })
        //查询
        function specificationSearch(){
            $('#specification-table').datagrid({
                url:'<%=request.getContextPath()%>/specification/querySpecificationList.jhtml',
//                queryParams:{brandname:$("#branname").val()},
                pagination:true,
                pageNumber:1,
                pageSize:10,
                pageList:[10,20,30],
                checkOnSelect:false,
                selectOnCheck:false,
                singleSelect:true,
                striped:true,
                fitColumns:true,
                columns:[[
                    {field:'check',checkbox:true},
                    {field:'name',title:'名称',width:100},
                    {field:'types',title:'类型',width:100,
                        formatter: function(value,row,index){
                            if(row.type == 1){
                                return "文本"
                            }
                            if(row.type == 0){
                                return "图片"
                            }
                        }
                    },
                    {field:'guige',title:'规格值',width:770,
                        formatter: function(value,row,index){
                            var specArr = row.specificationValues;
                            var str = "";
                            for(var i=0;i<specArr.length;i++){
                                str += "       "+specArr[i].svname;
                            }
                            return str.substring(2);
                        }
                    },
                    {field:'orders',title:'排序',width:100},
                    {field:'act',title:'操作',width:100,
                        formatter: function(value,row,index){
                            return "<a herf='javascript:void(0)' onclick='bianJi()'>[编辑]</a>";
                        }
                    },
                ]]
            });
        }
        //编辑
        function bianJi(){
            alert(123);
        }
        //批量删除
        function deleteSpecification(){
            var specArr = $('#specification-table').datagrid('getChecked');
            if(specArr.length<1){
                $.messager.alert('重要提示！！！','至少选择一个进行删除','warning');
//	 						return false 时 函数不再继续执行
                return false;
            }
            var ids = "";
            for(var i=0;i<specArr.length;i++){
                ids += ","+specArr[i].id;
            }
            ids = ids.substring(1);
            $.messager.confirm('确认','您确认想要删除'+specArr.length+'记录吗？',function(r){
                if (r){
                    $.ajax({
                        url:"<%=request.getContextPath()%>/specification/pldelSpecification.jhtml",
                        type:"post",
                        data:{"ids":ids},
                        dataType:"text",
                        success:function (data){
                            if(data >0 ){
                                $.messager.show({
                                    title:'提示消息',
                                    msg:'成功删除'+specArr.length+'条记录',
                                    timeout:2000,
                                    showType:'slide',
                                    style:{

                                    }
                                });
                                specificationSearch();
                            }
                        },
                        error:function (){

                            alert("批量删除错误");
                        }

                    })
                }
            });
        }
        function addSpecification(){
            location.href = "addSpecification.jsp";
        }
    </script>
</body>
</html>

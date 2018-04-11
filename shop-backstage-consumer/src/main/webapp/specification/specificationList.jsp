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
    <table id="specification-table" ></table>
    <script type="text/javascript">
        $(function (){
            brandSearch();
        })
        //查询
        function brandSearch(){
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
                columns:[[
                    {field:'check',checkbox:true},
                    {field:'name',title:'名称',width:100},
                    {field:'types',title:'类型',width:100,
                        formatter: function(value,row,index){
                            if(row.type == 1){
                                return "图片"
                            }
                            if(row.type == 0){
                                return "文本"
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
        function bianJi(){
            alert(123);
        }
    </script>
</body>
</html>

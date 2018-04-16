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
<table id="shares"></table>
<script type="text/javascript">

    $(function(){
        search();
    })

    function search(){

        $('#shares').datagrid({

            url:'<%=request.getContextPath()%>/paymentController/querypayment.jhtml',
            //分页数据
            pagination:false,
            pagePosition:'bottom',
            pageNumber:1, //number 在设置分页属性的时候初始化页码。 1
            pageSize:5, //number 在设置分页属性的时候初始化页面大小。 10
            pageList:[3,5,10,15], //
            // singleSelect:true,//只允许选择一行
            checkOnSelect:false,
            selectOnCheck:false,
            //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
            fitColumns:true,
            columns:[[
                {field:'che',checkbox:true},
                {field:'id',title:'id',width:100},
                {field:'paymentMethod',title:'支付方式',width:100},
                {field:'status',title:'是否启用',width:100,align:'center',formatter:function(value,rows,index){
                    if(value==1){
                        return '√';
                    }
                    if(value==2){
                        return '×';
                    }
                }},
                {field:'',title:'版本',width:100},
                {field:'shop++',title:'作者',width:100},
                {field:'xx',title:'操作',width:100,
                    formatter: function(value,row,index){
                        var str ="";
                        var str1 ="";
                        if(row.status==1){
                            str = "<a href='#' onclick='xz("+row.id+")'>[设置][卸载] </a>";


                            str1 =row.jname;
                            return str;
                        }if(row.status==2){
                            str = "<a href='#' onclick='az("+row.id+")'>[安装] </a>";


                            str1 =row.jname;
                            return str;
                        }



                    }
                }

            ]],

        });






    }

    function xz(id){
            $.ajax({
                url:"<%=request.getContextPath() %>/paymentController/xz.jhtml?id="+id,
                dataType:"json",
                contentType:"application/json;charset=utf-8",
                type:"post",
              /*  data:{"id":id},*/
                success:function(data) {
                    $('#shares').datagrid('reload');

                }
            });

    }
    function az(id){
        $.ajax({
            url:"<%=request.getContextPath() %>/paymentController/az.jhtml?id="+id,
            dataType:"json",
            contentType:"application/json;charset=utf-8",
            type:"post",
            /*  data:{"id":id},*/
            success:function(){

                $('#shares').datagrid('reload');

            }

        });

    }

</script>
</body>
</html>

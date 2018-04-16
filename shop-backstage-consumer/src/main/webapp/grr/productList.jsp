<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/13
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:include page="ln.jsp"></jsp:include>
<body>
<div class="container" style="width: 1300px">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <button type="button" class="btn btn-default btn-info" onclick="addProduct()">添加</button>&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-default btn-danger disabled">删除</button>&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-default btn-warning">刷新</button>&nbsp;&nbsp;&nbsp;
            <div class="btn-group">
                <button class="btn btn-default">商品筛选</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>&nbsp;&nbsp;&nbsp;
                <ul class="dropdown-menu">
                    <li class="divider">
                        <a href="#">已上架</a>
                        <a href="#">未上架</a>
                    </li>
                    <li class="divider">
                        <a href="#">已列出</a>
                        <a href="#">未列出</a>
                    </li>
                    <li>
                        <a href="#">已置顶</a>
                        <a href="#">未置顶</a>
                    </li>
                    <li>
                        <a href="#">赠品</a>
                        <a href="#">非赠品</a>
                    </li>
                    <li>
                        <a href="#">有货</a>
                        <a href="#">缺货</a>
                    </li>
                    <li>
                        <a href="#">库存正常</a>
                        <a href="#">库存警告</a>
                    </li>
                </ul>
            </div>
            <button type="button" class="btn btn-default btn-inverse">更多选项</button>&nbsp;&nbsp;&nbsp;
            <div class="btn-group">
                <button class="btn btn-default">每页显示</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li class="divider">
                        <a href="#">10</a>
                    </li>
                    <li><a href="#">20</a></li>
                    <li><a href="#">50</a></li>
                    <li><a href="#">100</a></li>
                </ul>
            </div><br>
            <table class="table">
                <thead>
                    <tr class="success">
                        <td><input type="checkbox"/></td>
                        <td>编号</td>
                        <td>名称</td>
                        <td>商品分类</td>
                        <td>销售价</td>
                        <td>成本价</td>
                        <td>库存</td>
                        <td>是否上架</td>
                        <td>创建日期</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="products">
                    <tr class="warning">
                        <td><input type="checkbox"/></td>
                        <td>${products.sn}</td>
                        <td>${products.name}</td>
                        <td>${products.productCategory}</td>
                        <td>${products.price}</td>
                        <td>${products.cost}</td>
                        <td>${products.stock}</td>
                        <td>
                            <c:if test="${products.isMarketable==0}"><b><font color="lime">√</font></b></c:if>
                            <c:if test="${products.isMarketable==1}"><b><font color="#f08080">×</font></b></c:if>
                        </td>
                        <td>
                            <fmt:formatDate value="${products.createDate}" pattern="yyyy-MM-dd HH24:mm:ss"></fmt:formatDate>
                        </td>
                        <td>
                            <a href="/grr/updateProduct.jsp">[编辑]</a>
                           <a href="/grr/showProduct.jsp">[查看]</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%--<table class="table" id="file-table" border="1"></table>--%>
<script>
    function addProduct(){
       location.href="<%=request.getContextPath()%>/productController/addProductList.jhtml"
    }
/*  $("#file-table").bootstrapTable({
        url:"<%=request.getContextPath()%>/productController/productList.jhtml",
        striped: true,//隔行变色
        showColumns:true,//是否显示 内容列下拉框
        showPaginationSwitch:true,//是否显示 数据条数选择框
        minimumCountColumns:1,//最小留下一个
        showRefresh:true,//显示刷新按钮
        showToggle:true,//显示切换视图
        search:true,//是否显示搜索框
//  searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
        pagination:false,//开启分页
        paginationLoop:true,//开启分页无限循环
        pageNumber:1,//当前页数
        pageSize:2,//每页条数
        pageList:[1,2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
        sidePagination:"server",//
        method:'post',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        columns: [
            {
                checkbox:true,
            },{
                field: 'sn',
                title: '编号',
                idField:true,
                width: 100
            },{
                field: 'name',
                title: '名称',
                width: 100
            },{
                field: 'productCategory',
                title: '商品分类',
                width: 100

            },{
                field: 'price',
                title: '销售价',
                width: 100
            },{
                field: 'cost',
                title: '成本价',
                width: 100
            },{
                field: 'stock',
                title: '库存',
                idField:true,
                width: 100
            },{
                field: 'isMarketable',
                title: '是否上架',
                width: 100
            },{
                field: 'createDate',
                title: '创建日期',
                width: 100
            },{
                field: 'sya',
                title: '操作',
                width: 100,
                formatter:function(value,row,index){
                    var str='<button type="button" class="btn btn-info" onclick="showInfo(\''+row.fileContent+'\')">[编辑]</button>';
                    str +='<button type="button" class="btn btn-primary" onclick="sortByDate(\''+row.fileid+'\')" >[查看]</button>';
                    return str;
                }
            }]
    })*/
</script>
</body>
</html>

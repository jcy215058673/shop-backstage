<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/8
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 引入EasyUI的样式文件-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/EasyUI/themes/default/easyui.css" type="text/css"/>
    <!-- 引入EasyUI的图标样式文件-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/EasyUI/themes/icon.css" type="text/css"/>
</head>
<body class="easyui-layout">
        <div data-options="region:'north',title:'标题',split:true" style="height:100px;">
            <h1>金科员工管理系统</h1>
        </div>
        <div data-options="region:'west',title:'导航菜单',split:true" style="width:150px;">
            <ul id="menu-tree"></ul>
        </div>
        <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
            <div id="tt" class="easyui-tabs" data-options="fit:true">
            </div>
        </div>
    <!-- 引入JQuery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/EasyUI/jquery.min.js"></script>
    <!-- 引入EasyUI -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/EasyUI/jquery.easyui.min.js"></script>
    <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/EasyUI/locale/easyui-lang-zh_CN.js"></script>
    <!-- 支持tree组件的使用 -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/EasyUI/util-js.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#menu-tree").tree({
                url:'<%=request.getContextPath()%>/tree/queryTreeList.jhtml',
                parentField:'pid',
                onClick:function(node){
                    if(node.url != null && node.url != ""){
                        addtabs(node.url,node.text);
                    }
                }
            })
        })

        function addtabs(urlcolo,titlename){
            var flag = $('#tt').tabs('exists',titlename);
            if(flag){
                $('#tt').tabs('select',titlename);
            }else{
                $('#tt').tabs('add',{
                    title:titlename,
                    href:"<%=request.getContextPath()%>/"+urlcolo,
                    closable:true,
                    tools:[{
                        iconCls:'icon-mini-refresh',
                        handler:function(){
                            alert('refresh');
                        }
                    }]
                });
            }

        }
    </script>
</body>
</html>

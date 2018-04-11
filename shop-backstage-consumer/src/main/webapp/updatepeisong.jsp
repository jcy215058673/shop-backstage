<%--
  Created by IntelliJ IDEA.
  User: wbn
  Date: 2018/4/9
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
         <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<!-- 定义编辑表单 -->
<form id="editForm">
    <input type="hidden" name="id" value="${peisong.id}">
    名称<input name="name" class="easyui-textbox"  value="${peisong.name}"/><p>
    默认物流公司<select name="defaultDeliveryCorp"  value="${defaultDeliveryCorp}">
                    <option value="0">-请选择-</option>
                    <option value="1" <c:if test="${'1' eq defaultDeliveryCorp}">selected</c:if> >普通快递</option>
                    <option value="2" <c:if test="${'2' eq defaultDeliveryCorp}">selected</c:if> >顺丰快递</option>
              </select><p>
    首重量<input name="firstWeight" class="easyui-textbox"  value="${peisong.firstWeight}"/><p>
    续重量<input name="continueWeight" class="easyui-textbox"  value="${peisong.continueWeight}"/><p>
    首重价格<input name="firstPrice" class="easyui-textbox"  value="${peisong.firstPrice}"/><p>
    续重价格<input name="continuePrice" class="easyui-textbox"  value="${peisong.continuePrice}"/><p>
    图标<input  type="file"   id="file_upload1" >
    <p>
        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           href="javascript:$('#file_upload1').uploadify('upload', '*')">开始上传所有任务</a>
        <a class="easyui-linkbutton" data-options="iconCls:'icon-lock'"
           href="javascript:$('#file_upload1').uploadify('stopa')">停止上传</a>
        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           href="javascript:$('#file_upload1').uploadify('upload')">上传</a>
        <a class="easyui-linkbutton" data-options="iconCls:'icon-lock'"
           href="javascript:$('#file_upload1').uploadify('cancel')">取消上传</a>
    </p>
    <div id="filequence">
    </div>
    <div id="imgQuence">
        <img src="${peisong.icon}" width="100px">
    </div>
    <input id="pro_img"  name="icon" type="hidden" value="${peisong.icon}" /><p>
    排序<input name="orders" class="easyui-textbox"  value="${peisong.orders}"/><p>
    介绍<input name="description" class="easyui-textbox"  value="${peisong.description}"/><p>

</form>
<script type="text/javascript">
    function return_edit_emp_data(){
        return $("#editForm").serialize();
    }

    //图片上传
    $(function (){
        //editor.readonly(true);   // 设置  kindeditor   修改时只读
        $("#file_upload1").uploadify({
            'swf'     : '${pageContext.request.contextPath}/uploadify/privateUpload/uploadify.swf',//按钮的动画
            'uploader': '${pageContext.request.contextPath}/peisongController/uploadResumeFiles.jhtml',
            'cancelImg': 'image/uploadify', //uploaddify 图片
            'queueID' :'filequence',  //  存放序列的地方
            'method'  : 'post',
            'fileObjName' : 'imgfiles',     //和后台的Action 属性驱动名字一样
            'sizeLimit':30,
            'progressData' :'percentage', //  设置上传进度显示方式，percentage显示上传百分比，speed显示上传速度
            'auto':false,   //是否自动  上传
            'multi': false,  //是否选择多个
            'removeCompleted' : false,// 上传完是否自动删除任务
            'fileSizeLimit': 0, // "4MB"  写0的话就是对 他不做限制
            'buttonText' :  '上传产品照片',
            'buttonCursor': 'head', // 光标的样子
            'fileTypeDesc' : 'mp4/avi/kux', // 你得告知  上传者    可以上传  什么类型的吧  与下面的那个属性连用
            'fileTypeExts' : '*.jpg;*.png;*.bmp;*.jpeg',//  告诉 uploadify可以上传  什么类型的
            'uploadLimit': 1, //设置   上传时的上传文件数       超过就会触发 on
            //'onSelectError':uploadErrorMsg,
            'onUploadSuccess': function (file,data,response){  //  上传成功回掉函数
                var file=eval("("+data+")");
                //  回显图片
                $("#imgQuence").html(file.fileName +"<br>"+"<img   src='${pageContext.request.contextPath}/upload/"+file.fileNameReal+"'>");
                // 保存路径
                $("#pro_img").val("${pageContext.request.contextPath}/upload/"+file.fileNameReal);
            },
            'onUploadError' :function (file, errorCode, errorMsg, errorString){
                alert("只能上传一个");
            },
        });

    })

</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/15
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resources/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/resources/admin/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/resources/admin/js/common.js"></script>
    <script type="text/javascript" src="/resources/admin/js/input.js"></script>
    <script type="text/javascript">
        $().ready(function() {

            var $inputForm = $("#inputForm");
            var $attributeTable = $("#attributeTable");
            var $addOption = $("#addOption");
            var $deleteOption = $("a.deleteOption");


            // 增加可选项
            $addOption.live("click", function() {
                var $this = $(this);
                var trHtml = '<tr class="optionTr"> <td> &nbsp; <\/td> <td> <input type="text" name="options" class="text" maxlength="200" \/> <\/td> <td> <a href="javascript:;" class="deleteOption">[删除]<\/a> <\/td> <\/tr>';		$attributeTable.append(trHtml);
            });

            // 删除可选项
            $deleteOption.live("click", function() {
                var $this = $(this);
                if ($attributeTable.find("tr.optionTr").size() <= 1) {
                    $.message("warn", "必须至少保留一个可选项");
                } else {
                    $this.closest("tr").remove();
                }
            });

            // 表单验证
            $inputForm.validate({
                rules: {
                    productCategoryId: "required",
                    name: "required",
                    order: "digits",
                    options: "required"
                }
            });

        });
    </script>
</head>
<body>
<div class="path">
    <a href="/admin/common/index.jhtml">首页</a> &raquo; 编辑属性
</div>
<form id="inputForm" action="update.jhtml" method="post">
    <input type="hidden" name="id" value="1" />
    <table id="attributeTable" class="input">
        <tr>
            <th>
                绑定分类:
            </th>
            <td colspan="2">
                连衣裙
            </td>
        </tr>
        <tr>
            <th>
                <span class="requiredField">*</span>名称:
            </th>
            <td colspan="2">
                <input type="text" name="name" class="text" value="材质" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>
                排序:
            </th>
            <td colspan="2">
                <input type="text" name="order" class="text" value="1" maxlength="9" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
                <a href="javascript:;" id="addOption" class="button">增加可选项</a>
            </td>
        </tr>
        <tr class="title">
            <td>
                &nbsp;
            </td>
            <td>
                可选项
            </td>
            <td>
                删除
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="雪纺" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="蕾丝" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="织锦" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="牛仔" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="绸缎" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="乔其纱" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="双绉" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="府绸" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
        <tr class="optionTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="options" class="text" value="其他" maxlength="200" />
            </td>
            <td>
                <a href="javascript:;" class="deleteOption">[删除]</a>
            </td>
        </tr>
    </table>
    <table class="input">
        <tr>
            <th>
                &nbsp;
            </th>
            <td>
                <input type="submit" class="button" value="确&nbsp;&nbsp;定" />
                <input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='productAttributeController/queryProductAttribute.jhtml'" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>

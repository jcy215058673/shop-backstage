<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/15
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resources/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/resources/admin/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/resources/admin/js/common.js"></script>
    <script type="text/javascript" src="/resources/admin/js/input.js"></script>
    <script type="text/javascript">
        $().ready(function() {

            var $inputForm = $("#inputForm");
            var $parameterTable = $("#parameterTable");
            var $addParameter = $("#addParameter");
            var $deleteParameter = $("a.deleteParameter");
            var parameterIndex = 1;


            // 增加参数
            $addParameter.live("click", function() {
                var $this = $(this);
                var trHtml = '<tr class="parameterTr"> <td> &nbsp; <\/td> <td> <input type="text" name="parameters[' + parameterIndex + '].name" class="text parametersName" maxlength="200" \/> <\/td> <td> <input type="text" name="parameters[' + parameterIndex + '].order" class="text parametersOrder" maxlength="9" style="width: 30px;" \/> <\/td> <td> <a href="javascript:;" class="deleteParameter">[删除]<\/a> <\/td> <\/tr>';		$parameterTable.append(trHtml);
                parameterIndex ++;
            });

            // 删除参数
            $deleteParameter.live("click", function() {
                var $this = $(this);
                if ($parameterTable.find("tr.parameterTr").size() <= 1) {
                    $.message("warn", "必须至少保留一个参数");
                } else {
                    $this.closest("tr").remove();
                }
            });

            $.validator.addClassRules({
                parametersName: {
                    required: true
                },
                parametersOrder: {
                    digits: true
                }
            });

            // 表单验证
            $inputForm.validate({
                rules: {
                    productCategoryId: "required",
                    name: "required",
                    order: "digits"
                }
            });

        });
    </script>
</head>
<body>
<div class="path">
    <a href="/admin/common/index.jhtml">首页</a> &raquo; 添加参数
</div>
<form id="inputForm" method="post">
    <table id="parameterTable" class="input">
        <tr>
            <th>
                绑定分类:
            </th>
            <td colspan="3">
                <select name="productCategoryId" >
                    <option value="1">
                        时尚女装
                    </option>
                    <option value="11">
                        &nbsp;&nbsp;
                        连衣裙
                    </option>
                    <option value="12">
                        &nbsp;&nbsp;
                        针织衫
                    </option>
                    <option value="13">
                        &nbsp;&nbsp;
                        短外套
                    </option>
                    <option value="14">
                        &nbsp;&nbsp;
                        小西装
                    </option>
                    <option value="15">
                        &nbsp;&nbsp;
                        牛仔裤
                    </option>
                    <option value="16">
                        &nbsp;&nbsp;
                        T恤
                    </option>
                    <option value="17">
                        &nbsp;&nbsp;
                        衬衫
                    </option>
                    <option value="18">
                        &nbsp;&nbsp;
                        风衣
                    </option>
                    <option value="19">
                        &nbsp;&nbsp;
                        卫衣
                    </option>
                    <option value="20">
                        &nbsp;&nbsp;
                        裤子
                    </option>
                    <option value="2">
                        精品男装
                    </option>
                    <option value="21">
                        &nbsp;&nbsp;
                        针织衫
                    </option>
                    <option value="22">
                        &nbsp;&nbsp;
                        POLO衫
                    </option>
                    <option value="23">
                        &nbsp;&nbsp;
                        休闲裤
                    </option>
                    <option value="24">
                        &nbsp;&nbsp;
                        牛仔裤
                    </option>
                    <option value="25">
                        &nbsp;&nbsp;
                        T恤
                    </option>
                    <option value="26">
                        &nbsp;&nbsp;
                        衬衫
                    </option>
                    <option value="27">
                        &nbsp;&nbsp;
                        西服
                    </option>
                    <option value="28">
                        &nbsp;&nbsp;
                        西裤
                    </option>
                    <option value="29">
                        &nbsp;&nbsp;
                        风衣
                    </option>
                    <option value="30">
                        &nbsp;&nbsp;
                        卫衣
                    </option>
                    <option value="3">
                        精致内衣
                    </option>
                    <option value="31">
                        &nbsp;&nbsp;
                        女式内裤
                    </option>
                    <option value="32">
                        &nbsp;&nbsp;
                        男式内裤
                    </option>
                    <option value="33">
                        &nbsp;&nbsp;
                        保暖内衣
                    </option>
                    <option value="34">
                        &nbsp;&nbsp;
                        塑身衣
                    </option>
                    <option value="35">
                        &nbsp;&nbsp;
                        连裤袜
                    </option>
                    <option value="36">
                        &nbsp;&nbsp;
                        打底袜
                    </option>
                    <option value="37">
                        &nbsp;&nbsp;
                        文胸
                    </option>
                    <option value="38">
                        &nbsp;&nbsp;
                        睡衣
                    </option>
                    <option value="39">
                        &nbsp;&nbsp;
                        泳装
                    </option>
                    <option value="40">
                        &nbsp;&nbsp;
                        浴袍
                    </option>
                    <option value="4">
                        服饰配件
                    </option>
                    <option value="41">
                        &nbsp;&nbsp;
                        女士腰带
                    </option>
                    <option value="42">
                        &nbsp;&nbsp;
                        男士皮带
                    </option>
                    <option value="43">
                        &nbsp;&nbsp;
                        女士围巾
                    </option>
                    <option value="44">
                        &nbsp;&nbsp;
                        男士围巾
                    </option>
                    <option value="45">
                        &nbsp;&nbsp;
                        帽子
                    </option>
                    <option value="46">
                        &nbsp;&nbsp;
                        手套
                    </option>
                    <option value="47">
                        &nbsp;&nbsp;
                        领带
                    </option>
                    <option value="48">
                        &nbsp;&nbsp;
                        领结
                    </option>
                    <option value="49">
                        &nbsp;&nbsp;
                        发饰
                    </option>
                    <option value="50">
                        &nbsp;&nbsp;
                        袖扣
                    </option>
                    <option value="5">
                        时尚女鞋
                    </option>
                    <option value="51">
                        &nbsp;&nbsp;
                        高帮鞋
                    </option>
                    <option value="52">
                        &nbsp;&nbsp;
                        雪地靴
                    </option>
                    <option value="53">
                        &nbsp;&nbsp;
                        中筒靴
                    </option>
                    <option value="54">
                        &nbsp;&nbsp;
                        单鞋
                    </option>
                    <option value="55">
                        &nbsp;&nbsp;
                        凉鞋
                    </option>
                    <option value="56">
                        &nbsp;&nbsp;
                        靴子
                    </option>
                    <option value="57">
                        &nbsp;&nbsp;
                        短靴
                    </option>
                    <option value="58">
                        &nbsp;&nbsp;
                        雨靴
                    </option>
                    <option value="6">
                        流行男鞋
                    </option>
                    <option value="59">
                        &nbsp;&nbsp;
                        低帮鞋
                    </option>
                    <option value="60">
                        &nbsp;&nbsp;
                        高帮鞋
                    </option>
                    <option value="61">
                        &nbsp;&nbsp;
                        休闲鞋
                    </option>
                    <option value="62">
                        &nbsp;&nbsp;
                        正装鞋
                    </option>
                    <option value="7">
                        潮流女包
                    </option>
                    <option value="63">
                        &nbsp;&nbsp;
                        单肩包
                    </option>
                    <option value="64">
                        &nbsp;&nbsp;
                        双肩包
                    </option>
                    <option value="65">
                        &nbsp;&nbsp;
                        手提包
                    </option>
                    <option value="66">
                        &nbsp;&nbsp;
                        手拿包
                    </option>
                    <option value="8">
                        精品男包
                    </option>
                    <option value="67">
                        &nbsp;&nbsp;
                        单肩男
                    </option>
                    <option value="68">
                        &nbsp;&nbsp;
                        双肩包
                    </option>
                    <option value="69">
                        &nbsp;&nbsp;
                        手提包
                    </option>
                    <option value="70">
                        &nbsp;&nbsp;
                        手拿包
                    </option>
                    <option value="9">
                        童装童鞋
                    </option>
                    <option value="71">
                        &nbsp;&nbsp;
                        运动鞋
                    </option>
                    <option value="72">
                        &nbsp;&nbsp;
                        牛仔裤
                    </option>
                    <option value="73">
                        &nbsp;&nbsp;
                        套装
                    </option>
                    <option value="74">
                        &nbsp;&nbsp;
                        裤子
                    </option>
                    <option value="10">
                        时尚饰品
                    </option>
                    <option value="75">
                        &nbsp;&nbsp;
                        项链
                    </option>
                    <option value="76">
                        &nbsp;&nbsp;
                        手链
                    </option>
                    <option value="77">
                        &nbsp;&nbsp;
                        戒指
                    </option>
                    <option value="78">
                        &nbsp;&nbsp;
                        耳饰
                    </option>
                </select>
            </td>
        </tr>
        <tr>
            <th>
                <span class="requiredField">*</span>名称:
            </th>
            <td colspan="3">
                <input type="text" name="name" class="text" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>
                排序:
            </th>
            <td colspan="3">
                <input type="text" name="order" class="text" maxlength="9" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td colspan="3">
                <a href="javascript:;" id="addParameter" class="button">增加参数</a>
            </td>
        </tr>
        <tr class="title">
            <td>
                &nbsp;
            </td>
            <td>
                名称
            </td>
            <td>
                排序
            </td>
            <td>
                删除
            </td>
        </tr>
        <tr class="parameterTr">
            <td>
                &nbsp;
            </td>
            <td>
                <input type="text" name="parameters[0].name" class="text parametersName" maxlength="200" />
            </td>
            <td>
                <input type="text" name="parameters[0].order" class="text parametersOrder" maxlength="9" style="width: 30px;" />
            </td>
            <td>
                <a href="javascript:;" class="deleteParameter">[删除]</a>
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
                <input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='productParameterController/queryProductParameter.jhtml'" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>

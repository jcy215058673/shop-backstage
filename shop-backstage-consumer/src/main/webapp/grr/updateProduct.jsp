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
    <title>Title</title>
    <link href="/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resources/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/resources/admin/js/jquery.tools.js"></script>
    <script type="text/javascript" src="/resources/admin/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/resources/admin/editor/kindeditor.js"></script>
    <script type="text/javascript" src="/resources/admin/js/common.js"></script>
    <script type="text/javascript" src="/resources/admin/js/input.js"></script>
    <style type="text/css">
        .specificationSelect {
            height: 100px;
            padding: 5px;
            overflow-y: scroll;
            border: 1px solid #cccccc;
        }

        .specificationSelect li {
            float: left;
            min-width: 150px;
            _width: 200px;
        }
    </style>
    <script type="text/javascript">
        $().ready(function() {

            var $inputForm = $("#inputForm");
            var $productCategoryId = $("#productCategoryId");
            var $isMemberPrice = $("#isMemberPrice");
            var $memberPriceTr = $("#memberPriceTr");
            var $memberPrice = $("#memberPriceTr input");
            var $browserButton = $("#browserButton");
            var $productImageTable = $("#productImageTable");
            var $addProductImage = $("#addProductImage");
            var $deleteProductImage = $("a.deleteProductImage");
            var $parameterTable = $("#parameterTable");
            var $attributeTable = $("#attributeTable");
            var $specificationIds = $("#specificationSelect :checkbox");
            var $specificationProductTable = $("#specificationProductTable");
            var $addSpecificationProduct = $("#addSpecificationProduct");
            var $deleteSpecificationProduct = $("a.deleteSpecificationProduct");
            var productImageIndex = 2;
            var previousProductCategoryId = "11";


            $browserButton.browser();

            // 会员价
            $isMemberPrice.click(function() {
                if ($(this).prop("checked")) {
                    $memberPriceTr.show();
                    $memberPrice.prop("disabled", false);
                } else {
                    $memberPriceTr.hide();
                    $memberPrice.prop("disabled", true);
                }
            });

            // 增加商品图片
            $addProductImage.click(function() {
                var trHtml = '<tr> <td> <input type="file" name="productImages[' + productImageIndex + '].file" class="productImageFile" \/> <\/td> <td> <input type="text" name="productImages[' + productImageIndex + '].title" class="text" maxlength="200" \/> <\/td> <td> <input type="text" name="productImages[' + productImageIndex + '].order" class="text productImageOrder" maxlength="9" style="width: 50px;" \/> <\/td> <td> <a href="javascript:;" class="deleteProductImage">[删除]<\/a> <\/td> <\/tr>';		$productImageTable.append(trHtml);
                productImageIndex ++;
            });

            // 删除商品图片
            $deleteProductImage.live("click", function() {
                var $this = $(this);
                $.dialog({
                    type: "warn",
                    content: "您确定要删除吗？",
                    onOk: function() {
                        $this.closest("tr").remove();
                    }
                });
            });

            // 修改商品分类
            $productCategoryId.change(function() {
                var hasValue = false;
                $parameterTable.add($attributeTable).find(":input").each(function() {
                    if ($.trim($(this).val()) != "") {
                        hasValue = true;
                        return false;
                    }
                });
                if (hasValue) {
                    $.dialog({
                        type: "warn",
                        content: "修改商品分类后当前参数、属性数据将会丢失，是否继续？",
                        width: 450,
                        onOk: function() {
                            loadParameter();
                            loadAttribute();
                            previousProductCategoryId = $productCategoryId.val();
                        },
                        onCancel: function() {
                            $productCategoryId.val(previousProductCategoryId);
                        }
                    });
                } else {
                    loadParameter();
                    loadAttribute();
                    previousProductCategoryId = $productCategoryId.val();
                }
            });

            // 加载参数
            function loadParameter() {
                $.ajax({
                    url: "parameter_groups.jhtml",
                    type: "GET",
                    data: {id: $productCategoryId.val()},
                    dataType: "json",
                    beforeSend: function() {
                        $parameterTable.empty();
                    },
                    success: function(data) {
                        var trHtml = "";
                        $.each(data, function(i, parameterGroup) {
                            trHtml += '<tr><td style="text-align: right;"><strong>' + parameterGroup.name + ':<\/strong><\/td><td>&nbsp;<\/td><\/tr>';
                            $.each(parameterGroup.parameters, function(i, parameter) {
                                trHtml += '<tr> <th>' + parameter.name + ': <\/th> <td> <input type="text" name="parameter_' + parameter.id + '" class="text" maxlength="200" \/> <\/td> <\/tr>';					});
                        });
                        $parameterTable.append(trHtml);
                    }
                });
            }

            // 加载属性
            function loadAttribute() {
                $.ajax({
                    url: "attributes.jhtml",
                    type: "GET",
                    data: {id: $productCategoryId.val()},
                    dataType: "json",
                    beforeSend: function() {
                        $attributeTable.empty();
                    },
                    success: function(data) {
                        var trHtml = "";
                        $.each(data, function(i, attribute) {
                            var optionHtml = '<option value="">请选择...<\/option>';
                            $.each(attribute.options, function(j, option) {
                                optionHtml += '<option value="' + option + '">' + option + '<\/option>';
                            });
                            trHtml += '<tr> <th>' + attribute.name + ': <\/th> <td> <select name="attribute_' + attribute.id + '"> ' + optionHtml + ' <\/select> <\/td> <\/tr>';				});
                        $attributeTable.append(trHtml);
                    }
                });
            }

            // 修改商品规格
            $specificationIds.click(function() {
                if ($specificationIds.filter(":checked").size() == 0) {
                    $specificationProductTable.find("tr:gt(1)").remove();
                }
                var $this = $(this);
                if ($this.prop("checked")) {
                    $specificationProductTable.find("td.specification_" + $this.val()).show().find("select").prop("disabled", false);
                } else {
                    $specificationProductTable.find("td.specification_" + $this.val()).hide().find("select").prop("disabled", true);
                }
            });

            // 增加规格商品
            $addSpecificationProduct.click(function() {
                if ($specificationIds.filter(":checked").size() == 0) {
                    $.message("warn", "必须至少选择一个规格");
                    return false;
                }
                if ($specificationProductTable.find("tr:gt(1)").size() == 0) {
                    $tr = $specificationProductTable.find("tr:eq(1)").clone().show().appendTo($specificationProductTable);
                    $tr.find("td:first").text("当前规格");
                    $tr.find("td:last").text("-");
                } else {
                    $specificationProductTable.find("tr:eq(1)").clone().show().appendTo($specificationProductTable);
                }
            });

            // 删除规格商品
            $deleteSpecificationProduct.live("click", function() {
                var $this = $(this);
                $.dialog({
                    type: "warn",
                    content: "您确定要删除吗？",
                    onOk: function() {
                        $this.closest("tr").remove();
                    }
                });
            });

            $.validator.addClassRules({
                memberPrice: {
                    min: 0,
                    decimal: {
                        integer: 12,
                        fraction: 2
                    }
                },
                productImageFile: {
                    required: true,
                    extension: "jpg,jpeg,bmp,gif,png"
                },
                productImageOrder: {
                    digits: true
                }
            });

            // 表单验证
            $inputForm.validate({
                rules: {
                    productCategoryId: "required",
                    name: "required",
                    sn: {
                        pattern: /^[0-9a-zA-Z_-]+$/,
                        remote: {
                            url: "check_sn.jhtml?previousSn=201304529",
                            cache: false
                        }
                    },
                    price: {
                        required: true,
                        min: 0,
                        decimal: {
                            integer: 12,
                            fraction: 2
                        }
                    },
                    cost: {
                        min: 0,
                        decimal: {
                            integer: 12,
                            fraction: 2
                        }
                    },
                    marketPrice: {
                        min: 0,
                        decimal: {
                            integer: 12,
                            fraction: 2
                        }
                    },
                    weight: "digits",
                    stock: "digits",
                    point: "digits"
                },
                messages: {
                    sn: {
                        pattern: "非法字符",
                        remote: "已存在"
                    }
                },
                submitHandler: function(form) {
                    if ($specificationIds.filter(":checked").size() > 0 && $specificationProductTable.find("tr:gt(1)").size() == 0) {
                        $.message("warn", "必须至少添加一个规格商品");
                        return false;
                    } else {
                        var isRepeats = false;
                        var parameters = new Array();
                        $specificationProductTable.find("tr:gt(1)").each(function() {
                            var parameter = $(this).find("select").serialize();
                            if ($.inArray(parameter, parameters) >= 0) {
                                $.message("warn", "商品规格值重复");
                                isRepeats = true;
                                return false;
                            } else {
                                parameters.push(parameter);
                            }
                        });
                        if (!isRepeats) {
                            $specificationProductTable.find("tr:eq(1)").find("select").prop("disabled", true);
                            addCookie("previousProductCategoryId", $productCategoryId.val(), {expires: 24 * 60 * 60});
                            form.submit();
                        }
                    }
                }
            });

        });
    </script>
</head>
<body>
<div class="path">
    <a href="/admin/common/index.jhtml">首页</a> &raquo; 编辑商品
</div>
<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="300" />
    <ul id="tab" class="tab">
        <li>
            <input type="button" value="基本信息" />
        </li>
        <li>
            <input type="button" value="商品介绍" />
        </li>
        <li>
            <input type="button" value="商品图片" />
        </li>
        <li>
            <input type="button" value="商品参数" />
        </li>
        <li>
            <input type="button" value="商品属性" />
        </li>
        <li>
            <input type="button" value="商品规格" />
        </li>
    </ul>
    <table class="input tabContent">
        <tr>
            <th>
                规格:
            </th>
            <td>
                白色
                M
            </td>
        </tr>
        <tr>
            <th>
                商品分类:
            </th>
            <td>
                <select id="productCategoryId" name="productCategoryId">
                    <option value="1">
                        时尚女装
                    </option>
                    <option value="11" selected="selected">
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
            <td>
                <input type="text" name="name" class="text" value="尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>
                编号:
            </th>
            <td>
                <input type="text" name="sn" class="text" value="201304529" maxlength="100" title="若留空则由系统自动生成" />
            </td>
        </tr>
        <tr>
            <th>
                <span class="requiredField">*</span>销售价:
            </th>
            <td>
                <input type="text" name="price" class="text" value="298" maxlength="16" />
            </td>
        </tr>
        <tr>
            <th>
                会员价:
            </th>
            <td>
                <label>
                    <input type="checkbox" id="isMemberPrice" name="isMemberPrice" value="true" />启用会员价
                </label>
            </td>
        </tr>
        <tr id="memberPriceTr" class="hidden">
            <th>
                &nbsp;
            </th>
            <td>
                贵宾会员: <input type="text" name="memberPrice_5" class="text memberPrice" value="" maxlength="16" style="width: 60px; margin-right: 6px;" disabled="disabled" />
                白金会员: <input type="text" name="memberPrice_4" class="text memberPrice" value="" maxlength="16" style="width: 60px; margin-right: 6px;" disabled="disabled" />
                金牌会员: <input type="text" name="memberPrice_3" class="text memberPrice" value="" maxlength="16" style="width: 60px; margin-right: 6px;" disabled="disabled" />
                银牌会员: <input type="text" name="memberPrice_2" class="text memberPrice" value="" maxlength="16" style="width: 60px; margin-right: 6px;" disabled="disabled" />
                普通会员: <input type="text" name="memberPrice_1" class="text memberPrice" value="" maxlength="16" style="width: 60px; margin-right: 6px;" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <th>
                成本价:
            </th>
            <td>
                <input type="text" name="cost" class="text" value="" maxlength="16" title="前台不会显示，仅供后台使用" />
            </td>
        </tr>
        <tr>
            <th>
                市场价:
            </th>
            <td>
                <input type="text" name="marketPrice" class="text" value="357.6" maxlength="16" title="若留空则由系统自动计算" />
            </td>
        </tr>
        <tr>
            <th>
                展示图片:
            </th>
            <td>
					<span class="fieldSet">
						<input type="text" name="image" class="text" value="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg" maxlength="200" title="应用于首页、宣传页，留空则由系统自动生成" />
						<input type="button" id="browserButton" class="button" value="选择文件" />
							<a href="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg" target="_blank">查看</a>
					</span>
            </td>
        </tr>
        <tr>
            <th>
                单位:
            </th>
            <td>
                <input type="text" name="unit" class="text" maxlength="200" value="件" />
            </td>
        </tr>
        <tr>
            <th>
                重量:
            </th>
            <td>
                <input type="text" name="weight" class="text" value="" maxlength="9" title="单位: 克" />
            </td>
        </tr>
        <tr>
            <th>
                库存:
            </th>
            <td>
                <input type="text" name="stock" class="text" value="" maxlength="9" title="留空表示不计库存" />
            </td>
        </tr>
        <tr>
            <th>
                库存备注:
            </th>
            <td>
                <input type="text" name="stockMemo" class="text" value="" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>
                赠送积分:
            </th>
            <td>
                <input type="text" name="point" class="text" value="298" maxlength="9" title="若留空则由系统自动计算" />
            </td>
        </tr>
        <tr>
            <th>
                品牌:
            </th>
            <td>
                <select name="brandId">
                    <option value="">请选择...</option>
                    <option value="1">
                        梵希蔓
                    </option>
                    <option value="2">
                        伊芙丽
                    </option>
                    <option value="3" selected="selected">
                        尚都比拉
                    </option>
                    <option value="4">
                        森马
                    </option>
                    <option value="5">
                        以纯
                    </option>
                    <option value="6">
                        李宁
                    </option>
                    <option value="7">
                        耐克
                    </option>
                    <option value="8">
                        阿迪达斯
                    </option>
                    <option value="9">
                        Jack Jones
                    </option>
                    <option value="10">
                        七匹狼
                    </option>
                    <option value="11">
                        恒源祥
                    </option>
                    <option value="12">
                        圣得西
                    </option>
                    <option value="13">
                        猫人
                    </option>
                    <option value="14">
                        北极绒
                    </option>
                    <option value="15">
                        美特斯·邦威
                    </option>
                    <option value="16">
                        真维斯
                    </option>
                    <option value="17">
                        唐狮
                    </option>
                </select>
            </td>
        </tr>
        <tr>
            <th>
                标签:
            </th>
            <td>
                <label>
                    <input type="checkbox" name="tagIds" value="1" checked="checked" />热销
                </label>
                <label>
                    <input type="checkbox" name="tagIds" value="2" />最新
                </label>
            </td>
        </tr>
        <tr>
            <th>
                设置:
            </th>
            <td>
                <label>
                    <input type="checkbox" name="isMarketable" value="true" checked="checked" />是否上架
                    <input type="hidden" name="_isMarketable" value="false" />
                </label>
                <label>
                    <input type="checkbox" name="isList" value="true" checked="checked" />是否列出
                    <input type="hidden" name="_isList" value="false" />
                </label>
                <label>
                    <input type="checkbox" name="isTop" value="true" />是否置顶
                    <input type="hidden" name="_isTop" value="false" />
                </label>
                <label>
                    <input type="checkbox" name="isGift" value="true" />是否为赠品
                    <input type="hidden" name="_isGift" value="false" />
                </label>
            </td>
        </tr>
        <tr>
            <th>
                备注:
            </th>
            <td>
                <input type="text" name="memo" class="text" value="" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>
                搜索关键词:
            </th>
            <td>
                <input type="text" name="keyword" class="text" value="" maxlength="200" title="应用于前台商品搜索，多个关键字以(,)分隔" />
            </td>
        </tr>
        <tr>
            <th>
                页面标题:
            </th>
            <td>
                <input type="text" name="seoTitle" class="text" value="" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>
                页面关键词:
            </th>
            <td>
                <input type="text" name="seoKeywords" class="text" value="" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>
                页面描述:
            </th>
            <td>
                <input type="text" name="seoDescription" class="text" value="" maxlength="200" />
            </td>
        </tr>
    </table>
    <table class="input tabContent">
        <tr>
            <td>
                <textarea id="editor" name="introduction" class="editor" style="width: 100%;">&lt;img src=&quot;http://storage.shopxx.net/demo-image/3.0/201301/a8cbb713-9024-458f-861a-5f83db39a431.jpg&quot; /&gt;</textarea>
            </td>
        </tr>
    </table>
    <table id="productImageTable" class="input tabContent">
        <tr>
            <td colspan="4">
                <a href="javascript:;" id="addProductImage" class="button">增加图片</a>
            </td>
        </tr>
        <tr class="title">
            <th>
                文件
            </th>
            <th>
                标题
            </th>
            <th>
                排序
            </th>
            <th>
                删除
            </th>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="productImages[0].source" value="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-source.jpg" />
                <input type="hidden" name="productImages[0].large" value="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-large.jpg" />
                <input type="hidden" name="productImages[0].medium" value="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-medium.jpg" />
                <input type="hidden" name="productImages[0].thumbnail" value="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg" />
                <input type="file" name="productImages[0].file" class="productImageFile ignore" />
                <a href="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-large.jpg" target="_blank">查看</a>
            </td>
            <td>
                <input type="text" name="productImages[0].title" class="text" maxlength="200" value="" />
            </td>
            <td>
                <input type="text" name="productImages[0].order" class="text productImageOrder" value="1" maxlength="9" style="width: 50px;" />
            </td>
            <td>
                <a href="javascript:;" class="deleteProductImage">[删除]</a>
            </td>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="productImages[1].source" value="http://storage.shopxx.net/demo-image/3.0/201301/6d53c211-2325-41ed-8696-d8fbceb1c199-source.jpg" />
                <input type="hidden" name="productImages[1].large" value="http://storage.shopxx.net/demo-image/3.0/201301/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg" />
                <input type="hidden" name="productImages[1].medium" value="http://storage.shopxx.net/demo-image/3.0/201301/6d53c211-2325-41ed-8696-d8fbceb1c199-medium.jpg" />
                <input type="hidden" name="productImages[1].thumbnail" value="http://storage.shopxx.net/demo-image/3.0/201301/6d53c211-2325-41ed-8696-d8fbceb1c199-thumbnail.jpg" />
                <input type="file" name="productImages[1].file" class="productImageFile ignore" />
                <a href="http://storage.shopxx.net/demo-image/3.0/201301/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg" target="_blank">查看</a>
            </td>
            <td>
                <input type="text" name="productImages[1].title" class="text" maxlength="200" value="" />
            </td>
            <td>
                <input type="text" name="productImages[1].order" class="text productImageOrder" value="2" maxlength="9" style="width: 50px;" />
            </td>
            <td>
                <a href="javascript:;" class="deleteProductImage">[删除]</a>
            </td>
        </tr>
    </table>
    <table id="parameterTable" class="input tabContent">
        <tr>
            <td style="text-align: right; padding-right: 10px;">
                <strong>基本参数:</strong>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <th>风格:</th>
            <td>
                <input type="text" name="parameter_1" class="text" value="甜美" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>通勤:</th>
            <td>
                <input type="text" name="parameter_2" class="text" value="日系" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>组合形式:</th>
            <td>
                <input type="text" name="parameter_3" class="text" value="单件" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>裙长:</th>
            <td>
                <input type="text" name="parameter_4" class="text" value="短裙(76-90厘米)" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>款式:</th>
            <td>
                <input type="text" name="parameter_5" class="text" value="其他款式" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>袖长:</th>
            <td>
                <input type="text" name="parameter_6" class="text" value="七分袖" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>领型:</th>
            <td>
                <input type="text" name="parameter_7" class="text" value="娃娃领" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>袖型:</th>
            <td>
                <input type="text" name="parameter_8" class="text" value="泡泡袖" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>腰型:</th>
            <td>
                <input type="text" name="parameter_9" class="text" value="中腰" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>衣门襟:</th>
            <td>
                <input type="text" name="parameter_10" class="text" value="套头" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>裙型:</th>
            <td>
                <input type="text" name="parameter_11" class="text" value="百褶裙" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>图案:</th>
            <td>
                <input type="text" name="parameter_12" class="text" value="纯色" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>流行元素/工艺:</th>
            <td>
                <input type="text" name="parameter_13" class="text" value="蕾丝" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>材质:</th>
            <td>
                <input type="text" name="parameter_14" class="text" value="蕾丝" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>主成份含量:</th>
            <td>
                <input type="text" name="parameter_15" class="text" value="71%-80%" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>主材质:</th>
            <td>
                <input type="text" name="parameter_16" class="text" value="其他面料" maxlength="200" />
            </td>
        </tr>
    </table>
    <table id="attributeTable" class="input tabContent">
        <tr>
            <th>材质:</th>
            <td>
                <select name="attribute_1">
                    <option value="">请选择...</option>
                    <option value="雪纺">雪纺</option>
                    <option value="蕾丝" selected="selected">蕾丝</option>
                    <option value="织锦">织锦</option>
                    <option value="牛仔">牛仔</option>
                    <option value="绸缎">绸缎</option>
                    <option value="乔其纱">乔其纱</option>
                    <option value="双绉">双绉</option>
                    <option value="府绸">府绸</option>
                    <option value="其他">其他</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>裙长:</th>
            <td>
                <select name="attribute_2">
                    <option value="">请选择...</option>
                    <option value="超短裙">超短裙</option>
                    <option value="短裙" selected="selected">短裙</option>
                    <option value="中裙">中裙</option>
                    <option value="中长裙">中长裙</option>
                    <option value="长裙">长裙</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>领型:</th>
            <td>
                <select name="attribute_3">
                    <option value="">请选择...</option>
                    <option value="圆领">圆领</option>
                    <option value="V领">V领</option>
                    <option value="一字领">一字领</option>
                    <option value="翻领">翻领</option>
                    <option value="荷叶领">荷叶领</option>
                    <option value="双层领">双层领</option>
                    <option value="立领">立领</option>
                    <option value="方领">方领</option>
                    <option value="堆堆领">堆堆领</option>
                    <option value="连帽">连帽</option>
                    <option value="娃娃领" selected="selected">娃娃领</option>
                    <option value="西装领">西装领</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>腰型:</th>
            <td>
                <select name="attribute_4">
                    <option value="">请选择...</option>
                    <option value="中腰" selected="selected">中腰</option>
                    <option value="高腰">高腰</option>
                    <option value="宽松腰">宽松腰</option>
                    <option value="松紧腰">松紧腰</option>
                    <option value="低腰">低腰</option>
                </select>
            </td>
        </tr>
    </table>
    <table class="input tabContent">
        <tr class="title">
            <th>
                请选择商品规格:
            </th>
        </tr>
        <tr>
            <td>
                <div id="specificationSelect" class="specificationSelect">
                    <ul>
                        <li>
                            <label>
                                <input type="checkbox" name="specificationIds" value="1" checked="checked" />颜色
                                <span class="gray">[女装]</span>
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="specificationIds" value="2" />颜色
                                <span class="gray">[男装]</span>
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="specificationIds" value="3" checked="checked" />尺码
                                <span class="gray">[女装]</span>
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="specificationIds" value="4" />尺码
                                <span class="gray">[男装]</span>
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="specificationIds" value="5" />尺码
                                <span class="gray">[女鞋]</span>
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="specificationIds" value="6" />尺码
                                <span class="gray">[男鞋]</span>
                            </label>
                        </li>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <a href="javascript:;" id="addSpecificationProduct" class="button">增加规格商品</a>
            </td>
        </tr>
        <tr>
            <td>
                <table id="specificationProductTable" class="input">
                    <tr class="title">
                        <td width="60">
                            &nbsp;
                        </td>
                        <td class="specification_1">
                            颜色
                            <span class="gray">[女装]</span>
                        </td>
                        <td class="specification_2 hidden">
                            颜色
                            <span class="gray">[男装]</span>
                        </td>
                        <td class="specification_3">
                            尺码
                            <span class="gray">[女装]</span>
                        </td>
                        <td class="specification_4 hidden">
                            尺码
                            <span class="gray">[男装]</span>
                        </td>
                        <td class="specification_5 hidden">
                            尺码
                            <span class="gray">[女鞋]</span>
                        </td>
                        <td class="specification_6 hidden">
                            尺码
                            <span class="gray">[男鞋]</span>
                        </td>
                        <td>
                            操作
                        </td>
                    </tr>
                    <tr class="hidden">
                        <td>
                            &nbsp;
                        </td>
                        <td class="specification_1">
                            <select name="specification_1">
                                <option value="1">无</option>
                                <option value="2">黄色</option>
                                <option value="3">酒红色</option>
                                <option value="4">金色</option>
                                <option value="5">橙色</option>
                                <option value="6">灰色</option>
                                <option value="7">蓝色</option>
                                <option value="8">黑色</option>
                                <option value="9">卡其色</option>
                                <option value="10">混色</option>
                                <option value="11">紫色</option>
                                <option value="12">粉红色</option>
                                <option value="13">银色</option>
                                <option value="14">红色</option>
                                <option value="15">白色</option>
                                <option value="16">浅蓝色</option>
                                <option value="17">深蓝色</option>
                                <option value="18">绿色</option>
                                <option value="19">米黄色</option>
                                <option value="20">咖啡色</option>
                            </select>
                        </td>
                        <td class="specification_2 hidden">
                            <select name="specification_2" disabled="disabled">
                                <option value="21">无</option>
                                <option value="22">黄色</option>
                                <option value="23">酒红色</option>
                                <option value="24">金色</option>
                                <option value="25">橙色</option>
                                <option value="26">灰色</option>
                                <option value="27">蓝色</option>
                                <option value="28">黑色</option>
                                <option value="29">卡其色</option>
                                <option value="30">混色</option>
                                <option value="31">紫色</option>
                                <option value="32">粉红色</option>
                                <option value="33">银色</option>
                                <option value="34">红色</option>
                                <option value="35">白色</option>
                                <option value="36">浅蓝色</option>
                                <option value="37">深蓝色</option>
                                <option value="38">绿色</option>
                                <option value="39">米黄色</option>
                                <option value="40">咖啡色</option>
                            </select>
                        </td>
                        <td class="specification_3">
                            <select name="specification_3">
                                <option value="41">均码</option>
                                <option value="42">XXS</option>
                                <option value="43">XS</option>
                                <option value="44">S</option>
                                <option value="45">M</option>
                                <option value="46">L</option>
                                <option value="47">XL</option>
                                <option value="48">XXL</option>
                                <option value="49">XXXL</option>
                            </select>
                        </td>
                        <td class="specification_4 hidden">
                            <select name="specification_4" disabled="disabled">
                                <option value="50">均码</option>
                                <option value="51">XXS</option>
                                <option value="52">XS</option>
                                <option value="53">S</option>
                                <option value="54">M</option>
                                <option value="55">L</option>
                                <option value="56">XL</option>
                                <option value="57">XXL</option>
                                <option value="58">XXXL</option>
                            </select>
                        </td>
                        <td class="specification_5 hidden">
                            <select name="specification_5" disabled="disabled">
                                <option value="59">34</option>
                                <option value="60">35</option>
                                <option value="61">36</option>
                                <option value="62">37</option>
                                <option value="63">38</option>
                                <option value="64">39</option>
                                <option value="65">40</option>
                                <option value="66">41</option>
                            </select>
                        </td>
                        <td class="specification_6 hidden">
                            <select name="specification_6" disabled="disabled">
                                <option value="67">36</option>
                                <option value="68">37</option>
                                <option value="69">38</option>
                                <option value="70">39</option>
                                <option value="71">40</option>
                                <option value="72">41</option>
                                <option value="73">42</option>
                                <option value="74">43</option>
                                <option value="75">44</option>
                                <option value="76">45</option>
                            </select>
                        </td>
                        <td>
                            <a href="javascript:;" class="deleteSpecificationProduct">[删除]</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            当前规格
                            <input type="hidden" name="specificationProductIds" value="300" />
                        </td>
                        <td class="specification_1">
                            <select name="specification_1">
                                <option value="1">无</option>
                                <option value="2">黄色</option>
                                <option value="3">酒红色</option>
                                <option value="4">金色</option>
                                <option value="5">橙色</option>
                                <option value="6">灰色</option>
                                <option value="7">蓝色</option>
                                <option value="8">黑色</option>
                                <option value="9">卡其色</option>
                                <option value="10">混色</option>
                                <option value="11">紫色</option>
                                <option value="12">粉红色</option>
                                <option value="13">银色</option>
                                <option value="14">红色</option>
                                <option value="15" selected="selected">白色</option>
                                <option value="16">浅蓝色</option>
                                <option value="17">深蓝色</option>
                                <option value="18">绿色</option>
                                <option value="19">米黄色</option>
                                <option value="20">咖啡色</option>
                            </select>
                        </td>
                        <td class="specification_2 hidden">
                            <select name="specification_2" disabled="disabled">
                                <option value="21">无</option>
                                <option value="22">黄色</option>
                                <option value="23">酒红色</option>
                                <option value="24">金色</option>
                                <option value="25">橙色</option>
                                <option value="26">灰色</option>
                                <option value="27">蓝色</option>
                                <option value="28">黑色</option>
                                <option value="29">卡其色</option>
                                <option value="30">混色</option>
                                <option value="31">紫色</option>
                                <option value="32">粉红色</option>
                                <option value="33">银色</option>
                                <option value="34">红色</option>
                                <option value="35">白色</option>
                                <option value="36">浅蓝色</option>
                                <option value="37">深蓝色</option>
                                <option value="38">绿色</option>
                                <option value="39">米黄色</option>
                                <option value="40">咖啡色</option>
                            </select>
                        </td>
                        <td class="specification_3">
                            <select name="specification_3">
                                <option value="41">均码</option>
                                <option value="42">XXS</option>
                                <option value="43">XS</option>
                                <option value="44">S</option>
                                <option value="45" selected="selected">M</option>
                                <option value="46">L</option>
                                <option value="47">XL</option>
                                <option value="48">XXL</option>
                                <option value="49">XXXL</option>
                            </select>
                        </td>
                        <td class="specification_4 hidden">
                            <select name="specification_4" disabled="disabled">
                                <option value="50">均码</option>
                                <option value="51">XXS</option>
                                <option value="52">XS</option>
                                <option value="53">S</option>
                                <option value="54">M</option>
                                <option value="55">L</option>
                                <option value="56">XL</option>
                                <option value="57">XXL</option>
                                <option value="58">XXXL</option>
                            </select>
                        </td>
                        <td class="specification_5 hidden">
                            <select name="specification_5" disabled="disabled">
                                <option value="59">34</option>
                                <option value="60">35</option>
                                <option value="61">36</option>
                                <option value="62">37</option>
                                <option value="63">38</option>
                                <option value="64">39</option>
                                <option value="65">40</option>
                                <option value="66">41</option>
                            </select>
                        </td>
                        <td class="specification_6 hidden">
                            <select name="specification_6" disabled="disabled">
                                <option value="67">36</option>
                                <option value="68">37</option>
                                <option value="69">38</option>
                                <option value="70">39</option>
                                <option value="71">40</option>
                                <option value="72">41</option>
                                <option value="73">42</option>
                                <option value="74">43</option>
                                <option value="75">44</option>
                                <option value="76">45</option>
                            </select>
                        </td>
                        <td>
                            -
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                            <input type="hidden" name="specificationProductIds" value="299" />
                        </td>
                        <td class="specification_1">
                            <select name="specification_1">
                                <option value="1">无</option>
                                <option value="2">黄色</option>
                                <option value="3">酒红色</option>
                                <option value="4">金色</option>
                                <option value="5">橙色</option>
                                <option value="6">灰色</option>
                                <option value="7">蓝色</option>
                                <option value="8">黑色</option>
                                <option value="9">卡其色</option>
                                <option value="10">混色</option>
                                <option value="11">紫色</option>
                                <option value="12">粉红色</option>
                                <option value="13">银色</option>
                                <option value="14">红色</option>
                                <option value="15" selected="selected">白色</option>
                                <option value="16">浅蓝色</option>
                                <option value="17">深蓝色</option>
                                <option value="18">绿色</option>
                                <option value="19">米黄色</option>
                                <option value="20">咖啡色</option>
                            </select>
                        </td>
                        <td class="specification_2 hidden">
                            <select name="specification_2" disabled="disabled">
                                <option value="21">无</option>
                                <option value="22">黄色</option>
                                <option value="23">酒红色</option>
                                <option value="24">金色</option>
                                <option value="25">橙色</option>
                                <option value="26">灰色</option>
                                <option value="27">蓝色</option>
                                <option value="28">黑色</option>
                                <option value="29">卡其色</option>
                                <option value="30">混色</option>
                                <option value="31">紫色</option>
                                <option value="32">粉红色</option>
                                <option value="33">银色</option>
                                <option value="34">红色</option>
                                <option value="35">白色</option>
                                <option value="36">浅蓝色</option>
                                <option value="37">深蓝色</option>
                                <option value="38">绿色</option>
                                <option value="39">米黄色</option>
                                <option value="40">咖啡色</option>
                            </select>
                        </td>
                        <td class="specification_3">
                            <select name="specification_3">
                                <option value="41">均码</option>
                                <option value="42">XXS</option>
                                <option value="43">XS</option>
                                <option value="44">S</option>
                                <option value="45">M</option>
                                <option value="46" selected="selected">L</option>
                                <option value="47">XL</option>
                                <option value="48">XXL</option>
                                <option value="49">XXXL</option>
                            </select>
                        </td>
                        <td class="specification_4 hidden">
                            <select name="specification_4" disabled="disabled">
                                <option value="50">均码</option>
                                <option value="51">XXS</option>
                                <option value="52">XS</option>
                                <option value="53">S</option>
                                <option value="54">M</option>
                                <option value="55">L</option>
                                <option value="56">XL</option>
                                <option value="57">XXL</option>
                                <option value="58">XXXL</option>
                            </select>
                        </td>
                        <td class="specification_5 hidden">
                            <select name="specification_5" disabled="disabled">
                                <option value="59">34</option>
                                <option value="60">35</option>
                                <option value="61">36</option>
                                <option value="62">37</option>
                                <option value="63">38</option>
                                <option value="64">39</option>
                                <option value="65">40</option>
                                <option value="66">41</option>
                            </select>
                        </td>
                        <td class="specification_6 hidden">
                            <select name="specification_6" disabled="disabled">
                                <option value="67">36</option>
                                <option value="68">37</option>
                                <option value="69">38</option>
                                <option value="70">39</option>
                                <option value="71">40</option>
                                <option value="72">41</option>
                                <option value="73">42</option>
                                <option value="74">43</option>
                                <option value="75">44</option>
                                <option value="76">45</option>
                            </select>
                        </td>
                        <td>
                            <a href="javascript:;" class="deleteSpecificationProduct">[删除]</a>
                            <a href="edit.jhtml?id=299">[编辑]</a>
                        </td>
                    </tr>
                </table>
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
                <input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='productController/productList.jhtml'" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>

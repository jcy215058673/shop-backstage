<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/13
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款 - Powered By SHOP++</title>
    <meta name="author" content="SHOP++ Team" />
    <meta name="copyright" content="SHOP++" />
    <meta name="keywords" content="尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款" />
    <meta name="description" content="尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款" />
    <link href="/shop/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/shop/css/product.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/shop/js/jquery.js"></script>
    <script type="text/javascript" src="/shop/js/jquery.tools.js"></script>
    <script type="text/javascript" src="/shop/js/jquery.jqzoom.js"></script>
    <script type="text/javascript" src="/shop/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/shop/js/common.js"></script>
    <script type="text/javascript">
        $().ready(function() {

            var $historyProduct = $("#historyProduct ul");
            var $clearHistoryProduct = $("#clearHistoryProduct");
            var $zoom = $("#zoom");
            var $scrollable = $("#scrollable");
            var $thumbnail = $("#scrollable a");
            var $specification = $("#specification dl");
            var $specificationTitle = $("#specification div");
            var $specificationValue = $("#specification a");
            var $productNotifyForm = $("#productNotifyForm");
            var $productNotify = $("#productNotify");
            var $productNotifyEmail = $("#productNotify input");
            var $addProductNotify = $("#addProductNotify");
            var $quantity = $("#quantity");
            var $increase = $("#increase");
            var $decrease = $("#decrease");
            var $addCart = $("#addCart");
            var $addFavorite = $("#addFavorite");
            var $window = $(window);
            var $bar = $("#bar ul");
            var $introductionTab = $("#introductionTab");
            var $parameterTab = $("#parameterTab");
            var $reviewTab = $("#reviewTab");
            var $consultationTab = $("#consultationTab");
            var $introduction = $("#introduction");
            var $parameter = $("#parameter");
            var $review = $("#review");
            var $addReview = $("#addReview");
            var $consultation = $("#consultation");
            var $addConsultation = $("#addConsultation");
            var barTop = $bar.offset().top;
            var productMap = {};
            productMap[300] = { path: null, specificationValues: [ "15", "45" ] }; productMap[299] = { path: "/product/content/201804/299.html", specificationValues: [ "15", "46" ] };
            // 锁定规格值
            lockSpecificationValue();

            // 商品图片放大镜
            $zoom.jqzoom({
                zoomWidth: 368,
                zoomHeight: 368,
                title: false,
                showPreload: false,
                preloadImages: false
            });

            // 商品缩略图滚动
            $scrollable.scrollable();

            $thumbnail.hover(function() {
                var $this = $(this);
                if ($this.hasClass("current")) {
                    return false;
                } else {
                    $thumbnail.removeClass("current");
                    $this.addClass("current").click();
                }
            });

            // 规格值选择
            $specificationValue.click(function() {
                var $this = $(this);
                if ($this.hasClass("locked")) {
                    return false;
                }
                $this.toggleClass("selected").parent().siblings().children("a").removeClass("selected");
                var selectedIds = new Array();
                $specificationValue.filter(".selected").each(function(i) {
                    selectedIds[i] = $(this).attr("val");
                });
                var locked = true;
                $.each(productMap, function(i, product) {
                    if (product.specificationValues.length == selectedIds.length && contains(product.specificationValues, selectedIds)) {
                        if (product.path != null) {
                            location.href = "/shopxx" + product.path;
                            locked = false;
                        }
                        return false;
                    }
                });
                if (locked) {
                    lockSpecificationValue();
                }
                $specificationTitle.hide();
                return false;
            });

            // 锁定规格值
            function lockSpecificationValue() {
                var selectedIds = new Array();
                $specificationValue.filter(".selected").each(function(i) {
                    selectedIds[i] = $(this).attr("val");
                });
                $specification.each(function() {
                    var $this = $(this);
                    var selectedId = $this.find("a.selected").attr("val");
                    var otherIds = $.grep(selectedIds, function(n, i) {
                        return n != selectedId;
                    });
                    $this.find("a").each(function() {
                        var $this = $(this);
                        otherIds.push($this.attr("val"));
                        var locked = true;
                        $.each(productMap, function(i, product) {
                            if (contains(product.specificationValues, otherIds)) {
                                locked = false;
                                return false;
                            }
                        });
                        if (locked) {
                            $this.addClass("locked");
                        } else {
                            $this.removeClass("locked");
                        }
                        otherIds.pop();
                    });
                });
            }

            // 判断是否包含
            function contains(array, values) {
                var contains = true;
                for(i in values) {
                    if ($.inArray(values[i], array) < 0) {
                        contains = false;
                        break;
                    }
                }
                return contains;
            }

            // 到货通知
            $addProductNotify.click(function() {
                var specificationValueIds = new Array();
                $specificationValue.filter(".selected").each(function(i) {
                    specificationValueIds[i] = $(this).attr("val");
                });
                if (specificationValueIds.length != 2) {
                    $specificationTitle.show();
                    return false;
                }
                if ($addProductNotify.val() == "到货通知我") {
                    $addProductNotify.val("确定登记");
                    $productNotify.show();
                    $productNotifyEmail.focus();
                    if ($.trim($productNotifyEmail.val()) == "") {
                        $.ajax({
                            url: "",
                            type: "GET",
                            dataType: "json",
                            cache: false,
                            success: function(data) {
                                $productNotifyEmail.val(data.email);
                            }
                        });
                    }
                } else {
                    $productNotifyForm.submit();
                }
                return false;
            });

            // 到货通知表单验证
            $productNotifyForm.validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    }
                },
                submitHandler: function(form) {
                    $.ajax({
                        url: "/shopxx/product_notify/save.jhtml",
                        type: "POST",
                        data: {productId: 300, email: $productNotifyEmail.val()},
                        dataType: "json",
                        cache: false,
                        beforeSend: function() {
                            $addProductNotify.prop("disabled", true);
                        },
                        success: function(data) {
                            if (data.message.type == "success") {
                                $addProductNotify.val("到货通知我");
                                $productNotify.hide();
                            }
                            $.message(data.message);
                        },
                        complete: function() {
                            $addProductNotify.prop("disabled", false);
                        }
                    });
                }
            });

            // 购买数量
            $quantity.keypress(function(event) {
                var key = event.keyCode ? event.keyCode : event.which;
                if ((key >= 48 && key <= 57) || key==8) {
                    return true;
                } else {
                    return false;
                }
            });

            // 增加购买数量
            $increase.click(function() {
                var quantity = $quantity.val();
                if (/^\d*[1-9]\d*$/.test(quantity)) {
                    $quantity.val(parseInt(quantity) + 1);
                } else {
                    $quantity.val(1);
                }
            });

            // 减少购买数量
            $decrease.click(function() {
                var quantity = $quantity.val();
                if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 1) {
                    $quantity.val(parseInt(quantity) - 1);
                } else {
                    $quantity.val(1);
                }
            });

            // 加入购物车
            $addCart.click(function() {
                var specificationValueIds = new Array();
                $specificationValue.filter(".selected").each(function(i) {
                    specificationValueIds[i] = $(this).attr("val");
                });
                if (specificationValueIds.length != 2) {
                    $specificationTitle.show();
                    return false;
                }
                var quantity = $quantity.val();
                if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
                    $.ajax({
                        url: "",
                        type: "POST",
                        data: {id: 300, quantity: quantity},
                        dataType: "json",
                        cache: false,
                        success: function(message) {
                            $.message(message);
                        }
                    });
                } else {
                    $.message("warn", "购买数量必须为正整数");
                }
            });

            // 添加商品收藏
            $addFavorite.click(function() {
                $.ajax({
                    url: "/shopxx/member/favorite/add.jhtml?id=300",
                    type: "POST",
                    dataType: "json",
                    cache: false,
                    success: function(message) {
                        $.message(message);
                    }
                });
                return false;
            });

            $window.scroll(function() {
                var scrollTop = $(this).scrollTop();
                if (scrollTop > barTop) {
                    if (window.XMLHttpRequest) {
                        $bar.css({position: "fixed", top: 0});
                    } else {
                        $bar.css({top: scrollTop});
                    }
                    var introductionTop = $introduction.size() > 0 ? $introduction.offset().top - 36 : null;
                    var parameterTop = $parameter.size() > 0 ? $parameter.offset().top - 36 : null;
                    var reviewTop = $review.size() > 0 ? $review.offset().top - 36 : null;
                    var consultationTop = $consultation.size() > 0 ? $consultation.offset().top - 36 : null;
                    if (consultationTop != null && scrollTop >= consultationTop) {
                        $bar.find("li").removeClass("current");
                        $consultationTab.addClass("current");
                    } else if (reviewTop != null && scrollTop >= reviewTop) {
                        $bar.find("li").removeClass("current");
                        $reviewTab.addClass("current");
                    } else if (parameterTop != null && scrollTop >= parameterTop) {
                        $bar.find("li").removeClass("current");
                        $parameterTab.addClass("current");
                    } else if (introductionTop != null && scrollTop >= introductionTop) {
                        $bar.find("li").removeClass("current");
                        $introductionTab.addClass("current");
                    }
                } else {
                    $bar.find("li").removeClass("current");
                    $bar.css({position: "absolute", top: barTop});
                }
            });

            // 发表商品评论
            $addReview.click(function() {
                if ($.checkLogin()) {
                    return true;
                } else {
                    $.redirectLogin("/shopxx/review/add/300.jhtml", "必须登录后才能发表商品评论");
                    return false;
                }
            });

            // 发表商品咨询
            $addConsultation.click(function() {
                if ($.checkLogin()) {
                    return true;
                } else {
                    $.redirectLogin("/shopxx/consultation/add/300.jhtml", "必须登录后才能发表商品咨询");
                    return false;
                }
            });

            // 浏览记录
            var historyProduct = getCookie("historyProduct");
            var historyProductIds = historyProduct != null ? historyProduct.split(",") : new Array();
            for (var i = 0; i < historyProductIds.length; i ++) {
                if (historyProductIds[i] == "300") {
                    historyProductIds.splice(i, 1);
                    break;
                }
            }
            historyProductIds.unshift("300");
            if (historyProductIds.length > 6) {
                historyProductIds.pop();
            }
            addCookie("historyProduct", historyProductIds.join(","), {path: "/shopxx/"});
            $.ajax({
                url: "/shopxx/product/history.jhtml",
                type: "GET",
                data: {ids: historyProductIds},
                dataType: "json",
                traditional: true,
                cache: false,
                success: function(data) {
                    $.each(data, function (index, product) {
                        var thumbnail = product.thumbnail != null ? product.thumbnail : "/shopxx/upload/image/default_thumbnail.jpg";
                        $historyProduct.append('<li><img src="' + thumbnail + '" \/><a href="/shopxx' + product.path + '">' + product.name + '<\/a><span>' + currency(product.price, true) + '<\/span><\/li>');
                    });
                }
            });

            // 清空浏览记录
            $clearHistoryProduct.click(function() {
                $historyProduct.empty();
                $(this).text("暂无记录");
                removeCookie("historyProduct", {path: "/shopxx/"});
            });

            // 点击数
            $.ajax({
                url: "/shopxx/product/hits/300.jhtml",
                type: "GET"
            });

        });
    </script>
</head>
<body>
    <script type="text/javascript">
        $().ready(function() {

            var $headerLogin = $("#headerLogin");
            var $headerRegister = $("#headerRegister");
            var $headerUsername = $("#headerUsername");
            var $headerLogout = $("#headerLogout");
            var $productSearchForm = $("#productSearchForm");
            var $keyword = $("#productSearchForm input");
            var defaultKeyword = "商品搜索";

            var username = getCookie("username");
            if (username != null) {
                $headerUsername.text("您好, " + username).show();
                $headerLogout.show();
            } else {
                $headerLogin.show();
                $headerRegister.show();
            }

            $keyword.focus(function() {
                if ($keyword.val() == defaultKeyword) {
                    $keyword.val("");
                }
            });

            $keyword.blur(function() {
                if ($keyword.val() == "") {
                    $keyword.val(defaultKeyword);
                }
            });

            $productSearchForm.submit(function() {
                if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
                    return false;
                }
            });

        });
    </script>
    <div class="container header">
        <div class="span5">
            <div class="logo">
                <a href="/shopxx/">
                    <img src="/images/1.jpg" alt="SHOP++商城" />
                </a>
            </div>
        </div>
        <div class="span9">
            <div class="headerAd">
                <img src="/images/6.jpg" width="320" height="50" alt="正品保障" title="正品保障" />
            </div>	</div>
        <div class="span10 last">
            <div class="topNav clearfix">
                <ul>
                    <li id="headerLogin" class="headerLogin">
                        <a href="/shopxx/login.jhtml">登录</a>|
                    </li>
                    <li id="headerRegister" class="headerRegister">
                        <a href="/shopxx/register.jhtml">注册</a>|
                    </li>
                    <li id="headerUsername" class="headerUsername"></li>
                    <li id="headerLogout" class="headerLogout">
                        <a href="">[退出]</a>|
                    </li>
                    <li>
                        <a href="">会员中心</a>
                        |
                    </li>
                    <li>
                        <a href="">购物指南</a>
                        |
                    </li>
                    <li>
                        <a href="">关于我们</a>

                    </li>
                </ul>
            </div>
            <div class="cart">
                <a href="">购物车</a>
            </div>
            <div class="phone">
                客服热线:
                <strong>400-8888888</strong>
            </div>
        </div>
        <div class="span24">
            <ul class="mainNav">
                <li>
                    <a href="/shopxx/">首页</a>
                    |
                </li>
                <li>
                    <a href="">时尚女装</a>
                    |
                </li>
                <li>
                    <a href="">精品男装</a>
                    |
                </li>
                <li>
                    <a href="">精致内衣</a>
                    |
                </li>
                <li>
                    <a href="">服饰配件</a>
                    |
                </li>
                <li>
                    <a href="">时尚女鞋</a>
                    |
                </li>
                <li>
                    <a href="">流行男鞋</a>
                    |
                </li>
                <li>
                    <a href="">童装童鞋</a>

                </li>
            </ul>
        </div>
        <div class="span24">
            <div class="tagWrap">
                <ul class="tag">
                    <li class="icon" style="background: url(http://storage.shopxx.net/demo-image/3.0/tag/hot.gif) right no-repeat;">
                        <a href="">热销</a>
                    </li>
                    <li class="icon" style="background: url(http://storage.shopxx.net/demo-image/3.0/tag/new.gif) right no-repeat;">
                        <a href="">最新</a>
                    </li>
                </ul>
                <div class="hotSearch">
                    热门搜索:
                    <a href="">T恤</a>
                    <a href="">衬衫</a>
                    <a href="">西服</a>
                    <a href="">西裤</a>
                    <a href="">森马</a>
                    <a href="">七匹狼</a>
                    <a href="">梵希蔓</a>
                    <a href="">春夏新款</a>
                    <a href="">牛仔裤</a>
                </div>
                <div class="search">
                    <form id="productSearchForm" action="" method="get">
                        <input name="keyword" class="keyword" value="商品搜索" maxlength="30" />
                        <button type="submit">搜索</button>
                    </form>
                </div>
            </div>
        </div>
    </div>	<div class="container productContent">
        <div class="span6">
            <div class="hotProductCategory">
                <dl>
                    <dt>
                        <a href="">时尚女装</a>
                    </dt>
                    <dd>
                        <a href="">连衣裙</a>
                    </dd>
                    <dd>
                        <a href="">针织衫</a>
                    </dd>
                    <dd>
                        <a href="">短外套</a>
                    </dd>
                    <dd>
                        <a href="">小西装</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <a href="">精品男装</a>
                    </dt>
                    <dd>
                        <a href="">针织衫</a>
                    </dd>
                    <dd>
                        <a href="">POLO衫</a>
                    </dd>
                    <dd>
                        <a href="">休闲裤</a>
                    </dd>
                    <dd>
                        <a href="">牛仔裤</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <a href="">精致内衣</a>
                    </dt>
                    <dd>
                        <a href="">女式内裤</a>
                    </dd>
                    <dd>
                        <a href="">男式内裤</a>
                    </dd>
                    <dd>
                        <a href="">保暖内衣</a>
                    </dd>
                    <dd>
                        <a href="">塑身衣</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <a href="">服饰配件</a>
                    </dt>
                    <dd>
                        <a href="">女士腰带</a>
                    </dd>
                    <dd>
                        <a href="">男士皮带</a>
                    </dd>
                    <dd>
                        <a href="">女士围巾</a>
                    </dd>
                    <dd>
                        <a href="">男士围巾</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <a href="">时尚女鞋</a>
                    </dt>
                    <dd>
                        <a href="">高帮鞋</a>
                    </dd>
                    <dd>
                        <a href="">雪地靴</a>
                    </dd>
                    <dd>
                        <a href="">中筒靴</a>
                    </dd>
                    <dd>
                        <a href="">单鞋</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <a href="">流行男鞋</a>
                    </dt>
                    <dd>
                        <a href="">低帮鞋</a>
                    </dd>
                    <dd>
                        <a href="">高帮鞋</a>
                    </dd>
                    <dd>
                        <a href="">休闲鞋</a>
                    </dd>
                    <dd>
                        <a href="">正装鞋</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <a href="">潮流女包</a>
                    </dt>
                    <dd>
                        <a href="">单肩包</a>
                    </dd>
                    <dd>
                        <a href="">双肩包</a>
                    </dd>
                    <dd>
                        <a href="">手提包</a>
                    </dd>
                    <dd>
                        <a href="">手拿包</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <a href="">精品男包</a>
                    </dt>
                    <dd>
                        <a href="">单肩男</a>
                    </dd>
                    <dd>
                        <a href="">双肩包</a>
                    </dd>
                    <dd>
                        <a href="">手提包</a>
                    </dd>
                    <dd>
                        <a href="">手拿包</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <a href="">童装童鞋</a>
                    </dt>
                    <dd>
                        <a href="">运动鞋</a>
                    </dd>
                    <dd>
                        <a href="">牛仔裤</a>
                    </dd>
                    <dd>
                        <a href="">套装</a>
                    </dd>
                    <dd>
                        <a href="">裤子</a>
                    </dd>
                </dl>
                <dl class="last">
                    <dt>
                        <a href="">时尚饰品</a>
                    </dt>
                    <dd>
                        <a href="">项链</a>
                    </dd>
                    <dd>
                        <a href="">手链</a>
                    </dd>
                    <dd>
                        <a href="">戒指</a>
                    </dd>
                    <dd>
                        <a href="">耳饰</a>
                    </dd>
                </dl>
            </div>
            <div class="hotProduct">
                <div class="title">热销商品</div>
                <ul>
                    <li>
                        <a href="/product/content/201804/300.html" title="尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款">尚都比拉女装2013夏装新款蕾丝连</a>
                        <div>销售价: <strong>￥298.00元</strong></div>
                        <div>月销量: <em>0</em></div>
                    </li>
                    <li>
                        <a href="" title="尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙">尚都比拉2013夏装新款淑女装 春款</a>
                        <div>
                            <div>评分: </div>
                            <div class="score8"></div>
                            <div>4.0</div>
                        </div>
                        <div>销售价: <strong>￥289.00元</strong></div>
                        <div>月销量: <em>0</em></div>
                    </li>
                    <li>
                        <a href="" title="尚都比拉2013夏装新款女装 韩版淑女装 蕾丝雪纺连衣裙 春款短袖">尚都比拉2013夏装新款女装 韩版淑</a>
                        <div>
                            <div>评分: </div>
                            <div class="score10"></div>
                            <div>5.0</div>
                        </div>
                        <div>销售价: <strong>￥259.00元</strong></div>
                        <div>月销量: <em>0</em></div>
                    </li>
                    <li>
                        <a href="" title="尚都比拉2013夏装新款 韩版优雅甜美淑女装 春款蕾丝雪纺连衣裙子">尚都比拉2013夏装新款 韩版优雅甜</a>
                        <div>
                            <div>评分: </div>
                            <div class="score10"></div>
                            <div>5.0</div>
                        </div>
                        <div>销售价: <strong>￥299.00元</strong></div>
                        <div>月销量: <em>0</em></div>
                    </li>
                    <li>
                        <a href="" title="尚都比拉2013夏装新款 韩版优雅淑女装 七分袖蕾丝雪纺连衣裙春款">尚都比拉2013夏装新款 韩版优雅淑</a>
                        <div>
                            <div>评分: </div>
                            <div class="score10"></div>
                            <div>5.0</div>
                        </div>
                        <div>销售价: <strong>￥339.00元</strong></div>
                        <div>月销量: <em>0</em></div>
                    </li>
                    <li class="last">
                        <a href="/product/content/201804/285.html" title="尚都比拉2013夏装新款 春款修身淑女装 雪纺短袖假两件套连衣裙子">尚都比拉2013夏装新款 春款修身淑</a>
                        <div>
                            <div>评分: </div>
                            <div class="score10"></div>
                            <div>5.0</div>
                        </div>
                        <div>销售价: <strong>￥269.00元</strong></div>
                        <div>月销量: <em>0</em></div>
                    </li>
                </ul>
            </div>
            <div id="historyProduct" class="historyProduct">
                <div class="title">最近浏览过的</div>
                <ul></ul>
                <a href="javascript:;" id="clearHistoryProduct" class="clearHistoryProduct">清除历史记录</a>
            </div>
        </div>
        <div class="span18 last">
            <div class="path">
                <ul>
                    <li>
                        <a href="/shopxx/">首页</a>
                    </li>
                    <li>
                        <a href="">时尚女装</a>
                    </li>
                    <li>
                        <a href="">连衣裙</a>
                    </li>
                </ul>
            </div>
            <div class="productImage">
                <a id="zoom" href="/images/3.jpg" rel="gallery">
                    <img class="medium" src="/images/4.jpg" />
                </a>
                <a href="javascript:;" class="prev"></a>
                <div id="scrollable" class="scrollable">
                    <div class="items">
                        <a class="current" href="javascript:;" rel="{gallery: 'gallery', smallimage: '/images/5.jpg', largeimage: '/images/7.jpg'}"><img src="/images/8.jpg" title="" /></a>
                        <a href="javascript:;" rel="{gallery: 'gallery', smallimage: '/images/10.jpg', largeimage: '/images/9.jpg'}"><img src="/images/11.jpg" title="" /></a>
                    </div>
                </div>
                <a href="javascript:;" class="next"></a>
            </div>
            <div class="name">尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款</div>
            <div class="sn">
                <div>编号: 201304529</div>
            </div>
            <div class="info">
                <dl>
                    <dt>销售价:</dt>
                    <dd>
                        <strong>￥298.00</strong>
                        市场价:
                        <del>￥357.60</del>
                    </dd>
                </dl>
                <dl>
                    <dt>赠送积分:</dt>
                    <dd>
                        <span>298</span>
                    </dd>
                </dl>
            </div>
            <div class="action">
                <div id="specification" class="specification clearfix">
                    <div class="title">请选择商品规格</div>
                    <dl>
                        <dt>
                            <span title="颜色">颜色:</span>
                        </dt>
                        <dd>
                            <a href="javascript:;" class="image selected" val="15"><img src="/images/8.jpg" alt="白色" title="白色" /><span title="点击取消选择">&nbsp;</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <span title="尺码">尺码:</span>
                        </dt>
                        <dd>
                            <a href="javascript:;" class="text selected" val="45">M<span title="点击取消选择">&nbsp;</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="text" val="46">L<span title="点击取消选择">&nbsp;</span></a>
                        </dd>
                    </dl>
                </div>
                <dl class="quantity">
                    <dt>购买数量:</dt>
                    <dd>
                        <input type="text" id="quantity" name="quantity" value="1" maxlength="4" onpaste="return false;" />
                        <div>
                            <span id="increase" class="increase">&nbsp;</span>
                            <span id="decrease" class="decrease">&nbsp;</span>
                        </div>
                    </dd>
                    <dd>
                        件
                    </dd>
                </dl>
                <div class="buy">
                    <input type="button" id="addCart" class="addCart" value="加入购物车" />
                    <a href="javascript:;" id="addFavorite">收藏商品</a>
                </div>
            </div>
            <div id="bar" class="bar">
                <ul>
                    <li id="introductionTab">
                        <a href="#introduction">商品介绍</a>
                    </li>
                    <li id="parameterTab">
                        <a href="#parameter">商品参数</a>
                    </li>
                    <li id="reviewTab">
                        <a href="#review">商品评论</a>
                    </li>
                    <li id="consultationTab">
                        <a href="#consultation">商品咨询</a>
                    </li>
                </ul>
            </div>
            <table class="brief">
                <tr>
                    <th>主材质</th>
                    <td>
                        <span title="其他面料">其他面料</span>
                    </td>
                    <th>主成份含量</th>
                    <td>
                        <span title="71%-80%">71%-80%</span>
                    </td>
                    <th>材质</th>
                    <td>
                        <span title="蕾丝">蕾丝</span>
                    </td>
                </tr>
                <tr>
                    <th>流行元素/工艺</th>
                    <td>
                        <span title="蕾丝">蕾丝</span>
                    </td>
                    <th>图案</th>
                    <td>
                        <span title="纯色">纯色</span>
                    </td>
                    <th>裙型</th>
                    <td>
                        <span title="百褶裙">百褶裙</span>
                    </td>
                </tr>
            </table>
            <div id="introduction" name="introduction" class="introduction">
                <div class="title">
                    <strong>商品介绍</strong>
                </div>
                <div>
                    <img src=".jpg" />
                </div>
            </div>
            <div id="parameter" name="parameter" class="parameter">
                <div class="title">
                    <strong>商品参数</strong>
                </div>
                <table>
                    <tr>
                        <th class="group" colspan="2">基本参数</th>
                    </tr>
                    <tr>
                        <th>风格</th>
                        <td>甜美</td>
                    </tr>
                    <tr>
                        <th>通勤</th>
                        <td>日系</td>
                    </tr>
                    <tr>
                        <th>组合形式</th>
                        <td>单件</td>
                    </tr>
                    <tr>
                        <th>裙长</th>
                        <td>短裙(76-90厘米)</td>
                    </tr>
                    <tr>
                        <th>款式</th>
                        <td>其他款式</td>
                    </tr>
                    <tr>
                        <th>袖长</th>
                        <td>七分袖</td>
                    </tr>
                    <tr>
                        <th>领型</th>
                        <td>娃娃领</td>
                    </tr>
                    <tr>
                        <th>袖型</th>
                        <td>泡泡袖</td>
                    </tr>
                    <tr>
                        <th>腰型</th>
                        <td>中腰</td>
                    </tr>
                    <tr>
                        <th>衣门襟</th>
                        <td>套头</td>
                    </tr>
                    <tr>
                        <th>裙型</th>
                        <td>百褶裙</td>
                    </tr>
                    <tr>
                        <th>图案</th>
                        <td>纯色</td>
                    </tr>
                    <tr>
                        <th>流行元素/工艺</th>
                        <td>蕾丝</td>
                    </tr>
                    <tr>
                        <th>材质</th>
                        <td>蕾丝</td>
                    </tr>
                    <tr>
                        <th>主成份含量</th>
                        <td>71%-80%</td>
                    </tr>
                    <tr>
                        <th>主材质</th>
                        <td>其他面料</td>
                    </tr>
                </table>
            </div>
            <div id="review" name="review" class="review">
                <div class="title">商品评论</div>
                <div class="content clearfix">
                    <p>
                        暂无商品评论信息 <a href="" id="addReview">[发表商品评论]</a>
                    </p>
                </div>
            </div>
            <div id="consultation" name="consultation" class="consultation">
                <div class="title">商品咨询</div>
                <div class="content">
                    <p>
                        暂无商品咨询信息 <a href="" id="addConsultation">[发表商品咨询]</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container footer">
        <div class="span24">
            <div class="footerAd">
                <img src="" width="950" height="52" alt="我们的优势" title="我们的优势" />
            </div>	</div>
        <div class="span24">
            <ul class="bottomNav">
                <li>
                    <a href="#">关于我们</a>
                    |
                </li>
                <li>
                    <a href="#">联系我们</a>
                    |
                </li>
                <li>
                    <a href="#">诚聘英才</a>
                    |
                </li>
                <li>
                    <a href="#">法律声明</a>
                    |
                </li>
                <li>
                    <a href="">友情链接</a>
                    |
                </li>
                <li>
                    <a href="" target="_blank">支付方式</a>
                    |
                </li>
                <li>
                    <a href="" target="_blank">配送方式</a>
                    |
                </li>
                <li>
                    <a href="http://www.shopxx.net">SHOP++官网</a>
                    |
                </li>
                <li>
                    <a href="http://bbs.shopxx.net">SHOP++论坛</a>

                </li>
            </ul>
        </div>
        <div class="span24">
            <div class="copyright">Copyright © 2005-2013 SHOP++商城 版权所有</div>
        </div>
    </div>
</body>
</html>

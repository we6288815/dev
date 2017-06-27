<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<title>网上商城</title>
	<link rel="stylesheet" type="text/css" href="css/index_banner.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/beAlert.css">
	<link rel="stylesheet" type="text/css" href="css/public.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.banner.revolution.min.js"></script>
	<script type="text/javascript" src="js/banner.js"></script>
	<script type="text/javascript" src="js/beAlert.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div id="div_body">
		<div id="div_top">
			<div id="div_top_logo">
				<img id="img_logo" src="image/logo.png">
			</div>
			<form action="search" method="get">
				<div id="div_search">
					<select id="select_search" name = "type">
						<option value="1">用户</option>
						<option value="2">商品</option>
						<option value="3">商家</option>
					</select>
					<input id="input_search" type="text" name="keyWord" maxlength="15" placeholder="搜索用户、商品、商家">
					<input id="bt_search" type="submit" value="搜索" onclick="doSearch()">
				</div>
			</form>
			<div id="div_top_user">
				<div id="div_user_operate">
					<img id="portrait" alt="portrait" src="image/default-head.png" />
					<c:if test="${sessionScope.user.userType != 3}">
						<a href="shop/sellerCenter">卖家中心</a>
					</c:if>
					&nbsp;
                    <a href="user/buyerCenter">买家中心</a>
					<c:choose>
						<c:when test="${sessionScope.user!=null}">
							<label>你好，<a href="user/info">${sessionScope.user.userName}</a></label>
							<a href="javascript:logout();">退出</a>
						</c:when>
						<c:when test="${sessionScope.user==null}">
							<div id="div_top_user_operate">
								<label>你好，请</label> <a id="user_info_login" href="user/login">登录</a> <a id="user_info_reg" href="user/reg">注册</a>
							</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>

		<div id="div_middle">
			<div id="wrapper">
				<div class="fullwidthbanner-container">
					<div class="fullwidthbanner">
						<ul>
							<li data-transition="3dcurtain-horizontal" data-slotamount="15" data-masterspeed="300"><img src="image/slides/slide3.jpg" alt="" /></li>
							<li data-transition="3dcurtain-vertical" data-slotamount="15" data-masterspeed="300" data-link="#"><img src="image/slides/slide5.jpg" alt="" /></li>
							<li data-transition="papercut" data-slotamount="15" data-masterspeed="300" data-link="#"><img src="image/slides/slide2.jpg" alt="" /></li>
							<li data-transition="turnoff" data-slotamount="15" data-masterspeed="300"><img src="image/slides/slide1.jpg" alt="" /></li>
							<li data-transition="flyin" data-slotamount="15" data-masterspeed="300"><img src="image/slides/slide6.jpg" alt="" /></li>
						</ul>
					</div>
				</div>
				<div id="div_middle_catalog">
					<div id="div_middle_catalog_man" class="div_catalog">
						<img class="div_middle_catalog_img" alt="男装" src="image/catalog/man.jpg">
						<p class="catalog_name">男装</p>
						<hr class="catalog_separator">
						<ul>
							<li><a href="goods/list?type=1" target="_blank">上衣</a></li>
							<li><a href="goods/list?type=3" target="_blank">鞋</a></li>
						</ul>
					</div>
					<div id="div_middle_catalog_woman" class="div_catalog">
						<img class="div_middle_catalog_img" alt="女装" src="image/catalog/woman.jpg">
						<p class="catalog_name">女装</p>
						<hr class="catalog_separator">
						<ul>
							<li><a href="goods/list?type=4" target="_blank">上衣</a></li>
							<li><a href="goods/list?type=6" target="_blank">鞋</a></li>
						</ul>
					</div>
					<div id="div_middle_catalog_read" class="div_catalog">
					<img class="div_middle_catalog_img" alt="阅读" src="image/catalog/read.jpg">
						<p class="catalog_name">阅读</p>
						<hr class="catalog_separator">
						<ul>
							<li><a href="goods/list?type=4" target="_blank">文学</a></li>
							<li><a href="goods/list?type=9" target="_blank">科幻</a></li>
						</ul>
					</div>
					<div id="div_middle_catalog_digital" class="div_catalog">
						<img class="div_middle_catalog_img" alt="数码" src="image/catalog/digital.jpg">
						<p class="catalog_name">数码</p>
						<hr class="catalog_separator">
						<ul>
							<li><a href="goods/list?type=7" target="_blank">电脑</a></li>
							<li><a href="goods/list?type=8" target="_blank">手机</a></li>
						</ul>
					</div>
					<div id="div_middle_catalog_outdoor" class="div_catalog">
					<img class="div_middle_catalog_img" alt="户外" src="image/catalog/outdoor.jpg">
						<p class="catalog_name">户外</p>
						<hr class="catalog_separator">
						<ul>
							<li><a href="" target="_blank">运动</a></li>
							<li><a href="" target="_blank">探险</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div id="div_bottom">
				<div id="div_bottom_rights">
					<hr class="bottom_separator">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>

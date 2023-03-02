<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<title>Chi tiết sản phẩm</title>
<style>
.product-content {
	overflow-x: hidden;
}
</style>
</head>

<body>
	<!-- 
Body Section 
-->
<%-- <h1>${Cart.size()}</h1> --%> 	
	<div class="row product-content">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${ categorys }">
						<li><a href="<c:url value="/san-pham/${ item.id }"/>"><span
								class="icon-chevron-right"></span> ${item.name}</a></li>
						<li>
					</c:forEach>
					<!-- <li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="cart.html"><strong> Số tiền<span class="badge badge-warning pull-right"
								style="line-height: 18px;">$448.42</span>
						</strong></a></li> -->
				</ul>

			</div>

			

			

		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="/AppleShop/">Trang chủ</a> <span class="divider">/</span></li>
				<li><a href="/AppleShop/san-pham/${id }">Sản phẩm</a> <span class="divider">/</span></li>
				<li class="active">Chi tiết sản phẩm</li>
			</ul>
			<div class="well well-small">
				<div class="row-fluid">
					<div class="span5">
						<div id="myCarousel" class="carousel slide cntr">
							<div class="carousel-inner">
								<div class="item active">
									<a href="#"> <img src="<c:url value="${ product.img_product }"/> " alt=""
										style="width: 100%"></a>
								</div>
							</div>
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev">‹</a> <a class="right carousel-control"
								href="#myCarousel" data-slide="next">›</a>
						</div>
					</div>
					<div class="span7">
						<h3>${product.name_product}</h3>
						<hr class="soft" />

						<form class="form-horizontal qtyFrm" method="get" action="<c:url value="/AddCart/${ product.id }"/> ">
							<div class="control-group">
								<label class="control-label"><span><fmt:formatNumber
											type="number" groupingUsed="true" value="${ product.price }" />
										₫</span></label>
								
							</div>

							<div class="control-group">
								<label class="control-label"><span>Color: ${ product.name_color }</span></label>
								<!-- <div class="controls">
									<select class="span11">
										<option>Red</option>
										<option>Purple</option>
										<option>Pink</option>
										<option>Red</option>
									</select> 
								</div>-->
							</div>
							<div class="control-group">
								<label class="control-label"><span>Dung lượng:${ product.name_capacity }GB</span></label>
							</div><hr class="soft" />
							
							
							<h4></h4>
							<div style="border: 2px solid #ddd;"><p>${ product.title }</div></p>
								<button type="submit" class="shopBtn">
									<span class=" icon-shopping-cart"></span> Thêm vào giỏ hàng
								</button>
						</form>
					</div>
				</div>
				<hr class="softn clr" />


				<ul id="productDetail" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">Chi tiết sản phẩm</a></li>
					<li class=""><a href="#profile" data-toggle="tab">Sản phẩm liên quan</a></li>
					
				</ul>
				<div id="myTabContent" class="tab-content tabWrapper">
					<div class="tab-pane fade active in " id="home">
						 <h4>Thông số kỹ thuật</h4> 
						<%-- ${ product.details } --%>
						 <table class="table table-striped" style="border-collapse: collapse; width: 100%;" >
							<tbody>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Màn hình</td>
									<td class="techSpecTD2">${ product.size } inch, OLED, Super Retina XDR, 2778 x 1284 Pixels</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Màu sắc:</td>
									<td class="techSpecTD2">${ product.name_color }</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Camera sau:</td>
									<td class="techSpecTD2">12.0 MP + 12.0 MP + 12.0 MP</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Camera Selfie:</td>
									<td class="techSpecTD2">12.0 MP</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">RAM:</td>
									<td class="techSpecTD2">6 GB</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Bộ nhớ trong:</td>
									<td class="techSpecTD2">${ product.name_capacity } GB</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">CPU:</td>
									<td class="techSpecTD2">Apple A15 Bionic</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Dung lượng pin:</td>
									<td class="techSpecTD2">4352 mAh</td>
								</tr>
								<tr class="techSpecRow">
									<td class="techSpecTD1">Hệ điều hành:</td>
									<td class="techSpecTD2">iOS 15</td>
								</tr>
							</tbody>
						</table>
						<p>${ product.details }</p>
						
					</div>
					<div class="tab-pane fade " id="profile">
					
					<c:set var="countlist" value="${ productByIDCategory.size() }"/>
					<c:if test="${productByIDCategory.size() > 6}">
								<c:set var="countlist" value="6"/>
							</c:if>
							
						<c:forEach var="item" items="${productByIDCategory}" begin="1" end="${ countlist }" varStatus="loop">
							<div class="row-fluid">
							<div class="span2">
								<img src="<c:url value="${ item.img_product }"/>" alt="">
							</div>
							<div class="span6">
								<h5>${ item.name_product }</h5>
								<p>${ item.title }
								</p>
							</div>
							<div class="span4 alignR">
								<form class="form-horizontal qtyFrm">
									<h3><fmt:formatNumber type="number" groupingUsed="true" value="${ item.price }" /> ₫</h3>
									
									<div class="btn-group">
										<a href="<c:url value="/AddCart/${ item.id }"/>" class="defaultBtn"><span
											class=" icon-shopping-cart"></span> Thêm vào giỏ hàng</a></br> </br><a
											href="/AppleShop/chi-tiet-san-pham/${ item.id }" class="shopBtn">Xem chi tiết</a>
									</div>
								</form>
							</div>
						</div>
						<hr class="soft" />
						</c:forEach>
						
						
						
						
					</div>


				</div>

			</div>
		</div>
	</div>
	<!-- Body wrapper -->
</body>


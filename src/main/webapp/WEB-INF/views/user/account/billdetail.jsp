<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<div class="title-infor-account text-center">
		<h1>Chi tiết đơn hàng</h1>
								
	</div>
	<hr/>
		<div class="customer-table-bg">													
							<h4 class="name_account">Đơn hàng: #${bill.id}, Đặt ngày - ${bill.ngaymua}</h4>
						
						<h5><p>Tình trạng thanh toán: ${(bill.trangthai == 0) ? "Đang chờ xử lý" : "Đã hoàn tất" }</p></h5>
						<h5><p>Vận chuyển:  ${(bill.vanchuyen == 0) ? "Chưa giao hàng" : "Đã giao hàng" }</p></h5>
						<a href="/AppleShop/account">Quay lại trang tài khoản</a>
							<div class="table-responsive">
								<table id="order_details" class="table tableOrder" >
									<tr height="40px">
										<!-- <th class="">ID</th> -->
										<th class="">Ảnh</th>
										<th class="">Sản phẩm</th>
										<th class="text-center">Mã sản phẩm</th>
										<th class="text-center">Đơn giá</th>
										<th class="text-center">Số lượng</th>
										<th class="total text-right">Thành tiền</th>
									</tr>
									<c:forEach var="billdetail" items="${billdetail}">
										<tr height="40px" id="" class="odd">
										<%-- <td class="">${billdetail.id_bills }</td> --%>
										<td class="order-image">										 
												 <img style="max-width:130px" src="<c:url value="${billdetail.img_product}"/>" alt=""> 							
										</td>					
										<td class="title" style="max-width:300px">
											<a href="<c:url value="/chi-tiet-san-pham/${ billdetail.id_product }"/>" title="">${billdetail.name_product }</a> <br/> 
											<span class="variant_acc">
												${billdetail.name_color }
											</span>
											
										</td>
										<td class="sku text-center">#${billdetail.id_product }</td>
										<td class="money text-center"><span><fmt:formatNumber
											type="number" groupingUsed="true" value="${billdetail.total / billdetail.quanty }" />
										₫</span></td>
										<td class="quantity center text-center">${billdetail.quanty }</td>
										<td class="total money text-right"><fmt:formatNumber
											type="number" groupingUsed="true" value="${billdetail.total}" />
										₫</td>
									</tr>
									</c:forEach>
									
									
								
									
									<tr height="40px" class="order_summary line_order">
										<td class="text-right" colspan="5"><b>Giá sản phẩm</b></td>
										<td class="total money text-right"><b><fmt:formatNumber
											type="number" groupingUsed="true" value="${bill.total}" />
											₫</b></td>
									</tr>   
									
									<tr height="40px" class="order_summary ">
										<td class="text-right" colspan="5"><b>Giao hàng tận nơi</b></td>
										<td class="total money text-right"><b>50,000₫</b></td>
									</tr>
									
									    
									<tr  height="40px"class="order_summary order_total">
										<td class="text-right" colspan="5"><b>Tổng tiền</b></td>
										<td class="total money text-right"><b><fmt:formatNumber
											type="number" groupingUsed="true" value="${bill.total + 50000}" />
											₫</b></td>
									</tr>    
								</table>
							</div>
						</div>
					
		

	
</body>
</html>


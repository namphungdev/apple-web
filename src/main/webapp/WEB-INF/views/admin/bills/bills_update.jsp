<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<div class="page-wrapper">

		<div class="container-fluid">
			<c:url value="/home_admin/category_save" var="urlSave" />
			<c:url value="/home_admin/bills_update" var="urlUpdate" />
			<c:url value="/home_admin/categoryDelete" var="urlDelete" />
			<h1>Chi tiết đơn hàng</h1>
			</hr>
			
			<div class="row">
			<div class="col" style=" width: 160px; border: 2px solid black" >
			<br />
			<h4 class="name_account">Đơn hàng của: ${bill.display_name}</h4>
			<h5 class="name_account">Đặt ngày - ${bill.ngaymua}</h5>
			<h5 class="name_account">Địa chỉ : ${bill.address}</h5>
			<h5 class="name_account">Số điện thoại : ${bill.phone}</h5>
			<h5 class="name_account">Email : ${bill.username}</h5>
			<h5 class="name_account">Ghi chú : ${bill.note}</h5>
			</div>
			<div class="col" style=" width: 160px; border-top: 2px solid black; border-bottom: 2px solid black; border-right: 2px solid black ">
			<c:url value="/home_admin/updateBills" var="updateBills" />
			<form:form action="${updateBills}" method="POST" modelAttribute="bill">
     	 <form:input path="id" type="hidden" /> <br/> <br/>
      <h5>Trạng thái:  <form:select  name="trangthai" path="trangthai" style="font-size: 15px  ">			
				<form:option  value="0" >Đang chờ xử lý</form:option >
				<form:option  value="1" >Đã hoàn tất</form:option >
		</form:select ></h5>
				<br />
				<br />
	  <h5>Vận chuyển:  <form:select  name="vanchuyen" path="vanchuyen" style="font-size: 15px " >			
				<form:option  value="0">Chưa giao hàng</form:option >
				<form:option  value="1">Đã giao hàng</form:option >
		</form:select ></h5>
				<br />
				<br />
     
				<button type="submit">Xác nhận </button>
			</form:form>
			</div>
			</div><br />
				

			<table class="table">
				<tr class="table-dark">
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
						<td class="order-image"><img style="max-width: 130px"
							src="<c:url value="${billdetail.img_product}"/>" alt=""></td>
						<td class="title" style="max-width: 300px"><a
							href="<c:url value="/chi-tiet-san-pham/${ billdetail.id_product }"/>"
							title="">${billdetail.name_product }</a> <br /> <span
							class="variant_acc"> ${billdetail.name_color } </span></td>
						<td class="sku text-center">#${billdetail.id_product }</td>
						<td class="money text-center"><span><fmt:formatNumber
									type="number" groupingUsed="true"
									value="${billdetail.total / billdetail.quanty }" /> ₫</span></td>
						<td class="quantity center text-center">${billdetail.quanty }</td>
						<td class="total money text-right"><fmt:formatNumber
								type="number" groupingUsed="true" value="${billdetail.total}" />
							₫</td>
					</tr>
				</c:forEach>




				<tr height="40px" class="order_summary line_order">
					<td class="text-right" colspan="5"><b>Giá sản phẩm</b></td>
					<td class="total money text-right"><b><fmt:formatNumber
								type="number" groupingUsed="true" value="${bill.total}" /> ₫</b></td>
				</tr>

				<tr height="40px" class="order_summary ">
					<td class="text-right" colspan="5"><b>Giao hàng tận nơi</b></td>
					<td class="total money text-right"><b>50,000₫</b></td>
				</tr>


				<tr height="40px" class="order_summary order_total">
					<td class="text-right" colspan="5"><b>Tổng tiền</b></td>
					<td class="total money text-right"><b><fmt:formatNumber
								type="number" groupingUsed="true" value="${bill.total + 50000}" />
							₫</b></td>
				</tr>
			</table>
			
			
			</div>
           
        </div>
       </div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>

</html>
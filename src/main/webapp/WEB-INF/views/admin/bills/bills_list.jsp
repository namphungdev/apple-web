<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Đơn hàng</title>
<style>
table, th, td {
  border: 1px solid black;
}
td {
  padding-right: 30px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

        <div class="page-wrapper">
           
            <div class="container-fluid">
			<c:url value="/home_admin/category_save" var="urlSave" />
			<c:url value="/home_admin/bills_update" var="urlUpdate" />
			<c:url value="/home_admin/categoryDelete" var="urlDelete" />
			<h1>Danh sách đơn hàng:</h1>
  
  <br />
  <br />
  <table class="table">
    <tr class="table-dark" >
      <th>Id đơn hàng</th>
      <th>Tên</th>
      <th>Tổng tiền</th>
      <th>Địa chỉ</th>
      <th>Ngày mua</th>
      <th>Trang thái</th>
      <th>Vận chuyển</th>
    
    
      <th>Edit</th>
      <th>Delete</th>
    </tr>
    
      <c:forEach var="listBill" items="${listBill}">
        <tr style="border: 1px black solid">
          <td>#${listBill.id}</td>
          <td>${listBill.display_name}</td>
          <td><fmt:formatNumber type="number" groupingUsed="true" value="${listBill.total}" /> ₫</td>
          <td>${listBill.address}</td>
          <td>${listBill.ngaymua}</td>
          <td>${(listBill.trangthai == 0) ? "Đang chờ xử lý" : "Đã hoàn tất" }</td>
           <td>${(listBill.vanchuyen == 0) ? "Chưa giao hàng" : "Đã giao hàng" }</td>
  
          <td> <a href="${urlUpdate}/${listBill.id}">Edit</a></td>
          <td> <a href="${urlDelete}/${listBill.id}">Delete</a></td>
        </tr>
      </c:forEach>
     <%--  <c:if test="${not empty listBill}">
    </c:if> --%>
  </table>
                           
            </div>
           
        </div>
       </div>
  
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</html>
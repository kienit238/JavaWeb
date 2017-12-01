<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-md-3 col-lg-3 " align="center">
		<img alt="User Pic"
			src="<%= request.getContextPath() %>${staff[0].avatar}"
			class="img-circle img-responsive">
	</div>

	<div class=" col-md-9 col-lg-9 ">
		<table class="table table-user-information">

			<tbody>
				<c:forEach var="emp" items="${staff}">
					<tr>
						<td>Họ Tên:</td>
						<td>${emp.name}</td>
					</tr>

					<tr>
						<td>Phòng ban:</td>
						<td>${emp.dept.name}</td>
					</tr>

					<tr>
						<td>Ngày sinh:</td>
						<td>${emp.birthday}</td>
					</tr>


					<tr>
						<td>Giới tính</td>

						<c:choose>

							<c:when test="${emp.gender=='true'}">
								<td>Nam</td>
							</c:when>
							<c:otherwise>
								<td>Nữ</td>
							</c:otherwise>
						</c:choose>

					</tr>

					<tr>
						<td>Email</td>
						<td><a href="mailto:info@support.com">${emp.email}</a></td>
					</tr>
					<td>Số điện thoại</td>
					<td>${emp.phone}</td>


				</c:forEach>
			</tbody>
		</table>


	</div>
</div>

<%@page import="Model.Depart"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap Core CSS -->

<link
	href="<%=request.getContextPath()%>/sources/vendor/bootstrap/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/sources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/sources/dist/css/sb-admin-2.css"
	rel="stylesheet">



<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/sources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/sources/css/user.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="<%=request.getContextPath()%>/sources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="<%=request.getContextPath()%>/sources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/sources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/sources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/sources/css/style5.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700'
	rel='stylesheet' type='text/css' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset=utf-8>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#load').click(function(e) {
			e.preventDefault();
			$.post('test2.htm', {
				'id' : 1,
				
			}, function(ketqua) {
				$('#noidung').html(ketqua);
			});

		});
	});
</script>
</head>
<body>
	<!-- 	<table> -->
	<%-- 		<c:forEach var="emp" items="${staff}"> --%>

	<!-- 			<tr> -->
	<%-- 				<td>${emp.name}</td> --%>
	<%-- 				<td>${emp.birthday}</td> --%>
	<%-- 				<td>${emp.dept.ID}</td> --%>

	<%-- 				<c:url value="/Admin/test.htm" var="URL" > --%>
	<%-- 					<c:param name="id" value="${emp.ID}"/> --%>
	<%-- 				</c:url> --%>
	<%-- 				<td><a href="${URL}">link</a></td> --%>

	<%-- 				<td>${param.id}</td> --%>
	<!-- 			</tr> -->
	<%-- 		</c:forEach> --%>
	<!-- 	</table> -->
	<a href="#" id="load">Load data</a>
	<div id="noidung"></div>

</body>
</html>
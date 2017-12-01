<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	String url = request.getContextPath() + "/Home/index.htm";
	String checkuser = (String) session.getAttribute("username");
	if (checkuser == null) {
		response.sendRedirect(url);
	} else {
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Microsoft Corporation</title>

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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

	<%
		String pg = (String) request.getAttribute("page");
	%>
	<div id="wrapper">

		<%@include file="/inc/top.jsp"%>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">

					<%
						if (pg == null) {
					%>


					<%@include file="/inc/dashboard.jsp"%>
					<%
						} else if (pg.equals("profile")) {
					%>

					<%@include file="/inc/profile.jsp"%>
					<%
						} else if (pg.equals("depart")) {
					%>

					<%@include file="/inc/depart.jsp"%>
					<%
						} else if (pg.equals("staff")) {
					%>
					<%@include file="/inc/staff.jsp"%>

					<%
						} else if (pg.equals("top10")) {
					%>
					<%@include file="/inc/top10.jsp"%>
					<%
						} else if (pg.equals("recordstaff")) {
					%>
					<%@include file="/inc/record.jsp"%>
					<%
						} else if (pg.equals("source")) {
					%>
					<%@include file="/inc/source.jsp"%>
					<%
						}
					%>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<%=request.getContextPath()%>/sources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="<%=request.getContextPath()%>/sources/dist/js/sb-admin-2.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/sources/js/modernizr.custom.79639.js"></script>
</body>
</html>
<%
	}
%>
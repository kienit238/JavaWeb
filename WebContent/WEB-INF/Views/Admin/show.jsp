<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
</head>
<body>
	<script>
$(document).ready(function() {
	$("#myData").click(function() {
		var reason=$("#mytext").val();
		var id=$("#ID").val();
		var name=$("#Name").val();
		
		var check=$("#check:checked").val();
		if(reason==''){
			alert("No");
		}else{
		alert(reason);
		}
<%-- 		window.location.href="<%=request.getContextPath()%>/Admin/btnUpdateRecord.htm?id=" --%>
// 													+ id + "&reason=" + reason +"&check=" + check ;

										})
					});
</script>
	<script type="text/javascript">
	function dataEdit(id) {
		$.post('dataEvaluate.htm', {
			'id' : id

		}, function(data) {
			$(".modal-body").html(data);
		});

	}
	
</script>
	<p data-placement="top" data-toggle="tooltip" title="Edit">
		<button class="btn btn-primary btn-sm" data-title="Edit"
			data-toggle="modal" data-target="#edit" onclick="dataEdit('${s[4]}')">

			<span class="glyphicon glyphicon-pencil"></span>
		</button>
	</p>
	<!-- Edit -->
	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Đánh giá</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer ">
					<button id="myData" class="btn btn-warning btn-lg"
						style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> Nhận xét
					</button>

				</div>


			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- Edit -->
</body>
</html>
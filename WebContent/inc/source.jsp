<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-lg-12">
	<h1 class="page-header">Tài Nguyên</h1>
</div>
<!-- /.col-lg-12 -->

<!-- /.row -->
<div class="row">
	<div class="col-lg-12 col-md-12">
	<p style="color: red; font-weight: bold;">${message}</>
		<form action="uploadSource.htm" method="post" enctype="multipart/form-data">
			
				<input style="float: left;" type="file" name="fileUpload"> 
				<div><input style="display: block" type="submit"
					value="Upload"></div><br />
				
			
		</form>
		<div style="clear: left;"></div>
		
		<table>
			<tr>
				<th style="width: 400px;">Tên</th>
				<th style="margin-left: 50px;">Download</th>
			</tr>
			<c:forEach var="s" items="${source}">
				<tr>
					<td style="width: 400px;">${s.name}</td>
					<td style="margin-left: 50px;"><a
						href="download.htm?url=${s.url}">Link</a></td>

				</tr>
			</c:forEach>
		</table>
	</div>

</div>

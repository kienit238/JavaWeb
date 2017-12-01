<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="form-group">
	ID: <input id="ID" value="<%= session.getAttribute("id") %>" class="form-control " type="text"
		placeholder="Nhập ID phòng ban">
</div>

<div class="form-group">

	Tên phòng ban: <input id="Name" value="<%= session.getAttribute("name") %>" class="form-control "
		type="text" placeholder="Nhập tên phòng ban">
		
</div>

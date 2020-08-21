<!DOCTYPE html>
<html>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<title>PS10217 - ASM</title>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/template/css/bootstrap.min.css"/>"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<c:url value="/template/css/metisMenu.min.css"/>"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="<c:url value="/template/css/timeline.css"/>"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value="/template/css/startmin.css"/>"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="<c:url value="/template/css/morris.css"/>" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<c:url value="/template/css/font-awesome.min.css"/>"
	rel="stylesheet" type="text/css">

</head>

<body>

	<div class="container">
		<jsp:include page="${param.view}"/>
	</div>
	
	
<!-- jQuery -->
	<script src="<c:url value="/template/js/jquery.min.js"/>"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value="/template/js/bootstrap.min.js"/>"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<c:url value="/template/js/metisMenu.min.js"/>"></script>

	<!-- Morris Charts JavaScript -->
	<script src="<c:url value="/template/js/raphael.min.js"/>"></script>
	<script src="<c:url value="/template/js/morris.min.js"/>"></script>
	<script src="<c:url value="/template/js/morris-data.js"/>"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<c:url value="/template/js/startmin.js"/>"></script>
	</body>
</html>
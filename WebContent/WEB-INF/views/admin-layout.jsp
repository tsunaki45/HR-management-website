<!DOCTYPE html>
<html>
<%@ page pageEncoding="utf-8"%>
<%@ taglib 	uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<title>PS10217 - ASM</title>
<jsp:include page="admin/common/css.jsp"></jsp:include>
</head>

<body>

	<div id="wrapper">

		<jsp:include page="admin/common/header.jsp"/>
		<jsp:include page="admin/common/nav.jsp"/>

		<div id="page-wrapper">
			<div class="container-fluid">
				<jsp:include page="${param.view}" />
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
	
	<jsp:include page="admin/common/js.jsp"></jsp:include>
</body>

</html>
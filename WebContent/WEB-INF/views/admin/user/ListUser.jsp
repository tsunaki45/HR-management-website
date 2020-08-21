<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header"><s:message code="user.title"/></h1>
	</div>
</div>

<!-- ... Your content goes here ... -->
<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a href="admin/user/AddUser.htm" style="width: 200px;" class="btn btn-primary">
						<s:message code="user.add"/></a>
				</div>
				
				<div>
					<c:if test="${not empty message}">
						<div class="alert alert-${alert} alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<c:set var="success" value="success" />
							<c:set var="danger" value="danger" />
							<c:if test="${alert eq success}"> <i class="fa fa-check-circle"></i> </c:if>
							<c:if test="${alert eq danger}"> <i class="fa fa-times-circle"></i> </c:if>
							&nbsp;&nbsp; <s:message code="${message}" />
						</div>
					</c:if>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th><s:message code="user.username"/></th>
									<th><s:message code="user.password"/></th>
									<th><s:message code="user.fullname"/></th>
									<th class="col-lg-4"><s:message code="global.action"/></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${users}">
									<tr class="even gradeC">
										<td>${u.username}</td>
										<td>${u.password}</td>
										<td>${u.fullname}</td>
										<td>
											<a href="admin/user/EditUser.htm?username=${u.username}" class="btn btn-success btn-sm">
												<i class="fa fa-edit"></i><span><s:message code="global.edit"/></span>
											</a>
											<a href="admin/user/DeleteUser.htm?username=${u.username}" class="btn btn-danger btn-sm  ">
												<i class="fa fa-times"></i><span><s:message code="global.delete"/></span>
											</a>
										</td>
									</tr>
								</c:forEach>
	
							</tbody>
						</table>
					</div>
				</div>
	
			</div>
		</div>
</div>


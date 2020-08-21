<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="staff.title"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="admin/staff/AddStaff.htm" class="btn btn-primary" style="width: 200px;"><s:message code="staff.add"/></a>
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
                                <form>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                              		<th><s:message code="staff.id"/></th>
                                              		<th><s:message code="staff.name"/></th>
                                              		<th><s:message code="staff.gender"/></th>	
                                              		<th><s:message code="staff.photo"/></th>
                                              		<th><s:message code="staff.email"/></th>
                                              		<th><s:message code="staff.phone"/></th>
                                              		<th><s:message code="staff.salary"/></th>
                                                    <th class="col-lg-2"><s:message code="global.action"/></th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                   <c:forEach var="s" items="${staffs}">
                                                    <tr class="even gradeC">                                                   	                                                   	
                                                    	<td>${s.id}</td>
	                                                    <td>${s.name}</td>
	                                                    <td><c:choose>
	                                                    	<c:when test="${s.gender}">Nam</c:when>
	                                                    	<c:otherwise>Nữ</c:otherwise>
	                                                    </c:choose></td>
	                                                    <td><img class="img-thumbnail" src="<c:url value="/template/img/${staff.photo}" />" width="100px"></td>
	                                                    <td>${s.email}</td>
	                                                    <td>${s.phone}</td>
	                                                    <td>${s.salary}</td>
	                                                    <td>
	                                                        <a href="admin/staff/EditStaff.htm?id=${s.id}" type="button" class="btn btn-success btn-sm"><i class="fa fa-edit"></i> <s:message code="global.edit"/></a>
	                                                        <a href="admin/staff/DeleteStaff.htm?id=${s.id}" type="button" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <s:message code="global.delete"/></a>
	                                                    </td>
	                                                </tr>
                                                   </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>
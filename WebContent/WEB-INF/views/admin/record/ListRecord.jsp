<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="record.title"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="admin/record/AddRecord.htm" class="btn btn-primary" style="width: 200px;"><s:message code="record.add"/></a>
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
                                                	
                                              		<th><s:message code="record.staff"/></th>
                                                    <th><s:message code="record.type"/></th>
                                                    <th><s:message code="record.reason"/></th>
                                                    <th><s:message code="record.date"/></th>
                                                    
                                                    <th class="col-lg-4"><s:message code="global.action"/></th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="r" items="${records}">
	                                               	<tr class="even gradeC">
	                                               		<td hidden="true">${r.id}</td>
	                                                    <td>${r.staff.name}</td>
	                                                    <td>
	                                                    	<c:choose>
	                                                    		<c:when test="${r.type == 1}">
																	<span class="text-success"><s:message code="global.index.table.result.rewarded" /></span>
																</c:when>
																<c:otherwise>
																	<span class="text-danger"><s:message code="global.index.table.result.fined" /></span>
																</c:otherwise>
	                                                    	</c:choose>
	                                                    </td>
	                                                    <td>${r.reason}</td>
	                                                    <td>${r.date}</td>
	                                                   
	                                                    <td>
	                                                        <a href="admin/record/EditRecord.htm?id=${r.id}" type="button" class="btn btn-success btn-sm"><i class="fa fa-edit"></i> <s:message code="global.edit" /></a>
	                                                        <a href="admin/record/DeleteRecord.htm?id=${r.id}" type="button" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <s:message code="global.delete" /></a>
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
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="record.report.depart.title"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">                            
                            <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                	<th><s:message code="record.depart" /></th>
													<th><s:message code="global.index.table.achievement" /></th>
													<th><s:message code="global.index.table.discipline" /></th>
													<th><s:message code="global.index.table.result" /></th>
													<th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="row" items="${DRList}">
	                                               	<tr class="even gradeC">
	                                               		<c:set var="sum" value="${row[2] - row[3]}"/>
	                                            		<td>${row[1]}</td>
	                                            		<td>${row[2]}</td>
	                                            		<td>${row[3]}</td>
	                                            		<td>${sum}</td>
	                                            		<td>
	                                            			<c:if test="${sum > 0}"> <span class="text-success"><s:message code="global.index.table.result.rewarded" /></span> </c:if> 
															<c:if test="${sum < 0}"> <span class="text-danger"><s:message code="global.index.table.result.fined" /></span> </c:if> 
															<c:if test="${sum == 0}"> <span> </span> </c:if>
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
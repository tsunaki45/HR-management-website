<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>



                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="record.add"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">

                            <div class="panel-body">
                                <form:form action="admin/record/save.htm" method="post" modelAttribute="records">
                                	
                                	<form:hidden path="id"/>
                                
                                    <div class="form-group">
										<div class="row">
											<div class="col-lg-2">
												<label><s:message code="record.staff" /></label>
											</div>
											<div class="col-lg-10">
												<form:select cssClass="form-control" path="staff.id">
													<form:option value="">
														<s:message code="record.staff.choose" />
													</form:option>
													<c:forEach items="${staffs}" var="item">
														<form:option value="${item.id}">${item.id} - ${item.name}</form:option>
													</c:forEach>
												</form:select>
												<form:errors path="staff.id" cssClass="text-danger"/>
											</div>
										</div>
									</div>
                                    
                                    <div class="form-group">
										<div class="row">
											<div class="col-lg-2">
												<label><s:message code="record.type" /></label>
											</div>
											<div class="col-lg-10">
												<div class="row">
													<div class="col-lg-2">
														<label class="form-check-input"> 
															<form:radiobutton path="type" value="1" /> <span><i></i>
															<s:message code="record.type.achievement" /></span>
														</label>
													</div>
													<div class="col-lg-10">
														<label class="form-check-input"> 
															<form:radiobutton path="type" value="0" /> <span><i></i>
															<s:message code="record.type.discipline" /></span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
                                    
                                    <div class="form-group">
										<div class="row">
											<div class="col-lg-2">
												<label><s:message code="record.reason" /></label>
											</div>
											<div class="col-lg-10">
												<form:textarea cssClass="form-control" path="reason" />
											</div>
										</div>
									</div>
                                    
                                    <div class="form-group">
                                     	
										<button class="btn btn-primary">
											<s:message code="record.save" />
										</button>
									</div>
                                </form:form>
                            </div>

                        </div>
                    </div>
                </div>

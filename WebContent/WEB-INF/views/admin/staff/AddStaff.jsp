<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>



                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="staff.add"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                       
                            <div class="panel-body">
                                <form:form action="admin/staff/save.htm" method="post" modelAttribute="staffs" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="staff.id" /></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		<form:input path="id" cssClass="form-control"/>
                                        		<form:errors path="id" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="staff.name" /></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		<form:input path="name" cssClass="form-control"/>
                                        		<form:errors path="name" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
											<div class="row">
												<div class="col-lg-2">
													<label><s:message code="staff.gender"/></label>
												</div>
												<div class="col-lg-2">
													<label class="form-check-input"> <form:radiobutton path="gender" value="true"/> 
														<span><i></i> <s:message code="staff.male" /></span>
													</label>
												</div>
												<div class="col-lg-2">
													<label class="form-check-input"> <form:radiobutton path="gender" value="false" /> 
														<span><i></i> <s:message code="staff.female" /></span>
													</label>
												</div>
												<form:errors path="gender" cssClass="text-danger"/>
											</div>
										
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="staff.birthday" /></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		 <form:input path="birthday" cssClass="form-control"/>
                                        		 <form:errors path="birthday" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
										<div class="row">
											<div class="col-md-2">
												<label><s:message code="staff.photo" /></label>
											</div>
											<div class="col-md-10">
												<div class="input-group input-file" name="img">
													<span class="input-group-btn">
														<button class="btn btn-default btn-choose" type="button">
															<s:message code="staff.choose" />
														</button>
													</span>
													<form:input cssClass="form-control" path="photo"
														placeholder='Choose a file...' />
													<span class="input-group-btn">
														<button class="btn btn-warning btn-reset" type="button">
															<s:message code="staff.reset" />
														</button>
													</span>
												</div>
												<form:errors path="photo" cssClass="text-danger" />
											</div>
										</div>
									</div>
                                    
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="staff.email" /></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		 <form:input path="email" cssClass="form-control"/>
                                        		 <form:errors path="email" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    
                                     <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="staff.phone" /></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		 <form:input path="phone" cssClass="form-control"/>
                                        		 <form:errors path="phone" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="staff.salary" /></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		<form:input path="salary" cssClass="form-control"/>
                                        		<form:errors path="salary" cssClass="text-danger"/>
                                        	</div>
                                        	<script type="text/javascript">
												$(document).ready(function(){
													$("#salary").attr({
														"type" : "number",
													});
												});
											</script>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
										<div class="row">
											<div class="col-lg-2">
												<label><s:message code="staff.depart" /></label>
											</div>
											<div class="col-lg-10">
												<form:select cssClass="form-control" path="depart.id">
													<form:option value="">
														<s:message code="staff.depart.choose" />
													</form:option>
													<c:forEach items="${departs}" var="d">
														<form:option value="${d.id}">${d.name}</form:option>
													</c:forEach>
												</form:select>
												<form:errors path="depart" cssClass="text-danger" />
											</div>
											
										</div>
									</div>
                                    
                                    <div class="form-group">
                                        <button class="btn btn-primary">
											<s:message code="staff.save" />
										</button>
                                    </div>
                                </form:form>
                            </div>

                        </div>
                    </div>
                </div>
                
                

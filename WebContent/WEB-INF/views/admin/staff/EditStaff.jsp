<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>



                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="staff.edit.title"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                       
                            <div class="panel-body">
                                <form:form action="admin/staff/update.htm" method="post" modelAttribute="staffs" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="staff.id" /></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		<form:input path="id" cssClass="form-control" readonly="true"/>
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
                                        	<div class="col-lg-2">
                                        		<label><s:message code="staff.photo" /></label>
                                        	</div>
                                        	<div class="col-lg-10" name="img">
                                        		<form:input path="photo" cssClass="form-control"/>
                                        		<form:errors path="photo" cssClass="text-danger"/>
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
                                        </div>
                                    </div>
                                    
                                    <form:hidden path="depart.id"/>
                                    
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
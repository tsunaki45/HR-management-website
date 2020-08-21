<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="user.edit.title"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form:form action="admin/user/update.htm" method="post" modelAttribute="users">
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="user.username"/></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		<form:input path="username" cssClass="form-control" readonly="true"/>
                                        		<form:errors path="username" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="user.password"/></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		<form:input path="password" cssClass="form-control"/>
                                        		<form:errors path="password" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="user.fullname"/></label>
                                        	</div>
                                        	<div class="col-lg-10">
                                        		<form:input path="fullname" cssClass="form-control"/>
                                        		<form:errors path="fullname" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
										<button class="btn btn-primary">
											<s:message code="user.save" />
										</button>
									</div>
                               </form:form>                                                                                              
                            </div>

                        </div>
                    </div>
                </div>
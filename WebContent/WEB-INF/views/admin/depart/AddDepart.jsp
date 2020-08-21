<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>



                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="depart.add"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">

                            <div class="panel-body">
                                <form:form action="admin/depart/save.htm" method="post" modelAttribute="departs">
                                    <div class="form-group">
                                        <div class="row">
                                        	<div class="col-lg-2">
                                        		<label><s:message code="depart.id"/></label>
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
                                        		<label><s:message code="depart.name"/></label>                                       
                                        	</div>
                                        	<div class="col-lg-10">
	                                        	<form:input path="name" cssClass="form-control"/>
	                                        	<form:errors path="name" cssClass="text-danger"/>
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
										<button class="btn btn-primary">
											<s:message code="depart.save" />
										</button>
									</div>
                                </form:form>
                            </div>

                        </div>
                    </div>
                </div>

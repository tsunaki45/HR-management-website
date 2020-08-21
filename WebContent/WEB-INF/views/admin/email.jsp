<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><s:message code="global.mail.title"/></h1>
                    </div>
                </div>

                <!-- ... Your content goes here ... -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
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
                                <div class="row">
                               
                                    <div>
                                        <form action="admin/send.htm" method="post" role="form">
                                            <div class="form-group">
                                                <label><s:message code="global.mail.from"/></label>
                                                <input class="form-control" name="from" type="email" readonly="true" value="shinchikaga@gmail.com">
                                            	
                                            </div>
                                            <div class="form-group">
                                                <label><s:message code="global.mail.to"/></label>
                                                <input class="form-control" name="to" type="email">
                                            </div>
                                            <div class="form-group">
                                                <label><s:message code="global.mail.subject"/></label>
                                                <input class="form-control" name="subject">
                                            </div>
                                            <div class="form-group">
                                                <div><label><s:message code="global.mail.content"/></label></div>                                             
													<textarea name="body" rows="10"></textarea>
													<script src="<c:url value="/template/ckeditor/ckeditor.js" />"></script>
													<script type="text/javascript">
														CKEDITOR.replace('body');
													</script>								
                                            </div>
		
                                            <div class="form-group">
	                                            <button type="submit" class="btn btn-success"><s:message code="global.mail.send"/></button>
	                                            <button type="reset" class="btn btn-warning"><s:message code="global.mail.reset"/></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
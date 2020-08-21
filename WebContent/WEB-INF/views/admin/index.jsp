<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"><s:message code="global.index.title" /></h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa  fa-user fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">26</div>
							<div><s:message code="global.index.user"/></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-building fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">12</div>
							<div><s:message code="global.index.depart"/></div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-male fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">124</div>
							<div><s:message code="global.index.staff"/></div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-tasks fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">13</div>
							<div><s:message code="global.index.record"/></div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <s:message code="global.index.table.title"/>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th><s:message code="global.index.table.staff"/></th>
                                                <th class="col-sm-4"><s:message code="global.index.table.photo"/></th>
                                                <th><s:message code="global.index.table.achievement"/></th>
                                                <th><s:message code="global.index.table.discipline"/></th>
                                                <th><s:message code="global.index.table.result"/></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="row" items="${ExStaffs}">
                                            	<tr>
                                            		<c:set var="sum" value="${row[2] - row[3]}"/>
                                            		<td>${row[1]}</td>
                                            		<td><img class="img-thumbnail" src="<c:url value="/template/img/${row[4]}" />" width="80px" /></td>
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
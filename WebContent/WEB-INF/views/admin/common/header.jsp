<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="admin/index.htm">PS10217-Le Trong Nghia</a>
			</div>

			<ul class="nav navbar-right navbar-top-links">
				<li class="dropdown navbar-inverse"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class=" fa fa-globe fa-fw"></i>
						<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><div><a href="?language=en" data-lang="en"><i class="fa fa-language fa-fw"></i><s:message code="global.language.english"/></a></div></li>
						<li><div><a href="?language=vi" data-lang="vi"><i class="fa fa-language fa-fw"></i><s:message code="global.language.vietnamese"/></a></div></li>

					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						hello, ${USER} <b class="caret"></b>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="<c:url value="/login/logout.htm"/>"><i class="fa fa-sign-out fa-fw"></i>
								<s:message code="global.logout"/></a></li>
					</ul></li>
			</ul>
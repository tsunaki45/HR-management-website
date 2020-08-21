<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">				
						<li><a href="admin/user/ListUser.htm"><i
								class="fa fa-user fa-fw"></i> <s:message code="global.menu.user"/></a></li>
						<li><a href="admin/depart/ListDepart.htm"><i
								class="fa fa-building fa-fw"></i> <s:message code="global.menu.depart"/></a></li>
						<li><a href="admin/staff/ListStaff.htm"><i class="fa fa-male fa-fw"></i> <s:message code="global.menu.staff"/></a></li>
						<li><a href="admin/record/ListRecord.htm"><i
								class="fa fa-tasks fa-fw"> </i> <s:message code="global.menu.record"/></a></li>
						<li><a href="admin/email.htm"><i class="fa fa-envelope-o fa-fw"> </i> <s:message code="global.menu.mail"/></a>
						</li>
						<li><a href="#"><i class="fa fa-sitemap fa-fw"></i> <s:message code="global.menu.report"/><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="admin/record/DepartReport.htm"> <s:message code="global.report.depart"/></a></li>
								<li><a href="admin/record/StaffReport.htm"> <s:message code="global.report.staff"/></a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
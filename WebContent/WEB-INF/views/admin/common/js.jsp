<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery -->
	<script src="<c:url value="/template/js/jquery.min.js"/>"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value="/template/js/bootstrap.min.js"/>"></script>
	<!--  -->
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<c:url value="/template/js/metisMenu.min.js"/>"></script>

	<!-- Morris Charts JavaScript -->
	<script src="<c:url value="/template/js/raphael.min.js"/>"></script>
	

	<!-- Custom Theme JavaScript -->
	<script src="<c:url value="/template/js/startmin.js"/>"></script>

	<script>
	$(function(){
		$("a[data-lang]").click(function(){
			var lang = $(this).attr("data-lang");
			var url = $(location).attr('pathname');
			$.get(url + "?language="+ lang, function(){
				location.reload();
			});
			
			return false;
		});
	});
	</script>
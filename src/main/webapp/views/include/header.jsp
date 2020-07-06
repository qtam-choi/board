<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="format-detection" content="telephone=no">
        <title>시스템 관리자</title>
        <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
        <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
        <link rel="stylesheet" href="<c:url value='/css/jquery-ui.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/css/sidebar-menu.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery.jqplot.min.css'/>"/>
        
        
        <script src="<c:url value='/js/jquery-1.12.4.min.js'/>"></script>
		<script class="include" src="<c:url value='/js/jquery-ui.js'/>"></script>
		<script class="include" src="<c:url value='/js/jquery.blockUI.js'/>"></script>
	    <script class="include" src="<c:url value='/js/jquery.easing.js'/>"></script>
	    <script class="include" src="<c:url value='/js/sidebar-menu.js'/>"></script>
	    <script class="include" src="<c:url value='/js/jquery.nicescroll.min.js'/>"></script>
	    <script class="include" src="<c:url value='/js/common.js'/>"></script>
	    <script class="include" src="<c:url value='/js/commonUtil.js'/>"></script>
	    <script class="include" src="<c:url value='/js/jquery.mtz.monthpicker.js'/>"></script>
	    <!-- chart plugins  -->
	    <script class="include" type="text/javascript" src="<c:url value='/js/jquery.jqplot.min.js'/>"></script>
	    <script class="include" type="text/javascript" src="<c:url value='/js/jqplot.barRenderer.js'/>"></script>
	    <script class="include" type="text/javascript" src="<c:url value='/js/jqplot.categoryAxisRenderer.js'/>"></script>
	    <script class="include" type="text/javascript" src="<c:url value='/js/jqplot.pointLabels.js'/>"></script>
	    <!-- chart plugins  -->
		
		<script type="text/javascript">
		
		
			function goUrl(url) {
				$.blockUI({ message: '<img src="<c:url value='/images/busy.gif'/>" width="100"/>', css : {backgroundColor: 'rgba(0,0,0,0.0)', color: '#000000', border: '0px solid #a00'}});
				location.href = url;
			   
			}
		
			function getContextPath() {
			   return "<c:out value="${pageContext.request.contextPath}" />";
			}
		
			function goReload() {
				
				var sendObj = document.getElementById("form1");
				$.blockUI({ message: '<img src="<c:url value='/images/busy.gif'/>" width="100"/>', css : {backgroundColor: 'rgba(0,0,0,0.0)', color: '#000000', border: '0px solid #a00'}});
				sendObj.submit();
			}
		
			function goSearch() {
				
				var sendObj = document.getElementById("form1");
			
				$('#curPage').val(1);
				$('#EXCEL').val("N");
				$.blockUI({ message: '<img src="<c:url value='/images/busy.gif'/>" width="100"/>', css : {backgroundColor: 'rgba(0,0,0,0.0)', color: '#000000', border: '0px solid #a00'}});		
				sendObj.submit();
			}
			
			
			function goPage(curPage){
				
				var sendObj = document.getElementById("form1");
		
				$('#curPage').val(curPage);
				$('#EXCEL').val("N");
				$.blockUI({ message: '<img src="<c:url value='/images/busy.gif'/>" width="100"/>', css : {backgroundColor: 'rgba(0,0,0,0.0)', color: '#000000', border: '0px solid #a00'}});
				sendObj.submit();
			}
			
			
			
			function checkingSession(){
				var adminId = "${sessionScope.USER_INFO.user_id}";
				if(adminId == null || adminId == ""){
					location.href="<c:url value='/logout.do' />";
				}
			}
			
			function logOut(){
				
				if(confirm('로그아웃 하시겠습니까?')){
					location.href="<c:url value='/logout.do' />";
				}
				
			}
			
			
			function goExtension(){
				var dataArr = getFormData($("#form1")); 
		    	dataArr.action = "RELOAD";
		    	
		    	$.ajax({
		    	    type : "POST" 
		    	    , async : true
		    	    , url : "<c:url value='/common/commonAction.do' />"
		    	    , dataType : "json"
		    	    , data : dataArr
		    	    , traditional: true
		    	    , beforeSend: function() {
		    	    	$.blockUI({ message: '<h1><br/><img src="<c:url value='/images/busy.gif'/>" width="20"/><br/><br/>' }); 
		    	    }
		    	    , error : function(request, status, error) {
		    	    	$.unblockUI();
		    	    	alert("처리 중 오류가 발생하였습니다.");
		    	    }
		    	    , success : function(data) {
		    	    	
		    	    	$.unblockUI();
		    	    	
		    	    	if(data.RETURN_CODE == "E"){
		        			alert(data.RETURN_MSG);
		        			if(data.LOCATION != null){
		        				location.replace(data.LOCATION);
		        			}
		        			return;
		    	    	}
				}
	    	});
		}
			
		
			
		$(document).ready(function() {
			
			
			// datepicker
			$( "#datepicker1, #datepicker2" ).datepicker({
				dateFormat: 'yy-mm-dd',
				prevText: '이전 달',
				nextText: '다음 달',
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				dayNames: ['일','월','화','수','목','금','토'],
				dayNamesShort: ['일','월','화','수','목','금','토'],
				dayNamesMin: ['일','월','화','수','목','금','토'],
				showMonthAfterYear: true,
				changeMonth: true,
				changeYear: true,
				yearSuffix: '년'
			});
			
			 
			 $(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
			 $(document).on("keyup", "input:text[datetimeOnly]", function() {$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );});
			 
			 
			 
			 <c:if test="${requestScope.init eq 'Y'}">
				goSearch();
			 </c:if>
			 
		});
		
			
			
			
			
			
			
			
		</script>	
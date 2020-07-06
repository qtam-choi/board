<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<jsp:include  page="../include/header.jsp" flush="true"/>
<script type="text/javascript">	
	
	$(document).ready(function () {
		
	//	db_action('MAIN');
        
    });
	
	
	
	
	

</script>

</head>
<body>
        <div id="Wrap">

			<jsp:include  page="../include/top.jsp" flush="true"/>
            
            <!-- section start -->
            <section class="fclear">
                <jsp:include  page="../include/left.jsp" flush="true"/>
                
                <!--ContentWrap start-->
                <div
                    class="ContentWrap">
                    <!--title nav start-->
                    <h2>대시보드</h2>
                    <div class="nav">
                        <img src="<c:url value='/images/icon_home.png'/>" alt="home"><span><img src="<c:url value='/images/icon_nav.png'/>" alt="step">
                            대시보드</span>
                    </div>
                    <!--title nav end-->
                    <!--contents start-->
                    <div class="contents" style="padding-bottom:10px">
                        <h3 class="mt20">CPU/Memory 상태
                        </h3>
                        <ul class="dashboard-topbox">
                            <li>
                               <table class="BasicTbl4">
                                 <colgroup>
	                                <col width="33%">
	                                <col width="33%">
	                                <col width="">
	                            </colgroup>
                              	<tbody>
                                    <tr>
                                        <th>CPU 점유율</th>
                                        <th>Memory Total Space</th>
                                        <th>Memory Free Space</th>
                                    </tr>
                                    <tr>
                                        <td><fmt:formatNumber type="number"  pattern="0.00" value="${requestScope.cpu_usage} " />  %</td>
                                        <td>${requestScope.mem_tot}G</td>
                                        <td>${requestScope.mem_free}G</td>
                                    </tr>
                                </tbody>    
                                </table>
                            </li>
                        </ul>
                        
                    </div>
                    
                    <!--contents start-->
                    <!-- div class="contents mt10">
                        <h3 class="mt20">메모리 점유율
                        </h3>
                        <ul class="dashboard-topbox">
                            <li>
                               <table class="BasicTbl4">
                                    <tr>
                                        <th>매체
                                        </th>
                                        <th>전체가입자
                                        </th>
                                        <th>신규    가입자
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="Tblsub">스마트로
                                        </td>
                                        <td>10,000</td>
                                        <td>1,000</td>
                                    </tr>
                                    <tr>
                                        <td class="Tblsub">나이스
                                        </td>
                                        <td>10,000</td>
                                        <td>1,000</td>
                                    </tr>
                                    <tr>
                                        <td class="Tblsub">밴사명
                                        </td>
                                        <td>10,000</td>
                                        <td>1,000</td>
                                    </tr>
                                    <tr>
                                        <td class="Tblsub">전체
                                        </td>
                                        <td>30,000</td>
                                        <td>3,000</td>
                                    </tr>
                                </table>
                            </li>
                        </ul>
                        
                    </div-->
                  
                  
                    <!--contents end-->
                    <jsp:include  page="../include/footer.jsp" flush="true"/>
                </div>
                <!--ContentWrap end-->
            </section>
            <!-- section end -->
        </div>
    </body>
</html>
		
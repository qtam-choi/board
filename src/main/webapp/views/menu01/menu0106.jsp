<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<jsp:include  page="../include/header.jsp" flush="true"/>
<script type="text/javascript">	
	 


</script>

</head>
<body>
        <div id="Wrap">

			<jsp:include  page="../include/top.jsp" flush="true"/>
            
            <!-- section start -->
            <section class="fclear">

                <jsp:include  page="../include/left.jsp" flush="true"/>
                <!--ContentWrap start-->
                <div class="ContentWrap">
                    <!--title nav start-->
                    <h2>개인공인전자주소등록</h2>
                    <div class="nav">
                        <img src="<c:url value='/images/icon_home.png'/>" alt="home"><span><img src="<c:url value='/images/icon_nav.png'/>" alt="step">
                            서비스 조회</span>
                        <img src="<c:url value='/images/icon_nav.png'/>" alt="step"><span>
                            <strong>개인공인전자주소등록</strong>
                        </span>
                    </div>
                    <!--title nav end-->
                    <form name="form1" id="form1"  method="POST" >
                    	<INPUT type="hidden" id="curPage" name="curPage" value="${requestScope.paging.curPage}"/>
						
                    <table class="BasicTbl2 Tbl_top" style="margin-bottom:10px;">
                        <colgroup>
                            <col width="13%">
                            <col width="32%">
                            <col width="13%">
                            <col width="*">
                        </colgroup>
                        <tbody> 
                            <tr>
                                <th>일자</th>
                                <td colspan = "3">
                                   <input type="text" class="input5" id="datepicker1" autocomplete="off"  name="startDate"  readOnly value="${requestScope.startDate }">
                                    ~
                                    <input type="text" class="input5" id="datepicker2" autocomplete="off"  name="endDate"  readOnly value="${requestScope.endDate }">
                                  
                                </td>
                              </tr>
                              <tr>
                                <th>검색</th>
                                <td colspan="3">
                                    <select class="select1" style="width:160px;" name="searchType">
                                       <option value="usr_nm" <c:if test="${param.searchType == 'usr_nm'}"> selected="selected" </c:if>>이용자명</option> 
                                    </select>
                                    <input type="text" class="input5" style="width:300px;" name="searchValue" value="${param.searchValue}" onkeydown="javascript:if(event.keyCode==13){goSearch();}">
                                    <button type="button" class="btn1 bgblue" onclick="goSearch()">검 색</button>
                                </td>
                            </tr>  
                        </tbody>
                    </table>
                    <!--contents start-->
                    <div class="contents">
                        <div class="mt20" style=" display:table; table-layout:auto; width:95%; margin:0 auto">
                            <div style="display:table-cell; width:50%; text-align:left; padding:4px 0px; font-size:12px; ">총 검색 대상 <b style="color:#03F">${requestScope.paging.totalRecord}</b>개</div>
                            <div style="display:table-cell; width:50%; text-align:right; padding:4px 0px">
                                <select class="select1" style="width:80px;" name="rowCnt">
		                            <option <c:if test="${param.rowCnt == '10'}"> selected="selected" </c:if> value="10">10</option>
		                            <option <c:if test="${param.rowCnt == '20'}"> selected="selected" </c:if> value="20">20</option>
		                            <option <c:if test="${param.rowCnt == '30'}"> selected="selected" </c:if> value="30">30</option>
		                            <option <c:if test="${param.rowCnt == '40'}"> selected="selected" </c:if> value="40">40</option>
		                            <option <c:if test="${param.rowCnt == '50'}"> selected="selected" </c:if> value="50">50</option>
		                        </select>
                            </div>
                        </div>
                        <table class="BasicTbl4 Tblink">
                            <col width="5%"/>
                            <col width="13%"/>
                            <col width="13%"/>
                             <col width="13%"/>
                            <col width="13%"/>
                            <col width="13%"/>
                            <col width="13%"/>
                            <col width=""/>
                            <tr>
                                <th>No</th>
                                <th>구분</th>
                                <th>이용자명</th>
                                <th>개인CI</th>
                                <th>등록결과</th>
                                <th>결과메시지</th>
                                <th>공인전자주소결과</th>
                                <th>등록일시</th>
                            </tr>
                             <!-- 리스트 -->
		 					<c:forEach items="${requestScope.dataList}" var="list" varStatus="status">
		 					
		                     <tr>
                        		<td>${requestScope.paging.listNo - status.index}</td>
                        		<td>${list.gubun_nm }</td>
                        		<td>${list.usr_nm }</td>
                        		<td>${list.usr_unq_no }</td>
                                <td>${list.result_code }</td>
                                <td>${list.result_msg}</td>
                                <td>${list.usr_cea}</td>
                                <td><fmt:formatDate value="${list.ins_date}" pattern="yyyy.MM.dd hh:mm:ss" /></td> 
                            </tr>
                             </c:forEach>
                    
                    		   
		                   <c:if test="${fn:length(requestScope.dataList) == 0}">
								<tr><td colspan="8" style="padding:10px;">검색된 내용이 없습니다.</td></tr>
							</c:if> 	
                        </table>
                        <!-- s:paging -->
						<c:if test="${fn:length(requestScope.dataList) != 0}">
						
							<jsp:include  page="../include/paging.jsp" flush="true">
							    <jsp:param name="curPage" value="${requestScope.paging.curPage}" />
							    <jsp:param name="prevLink" value="${requestScope.paging.prevLink}" />
							    <jsp:param name="nextLink" value="${requestScope.paging.nextLink}" />
							    <jsp:param name="totalPage" value="${requestScope.paging.totalPage}" />
							    <jsp:param name="firstPage" value="${requestScope.paging.firstPage}" />
							    <jsp:param name="lastPage" value="${requestScope.paging.lastPage}" />
							</jsp:include>
						
						</c:if> 
						<!-- e: 버튼 --> 
                    </div>
                    
                    </form>
                    
                    <!--contents end-->
                    <jsp:include  page="../include/footer.jsp" flush="true"/>
                </div>
                <!--ContentWrap end-->
            </section>
            <!-- section end -->
        </div>
    </body>
</html>
		
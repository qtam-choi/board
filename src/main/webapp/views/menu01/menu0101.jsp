<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<jsp:include  page="../include/header.jsp" flush="true"/>
<script type="text/javascript">	
	 
function goDetail(biz_cd, msg_cd, make_d, send_seq, instant_seq, seq_no){
	var sendObj = document.getElementById("form1");
	
	$('#biz_cd').val(biz_cd);
	$('#msg_cd').val(msg_cd);
	$('#make_d').val(make_d);
	$('#send_seq').val(send_seq);
	$('#instant_seq').val(instant_seq);
	$('#seq_no').val(seq_no);
     
	$('#form1').attr('action', 'menu0101Detail.do');
	sendObj.submit();
	
} 


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
                    <h2>발송현황</h2>
                    <div class="nav">
                        <img src="<c:url value='/images/icon_home.png'/>" alt="home"><span><img src="<c:url value='/images/icon_nav.png'/>" alt="step">
                            서비스 조회</span>
                        <img src="<c:url value='/images/icon_nav.png'/>" alt="step"><span>
                            <strong>발송현황</strong>
                        </span>
                    </div>
                    <!--title nav end-->
                    <form name="form1" id="form1"  method="POST" >
                    	<INPUT type="hidden" id="curPage" name="curPage" value="${requestScope.paging.curPage}"/>
						<INPUT type="hidden" id="biz_cd" name="biz_cd" value=""/>
						<INPUT type="hidden" id="msg_cd" name="msg_cd" value=""/>
						<INPUT type="hidden" id="make_d" name="make_d" value=""/>
						<INPUT type="hidden" id="send_seq" name="send_seq" value=""/>
						<INPUT type="hidden" id="instant_seq" name="instant_seq" value=""/>
						<INPUT type="hidden" id="seq_no" name="seq_no" value=""/>
					
                    
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
                                <td>
                                   <input type="text" class="input5" id="datepicker1" autocomplete="off"  name="startDate"  readOnly value="${requestScope.startDate }">
                                    ~
                                    <input type="text" class="input5" id="datepicker2" autocomplete="off"  name="endDate"  readOnly value="${requestScope.endDate }">
                                </td>
                                <th>구분</th>
                                <td>
                                     	<input type="radio" id="r1"  name="gubun"  value="open_api" <c:if test="${param.gubun eq null ||  param.gubun == 'open_api'}"> checked </c:if>/>
                                        <label for="r1"><span></span>자체</label>
                                        <input type="radio" id="r2"  name="gubun" value="paper_less" <c:if test="${param.gubun == 'paper_less'}"> checked </c:if>/>
                                        <label for="r2"><span></span>페이퍼리스</label>
                                        <input type="radio" id="r3"  name="gubun" value="std" <c:if test="${param.gubun == 'std'}"> checked </c:if>/>
                                        <label for="r3"><span></span>STD</label>
                                </td>
                            </tr>
                            <tr>
                                <th>성공여부</th>
                                <td>
                                    <select class="select1" style="width:160px;" name="success_yn">
                                        <option value="">전 체</option>
                                        <option value="Y"  <c:if test="${param.success_yn == 'Y'}"> selected="selected" </c:if>>성공</option>
                                        <option value="N" <c:if test="${param.success_yn == 'N'}"> selected="selected" </c:if>>실패</option>
                                    </select>
                                </td>
                                <th>열람</th>
                                <td>
                                    <select class="select1" style="width:160px;" name="open_yn">
                                        <option value="">전 체</option>
                                        <option value="Y" <c:if test="${param.open_yn == 'Y'}"> selected="selected" </c:if>>열람</option>
                                        <option value="N" <c:if test="${param.open_yn == 'N'}"> selected="selected" </c:if>>미열람</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>검색</th>
                                <td colspan="3">
                                    <select class="select1" style="width:160px;" name="searchType">
                                        <option value="service_cd" <c:if test="${param.searchType == 'service_cd'}"> selected="selected" </c:if>>서비스코드</option>
                                        <option value="src_key" <c:if test="${param.searchType == 'src_key'}"> selected="selected" </c:if>>관리키</option>
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
                            <col width="11%"/>
                            <col width="19%"/>
                            <col width="8%"/>
                            <col width="10%"/>
                            <col width="20%"/>
                            <col width="7%"/>
                            <col width="7%"/>
                            <col width=""/>
                            <tr>
                                <th>No</th>
                                <th>기관</th>
                                <th>문서</th>
                                <th>생성일자</th>
                                <th>관리키</th>
                                <th>MMS제목</th>
                                <th>성공여부</th>
                                <th>열람여부</th>
                                <th>토큰생성일자</th>
                            </tr>
                             <!-- 리스트 -->
		 					<c:forEach items="${requestScope.dataList}" var="list" varStatus="status">
		 					
		                     <tr onclick="goDetail('${list.biz_cd}', '${list.msg_cd}' , '${list.make_d}', '${list.send_seq}', '${list.instant_seq}', '${list.seq_no}');" >
                        		<td>${requestScope.paging.listNo - status.index}</td>
                                <td>${list.biz_cd }(${list.client_nm })</td>
                                <td>${list.mms_bsns_dvcd }(${list.mms_title })</td>
                                <td>
                                 	<fmt:parseDate var="make_d" value="${list.make_d }" pattern="yyyyMMdd" />
                                	<fmt:formatDate value="${make_d}" pattern="yyyy.MM.dd" />
                                </td>
                                <td>${list.src_key }</td>
                                <td>${list.mms_title }</td>
                                <td>${list.success_yn }</td>
                                <td>${list.open_yn }</td>
                                <td><fmt:formatDate value="${list.token_cre_date}" pattern="yyyy.MM.dd" /></td>
                            </tr>
                             </c:forEach>
                    
                    		   
		                   <c:if test="${fn:length(requestScope.dataList) == 0}">
								<tr><td colspan="9" style="padding:10px;">검색된 내용이 없습니다.</td></tr>
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
		
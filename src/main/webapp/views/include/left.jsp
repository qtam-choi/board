<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="urlString"  value="${pageContext.request.requestURL}" />


<!-- cate_wrap start -->
  <div class="cate_wrap">
      <div class="menu_click"><img src="<c:url value='/images/icon_menu2.png'/>" alt="menu open&close"></div>
      <!-- left menu start -->
      <div class="left_menu">
          <ul class="sidebar-menu">
              <li class="treeview <c:if test="${fn:contains(urlString, 'main')}"> active </c:if>">
                  <a href="<c:url value='/main.do'/>">
                      <span>현재상태조회</span>
                  </a>
              </li>
              
              <li class="treeview <c:if test="${fn:contains(urlString, '/menu01/')}"> active </c:if>">
                  <a href="">
                      <span>서비스조회</span>
                  </a>
                  <ul class="treeview-menu">
                      <li <c:if test="${fn:contains(urlString, 'menu0101')}">class="active" </c:if>>
                          <a href="<c:url value='/menu01/menu0101.do'/>">발송현황</a>
                      </li>
                      <li <c:if test="${fn:contains(urlString, 'menu0102')}">class="active" </c:if>>
                          <a href="<c:url value='/menu01/menu0102.do'/>">발송결과</a>
                      </li>
                      <li <c:if test="${fn:contains(urlString, 'menu0103')}">class="active" </c:if>>
                          <a href="<c:url value='/menu01/menu0103.do'/>">유통증명등록</a>
                      </li>
                      <li <c:if test="${fn:contains(urlString, 'menu0104')}">class="active" </c:if>>
                          <a href="<c:url value='/menu01/menu0104.do'/>">개통신청서</a>
                      </li>
                      <li <c:if test="${fn:contains(urlString, 'menu0105')}">class="active" </c:if>>
                          <a href="<c:url value='/menu01/menu0105.do'/>">사업자공인전자주소등록</a>
                      </li>
                       <li <c:if test="${fn:contains(urlString, 'menu0106')}">class="active" </c:if>>
                          <a href="<c:url value='/menu01/menu0106.do'/>">개인공인전자주소등록</a>
                      </li>
                      <li <c:if test="${fn:contains(urlString, 'menu0107')}">class="active" </c:if>>
                          <a href="<c:url value='/menu01/menu0107.do'/>">유통증명발급신청</a>
                      </li>
                  </ul>
              </li>
              
             
              
              <li class="treeview  <c:if test="${fn:contains(urlString, '/menu02/')}"> active </c:if>">
                  <a href="<c:url value='/menu02/menu0201.do'/>">
                      <span>가입자 관리</span>
                  </a>
              </li>
              
              
              
               <li class="treeview <c:if test="${fn:contains(urlString, '/menu03/')}"> active </c:if>">
                  <a href="">
                      <span>통계</span>
                  </a>
                  <ul class="treeview-menu">
                      <li <c:if test="${fn:contains(urlString, 'menu0301')}">class="active" </c:if>>
                          <a href="<c:url value='/menu03/menu0301.do'/>">가입통계</a>
                      </li>
                      <li <c:if test="${fn:contains(urlString, 'menu0102')}">class="active" </c:if>>
                          <a href="<c:url value='/menu03/menu0302.do'/>">발송통계</a>
                      </li>
                  </ul>
              </li> 
             
              
              <li class="treeview  <c:if test="${fn:contains(urlString, '/menu04/')}"> active </c:if>">
                  <a href="<c:url value='/menu04/menu0401.do'/>">
                      <span>시스템관리</span>
                  </a>
                  <ul class="treeview-menu">
                      <li <c:if test="${fn:contains(urlString, 'menu0401')}">class="active" </c:if>>
                          <a href="<c:url value='/menu04/menu0401.do'/>">사용자 관리</a>
                      </li>
                  </ul>
              </li>
              
          </ul>
      </div>
      <!-- left menu  end-->
  </div>
  <!-- cate_wrap end -->
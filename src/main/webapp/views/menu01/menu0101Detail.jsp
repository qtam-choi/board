<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<jsp:include  page="../include/header.jsp" flush="true"/>
<script type="text/javascript">	

$(document).ready(function(){
    //검은 막 띄우기
    $(".openPhone").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".phone .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $(".phone").hide();  
    });       
  
});


function wrapWindowByMask(){
	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //윈도우 같은 거 띄운다.
    $(".phone").show();

}

	
function goDetail2(){
	var sendObj = document.getElementById("form1");
	
	$('#form1').attr('action', 'menu0101Detail2.do');
	sendObj.submit();
	
} 

</script>

<style> 
/* 팝업으로 뜨는 휴대폰 css  */ 
.message_area {height:587px; overflow-y:auto}
.phone{display:none;position:absolute;left:50%;top:50px;margin-left:-250px;width:500px;height:844px;background:url(<c:url value='/images/phone.png'/>) no-repeat;z-index:10000;}
.phone_box {background-color:#9BBBD4; width:374px; height:637px; margin:101px 0px 0px 60px;}
.p_tit {height:50px; border-bottom:1px solid #006699; font-size:22px; font-weight:bold; text-align:center; line-height:50px;}
.message_box { position:relative; top:20px; margin-left:10px;}
.message_box .box_top { background:url(<c:url value='/images/ballon01.png'/>) no-repeat; width:317px; height:25px;}
.message_box .mess { background:url(<c:url value='/images/ballon02.png'/>) repeat-y; width:317px; height:*; }
.message_box .mess_txt { font-family: "맑은 고딕","Malgun Gothic","Nanumun Gothic","돋움","Dotum","Arial","sans-serif"; font-size:16px; padding: 0px 20px; }
.message_box .box_bottom { background:url(<c:url value='/images/ballon03.png'/>) no-repeat; width:317px; height:22px; margin-bottom:30px;}
</style>

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
                     <!--ContentWrap start-->
                    <div class="contents">
                        <h3 class="mt30">가맹점 문자발송화면</h3>
                        <table class="BasicTbl2 mt30">
                            <colgroup>
                                <col width="20%">
                                <col width="*">
                            </colgroup>
                            <tbody>
                               <tr>
									<th>발송번호</th>
									<td>02-100</td>
								  </tr>
								  <tr>
									<th>제목</th>
									<td>${requestScope.dataView.mms_title}</td>
								  </tr>
								  <tr>
									<th>이미지</th>
									<td><img src="<c:url value='/images/server_img.png' />" alt=" "></td>
								  </tr>
								  <tr>
									<th>내용</th>
									<td>${requestScope.dataView.mms_dtl_cnts}</td>
								  </tr>
								  <tr>
									<th>본인확인</th>
									<td><a href="https://www.kt.co.kr/">https://</a><a href="https://www.kt.co.kr/">www.kt.co.kr/</a>을 클릭하시면 <br>전자영수증 확인가능합니다.</td>
								  </tr>
								  <tr>
									<th>문의전화</th>
									<td>문의전화<br>
								KT EDI 고객센터 : 080-318-5306<br>
								 &gt;&gt; ARS    1번 선택</td>
								  </tr>
								  <tr>
									<th>거부확인</th>
									<td>거부하기 : https://www.kt.co.kr/reject</td>
								  </tr>
                            </tbody>
                        </table>
                        <!-- 등록-->
                        <div class="btngroup textcenter">
                            <button type="button" class="btn1 bgwhite" onClick="javascript:location.href='menu0101.do'">뒤로가기</button>
                            <button type="button" class="btn1 bgbluesky openPhone">미리보기</button>
                        </div>
                        <!-- 등록-->
                    </div>
                    <!--contents end-->
                    <jsp:include  page="../include/footer.jsp" flush="true"/>
                </div>
                <!--ContentWrap end-->
            </section>
            <!-- section end -->
        </div>
        
        
        <!-- 휴대폰 미리보기 팝업 -->
	<div class="phone">
		<div class="phone_box">
		
			<div class="p_tit">SMS 메세지 미리보기</div>
			
			<div class="message_area">
				<div class="message_box">
					<div class="box_top"></div>
					<div class="mess">
						<div class="mess_txt">
						<!-- 영수증 메시지 -->
						
						[더설렘에서 전자영수증 발행하였습니다.]<br>
						발송번호: 02-100
						
						<br><br>
						<img src="<c:url value='/images/server_img.png' />" alt=" ">
						<br><br>
						
						이우종님은 2019년 12월 5일에
						더설렘에서 만원을 결제하여
						스마트 전자영수증을 발행하였습니다.
						
						<br><br>
						
						<a href="https://www.kt.co.kr/">https://www.kt.co.kr/</a>을 클릭하시면
						전자영수증 확인가능합니다.
						
						<br><br>
						
						문의전화<br>
						KT EDI 고객센터 : 080-318-5306<br>
						>> ARS 1번 선택<br>
						<br>
						거부하기 : <a href="https://www.kt.co.kr/reject">https://www.kt.co.kr/reject</a>
						<br>
		
						<!-- 영수증 메시지 -->
						</div>
					</div>
					<div class="box_bottom"></div>
				</div>
			</div>
		</div>
		<!-- 닫기 버튼 -->
			<div style="text-align:center; padding:20px;">
				<a href="#" class="close"><img src="<c:url value='/images/close_window.png' />"></a>
			</div>
		<!-- 닫기 버튼 -->
	</div>
	<!-- 휴대폰 미리보기 팝업 -->
        
    </body>
</html>
		
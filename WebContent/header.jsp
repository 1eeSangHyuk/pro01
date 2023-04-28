<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path_h = request.getContextPath();
%>
<%
	String uid = "";
	if (session.getAttribute("uid") != null){
		uid = (String) session.getAttribute("uid");
	}
%> 
<header class="hd">
    <nav class="tnb">
        <div class="tnb_wrap">
            <a href="<%=path_h %>/index.jsp" class="logo">
                <img src="<%=path_h %>/img/top_logo.png" alt="Pulsar_logo">
            </a>
            <ul class="left_tnb">
            <%
            	if (uid.equals("")){
            %>
            	<li><a href="<%=path_h %>/login.jsp">로그인</a></li>
                <li><a href="<%=path_h %>/agreement.jsp">회원가입</a></li>
            <%
            	} else if (uid != null){
            %>	
            	<li><%=uid %>님, 안녕하세요!&nbsp;&nbsp;&nbsp;<a href="<%=path_h %>/mypage.jsp">마이페이지</a></li>
            	<li><a href="<%=path_h %>/basket.jsp">장바구니</a></li>
                <li><a href="<%=path_h %>/orderView.jsp">주문조회</a></li>
                <li><a href="<%=path_h %>/myShoping.jsp">마이쇼핑</a></li>
                <li><a href="<%=path_h %>/logout.jsp">로그아웃</a></li>
            <%
            	}
            %>
            </ul>
        </div>
    </nav>
    <div class="main">
        <div class="main_wrap">
            <nav class="gnb">
                <ul class="gnb_fr">
                    <li><a href="">PRODUCT</a>
                        <div class="sub item1">
                            <ul class="dp2">
                                <li><a href="prod_mouse.html">게이밍 마우스</a></li>
                                <li><a href="prod_keyboard.html">게이밍 키보드</a></li>
                                <li><a href="prod_mousepad.html">마우스 패드</a></li>
                                <li><a href="prod_accessories.html">마우스 악세서리</a></li>
                                <li><a href="">슈퍼글라이드</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="">COMMUNITY</a>
                        <div class="sub item2">
                            <ul class="dp2">
                                <li><a href="<%=path_h %>/community/community.jsp#page1">공지사항</a></li>
                                <li><a href="<%=path_h %>/community/community.jsp#page2">Review</a></li>
                                <li><a href="<%=path_h %>/community/community.jsp#page3">FAQ</a></li>
                                <li><a href="<%=path_h %>/community/community.jsp#page5">1:1문의</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="contact.html">CONTACT</a></li>
                    <li><a href="">고객지원</a>
                        <div class="sub item4">
                            <ul class="dp2">
                                <li><a href="download.html">다운로드</a></li>
                                <li><a href="as.html">A/S신청</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
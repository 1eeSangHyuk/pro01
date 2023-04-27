<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>포트폴리오 - Pulsar</title>
    <meta name="subject" content="Pulsar 벤치마킹 사이트">
    <meta name="keywords" content="게이밍 마우스, 펄사, 마우스, 가벼운 마우스, 게이밍 키보드,
     키보드, 펄사 마우스, 펄사 키보드, 게임 마우스, 마우스 게이밍, 고사양 마우스, paw3370, 초경량 마우스, 
     경량 마우스, 추천 마우스, 펄사, pulsar">
    <meta name="description" content="(Pulsar Gaming Gears) 펄사 게이밍 기어스 한국 공식 몰 입니다.
     펄사 게이밍 의 초경량 게이밍 마우스, 커스텀 기계식 키보드, 커스텀 게이밍 키보드, 헤드셋 등의 다양한 게이밍 장비를 지금 온라인으로 구매하세요! 
     빠른배송, 기획특가, 신규회원 이벤트">
    <meta name="author" content="LSH">
    <link rel="shortcut icon" href="./img/favicon_pulsar.ico">
    <meta name="og:site_name" content="Pulsar">
    <meta name="og:title" content="포트폴리오 - Pulsar">
    <meta name="og:description" content="(Pulsar Gaming Gears) 펄사 게이밍 기어스 한국 공식 몰 입니다. 
    펄사 게이밍 의 초경량 게이밍 마우스, 커스텀 기계식 키보드, 커스텀 게이밍 키보드, 헤드셋 등의 다양한 게이밍 장비를 지금 온라인으로 구매하세요! 
    빠른배송, 기획특가, 신규회원 이벤트">
    <meta name="og:url" content="https://1eeSangHyuk.github.io/web1">
    <meta name="og:image" content="./img/top_logo.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Poppins:wght@900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link rel="stylesheet" href="common.css">


    <style>      
        .vs { clear:both; position:relative; width: 100vw; height:100vh;
        overflow:hidden; }
        .vs video { display: block; width: 100vw;}

        #page4 { height: 200px; }

        #page1 { clear:both; position:relative; width: 100vw; height:150vh; overflow:hidden; background-color: #000; color: #fff; }
        #page1 .page_wrap { width: 100vw; padding-top: 0px; }
        .grid_fr { clear:both; width: 100vw; }
        .grid_fr .grid_box { clear:both; width: 100vw; }
        .grid_box li { width: 50vw; float: left; }
        .grid_box li a { display: block; color: #fff; background-position: center; background-repeat: no-repeat;
        background-size:cover; font-size: 30px; box-sizing: border-box; height:50vh; }
        .grid_box li a.item1 { background-image: url(./img/Pulsar\ Gaming\ Gears\ Superglide.jpg);}
        .grid_box li a.item2 { background-image: url();}
        .grid_box li a.item3 { background-image: url(./img/Pulsar\ Gaming\ Gears\ Xlite\ Grip\ tape.jpg);}
        .grid_box li a.item4 { background-image: url(./img/Pulsar\ Gaming\ Gears\ PCMK\ TKL\ Mechanical\ Gaming\ Keyboard.jpg);}
        .grid_box li a.item5 { background-image: url(./img/Pulsar\ Gaming\ Gears\ Pulsar\ Keycap_puller.jpg);}
        .grid_box li a.item6 { background-image: url(./img/Pulsar\ Gaming\ Gears\ paracontrol\ mouse\ pad.jpg);}
        .grid_box li a .grid_tit { display: block; line-height: 50vh; text-align: center; background-color: #ffffff00;}
        .grid_box li a .grid_tit:hover { display: block; line-height: 50vh; text-align: center; background-color: #00000041; transition: 0.3s ease-in;}

        
        #page2 { background-color: #ffffff; color: #fff; height:450px; }
        #page2 .page_title { display: none; }
        #page2 .tit_box { clear:both; padding-top: 80px; }
        #page2 .page_wrap { clear: both; width: 1580px; height: 350px; margin: 0 auto; text-align: center; padding-top: 50px; padding-bottom: 50px;}
        .colm_fr, .lst { clear:both; } 
        .lst li { float:left; width: 350px; height: 350px; box-sizing: border-box; background-position: center; 
        background-repeat: no-repeat; background-size: cover;}
        .lst .it { margin-right: 60px; }
        .lst .it:last-child { margin-right: 0px; } 
        .lst .item1 { background-image: url(./img/menu_mouse.jpg); } 
        .lst .item2 { background-image: url(./img/menu_keyboard.jpg);} 
        .lst .item3 { background-image: url(./img/menu_mouse\ pad.jpg);} 
        .lst .item4 { background-image: url(./img/menu_mouse\ accessories.jpg);} 
        .lst .item_tit { display: block; line-height: 300px; width: 350px; height: 350px; }
        .lst .item_tit:hover { display: block; line-height: 300px; width: 350px; height: 350px; text-align: center; font-size: 30px; background-color: #272727a9;
        transition: 0.1s ease-in;}
        .lst li a h3 { color:#fff; }

        /* .tb1 */

        #page0 .page_title { display: none; }


        </style>
        <!-- .sub 안뜨는거 + 한글정렬 -->
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="container">
        <div class="content">
            <section class="page" id="page4">
                <h2 class="page_title">페이지제목0</h2>
                <div class="page_wrap">
                    <h2>000a0a</h2>
                </div>
            </section>
            <section class="page" id="page2">
                <h2 class="page_title">페이지제목2</h2>
                <div class="page_wrap">
                    <article class="colm_fr">
                        <ul class="lst">
                            <li class="it item1">
                                <a href="prod_mouse.html" class="item1">
                                    <span class="item_tit">마우스</span>
                                </a>
                            </li>
                            <li class="it item2">
                                <a href="prod_keyboard.html" class="item2">
                                    <span class="item_tit">키보드</span>
                                </a>
                            </li>
                            <li class="it item3">
                                <a href="prod_mousepad.html" class="item3">
                                    <span class="item_tit">마우스패드</span>
                                </a>
                            </li>
                            <li class="it item4">
                                <a href="prod_accessories.html" class="item4">
                                    <span class="item_tit">악세서리</span>
                                </a>
                            </li>
                        </ul>
                    </article>
                </div>
            </section>
            <section class="page" id="page0">
                <h2 class="page_title">페이지제목0</h2>
                <div class="page_wrap">
                    <figure class="vs">
                        <div class="img_box">
                            <video src="./vid/Pulsar_PCMK_Customizable_keyboard.mp4" muted autoplay loop></video>
                        </div>
                    </figure>
                </div>
            </section>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <article class="grid_fr">
                        <ul class="grid_box">
                            <li>
                                <a href="" class="item1">
                                    <span class="grid_tit">슈퍼글라이드 마우스 피트</span>
                                </a>
                                <a href="download.html" class="item2">
                                    <span class="grid_tit">소프트웨어 / 메뉴얼 / 스펙 다운로드 하러가기</span>
                                </a>
                                <a href="prod_accessories.html" class="item3">
                                    <span class="grid_tit">그립감을 위한 Xlite용 0.5mm 씬 그립테이프</span>
                                </a>
                            </li>
                            <li>
                                <a href="prod_keyboard.html" class="item4">
                                    <span class="grid_tit">PCMK 커스터마이징 키보드</span>
                                </a>
                                <a href="prod_keyboard.html" class="item5">
                                    <span class="grid_tit">MX 스타일 스위치와 호환 가능한 펄사 키캡</span>
                                </a>
                                <a href="prod_mousepad.html" class="item6">
                                    <span class="grid_tit">정밀제어를 위한 파라컨트롤 마우스패드</span>
                                </a>
                            </li>
                        </ul>
                    </article>
                </div>
            </section>
        </div>
        <%@ include file="footer.jsp" %>
	</div>
</body>
</html>
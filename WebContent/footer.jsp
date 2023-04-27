<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
        <footer class="ft">
            <article class="row row1">
                <div class="ft_wrap">
                    <div class="question left">
                        <div class="section qna">
                            <p class="title">고객문의</p>
                        </div>
                        <div class="section country">
                            <select name="favo" id="favo" class="favo right" onchange="favo(this)">
                                <option value="">한국</option>
                                <option value="https://pulsar.gg">GLOBAL</option>
                                <option value="https://pulsargg.eu">EU</option>
                                <option value="https://pulsargg.jp">日本</option>
                            </select>
                            <script>
                                function favo(s){
                                    var hs = s.value;
                                    if(hs!=""){
                                        window.open(hs, "팝업");
                                    }
                                }    
                            </script>
                        </div>    
                    </div>
                    <div class="info right">
                        <div class="section company">
                            <p class="title">COMPANY INFO</p>
                            <span>
                                <b class="mt">COMPANY</b>
                                주식회사에이플러스엑스
                                &nbsp;&nbsp;&nbsp;
                            </span>
                            <span>
                                <b class="mt">OWNER</b>
                                심건희
                                &nbsp;&nbsp;&nbsp;
                            </span>
                            <span>
                                <b class="mt">PRIVACY MANAGER</b>
                                황서윤(support@aplusx.gg)
                                &nbsp;&nbsp;&nbsp;
                            </span>
                            <br>
                            <span>
                                <b class="mt">TEL</b>
                                070-7797-7471
                                &nbsp;&nbsp;&nbsp;
                            </span>
                            <span>
                                <b class="mt">E-MAIL</b>
                                support@pulsargg.kr
                                &nbsp;&nbsp;&nbsp;
                            </span>
                            <span>
                                <b class="mt">BUSINESS LICENSE</b>
                                53-87-01791[사업자정보확인]
                                &nbsp;&nbsp;&nbsp;
                            </span>
                            <br>
                            <span>
                                <b class="mt">MALL ORDER LICENSE</b>
                                2022-용인기흥-1765
                                &nbsp;&nbsp;&nbsp;
                            </span>
                            <span>
                                <b class="mt">ADDRESS</b>
                                16976 경기도 용인시 기흥구 기흥로 58-1 (구갈동) 614호
                                &nbsp;&nbsp;&nbsp;
                            </span>
                        </div>
                        <div class="section bank">
                            <p class="title">BANK INFO</p>
                            <span>
                                <b class="mt">우리은행</b>
                                1005-804-275894
                                &nbsp;&nbsp;&nbsp;
                            </span>
                            <br>
                            <span>
                                <b class="mt">예금주</b>
                                (주)에이플러스엑스
                                &nbsp;&nbsp;&nbsp;
                            </span>
                        </div>
                        <div class="section fnb">
                            <span>
                                <b><a href="about.html">회사소개</a></b>&nbsp;&nbsp;&nbsp;
                                <b><a href="agreement.html">이용약관</a></b>&nbsp;&nbsp;&nbsp;
                                <b><a href="warranty.html">Warranty</a></b>&nbsp;&nbsp;&nbsp;
                                <b><a href="shopGuide.html">쇼핑몰이용안내</a></b>&nbsp;&nbsp;&nbsp;
                                <b><a href="privacy.html">개인정보취급방침</a></b>&nbsp;&nbsp;&nbsp;
                            </span>
                        </div>
                        <div class="section slogan">
                            COPYRIGHT © 주식회사에이플러스엑스 ALL RIGHTS RESERVED.<br>
                        </div>
                    </div>
                </div>
            </article>
            <article class="row row2">
                
            </article>
        </footer>
    	<div class="fix_area">
    	    <a href="#" class="cir_box totop">↑</a>
    	</div> 
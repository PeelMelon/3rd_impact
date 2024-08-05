<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "dob.DBManager" %>

<%
    HttpSession session1 = request.getSession(false);
    String memberID = (session != null) ? (String) session.getAttribute("memberID") : null;
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>drama_main</title>
    <link rel="stylesheet" href="./css/drama_page.css">
    <!-- <link rel="stylesheet" href="/YouTube/css/main.css"> -->
    <script
    src="https:/code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
    <!-- 2. favicon(favorite icon) 세팅 -->
    <link rel="shortcut icon" href="./favicon.ico" />
    <link rel="icon" href="./favicon.png" />
    <!-- reset.css 세팅(cdn) -->
    <link href="https:/cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <!-- 커스템 css파일 세팅(local) -->
    <link href="./css/youtubemain.css" rel="stylesheet">
    <link href="./css/music.css" rel="stylesheet">
    <link href="./css/popup.css" rel="stylesheet">
    <!-- 오픈 그래프 설정(더 많은 속성을 보고 싶으면 https://ogp.me) -->
    <meta property="og:image" content="https:/www.youtube.com/img/desktop/yt_1200.png">
    <meta property="fb:app_id" content="87741124305">
    <meta name="description" content="YouTube에서 마음에 드는 동영상과 음악을 감상하고, 직접 만든 콘텐츠를 업로드하여 친구, 가족뿐 아니라 전 세계 사람들과 콘텐츠를 공유할 수 있습니다.">
    <meta name="keywords" content="동영상, 공유, 카메라폰, 동영상폰, 무료, 올리기">
    <meta name="theme-color" content="rgba(255, 255, 255, 0.98)">
    <!-- lodash -->
    <script src="https:/cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
	<script src="https:/cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script src="https:/cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https:/cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https:/cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- swiper 6.8.4 -->
    <script src="https:/cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js" integrity="sha512-BABFxitBmYt44N6n1NIJkGOsNaVaCs/GpaJwDktrfkWIBFnMD6p5l9m+Kc/4SLJSJ4mYf+cstX98NYrsG/M9ag==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css" integrity="sha512-aMup4I6BUl0dG4IBb0/f32270a5XP7H1xplAJ80uVKP6ejYCgZWcBudljdsointfHxn5o302Jbnq1FXsBaMuoQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https:/code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- 폰트 설정 -->
    <link rel="preconnect" href="https:/fonts.gstatic.com" />
    <link href="https:/fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https:/fonts.googleapis.com">
    <link rel="preconnect" href="https:/fonts.gstatic.com" crossorigin>
    <link href="https:/fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <!-- 아이콘 설정 --> 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css" integrity="sha512-aMup4I6BUl0dG4IBb0/f32270a5XP7H1xplAJ80uVKP6ejYCgZWcBudljdsointfHxn5o302Jbnq1FXsBaMuoQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- script -->
    <script defer src="./js/drama_page.js"></script>
    <script defer src="./YouTube/js/main.js"></script>
    <script src="https:/kit.fontawesome.com/12d13cde63.js" crossorigin="anonymous"></script>
    <!-- <script defer src="./js/jquery-3.7.1.js"></script> -->
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <!-- Swiper JavaScript -->
    <script src="https:/unpkg.com/swiper/swiper-bundle.min.js"></script>
    
</head>
<body>
    <!-- ------HEADER ------ -->
   <header class="header">
    <div class="header_logo">
        <button id = "toggleButton">
            <i class = "fas fa-bars"></i>
        </button>
        <a href="./main.jsp">
        <img src="./images/logo1.png" alt="집요정TV">
    </div>

    <div class="search">
        <form action="">
            <div class = "search-inner">
            <input type="search" placeholder="검색">
            </div>
            <button><i class="fas fa-search"></i></button>
        </form>
    </div>
    <div class="header_icons">	
    	 <%
            if (memberID == null) {
        %>
            <a href="login.jsp"><i id="login" class="fas fa-user-circle">로그인</i></a>
        <%
            } else {
        %>
            <span id="my_id"><%= memberID %></span>
            <a href="logout.jsp">
            <button class="logout-btn">Logout</button>
            </a>
            <a href="upload_form.jsp"><i class="fas fa-video"></i></a>
            <i class="fas fa-ellipsis-h"></i>
            <i class="fas fa-bell"></i>
        <%
            }
        %>
    </div>
   </header>
    
           <!------MAIN------>
   <div class="YtBody">
    <div id = "sidebar" class="sidebar">
        <div class="sidebar_nav">
            <div class="nav-item">
                <i class="fas fa-home"></i>
                <span id="123">홈</span>
                <script>
                    document.getElementById('123').addEventListener('click', function() {
                        window.location.href = 'main.jsp'; // 음악 파일의 정확한 경로를 입력하세요.
                    });
                </script>
            </div>
            <!-- <div class="nav-item">
                <i class="fa-solid fa-bolt"></i>
                <span>Shorts</span>
            </div> -->
            <div class="nav-item">
                <i class="fab fa-youtube"></i>
                <span>구독</span>
            </div>
        </div>
        <hr>
        <div class="sidebar_nav">
            <div class="nav-item na">
				<i class="fas fa-list"></i>
                <span>나</span>
            </div>
            <div class = "sub-menu">
                <div class="nav-item items">
                    <i class="fa-solid fa-history"></i>
                    <span>시청기록</span>
                </div>
                <div class="nav-item items">
                    <i class="fas fa-play"></i>
                    <span>내 동영상</span>
                </div>
                <div class="nav-item items">
                    <i class="fas fa-clock"></i>
                    <span>나중에 볼 영상</span>
                </div>
                <div class="nav-item items">
                    <i class="fas fa-thumbs-up"></i>
                    <span>좋아요 표시한 영상</span>
                </div>
            </div>
		</div>
        <hr>
         <div class="sidebar_nav">
            <div class="nav-item">
                <i class="fa-solid fa-fire"></i>
                <span>인기 급상승</span>
            </div>
            <div class="nav-item">
                <i class="fa-solid fa-bag-shopping"></i>
                <span>쇼핑</span>
            </div>
            <div class="nav-item" id="music-button">
                <i class="fa-solid fa-music"></i>
                <span>음악</span>
            </div>
        
            <script>
                document.getElementById('music-button').addEventListener('click', function() {
                    window.location.href = 'music.jsp'; // 음악 파일의 정확한 경로를 입력하세요.
                });
            </script>
            <div class="nav-item">
                <i class="fa-solid fa-clapperboard"></i>
                <span>영화</span>
            </div>
            <div class="nav-item">
                <i class="fa-solid fa-tower-broadcast"></i>
                <span>실시간</span>
            </div>
            <div class="nav-item">
                <i class="fa-solid fa-gamepad"></i>
                <span>게임</span>
            </div>
            <div class="nav-item">
                <i class="fa-solid fa-trophy"></i>
                <span>스포츠</span>
            </div>
            <div class="nav-item">
                <i class="fa-regular fa-lightbulb"></i>
                <span>학습프로그램</span>
            </div>
            <div class="nav-item">
                <i class="fa-solid fa-podcast"></i>
                <span>팟캐스트</span>
            </div>
        </div>
    </div>
 	<div class="video_selection">
		<div class="recommendboxes">
			<button class="box">전체</button>
			<button class="box">반려동물</button>
			<button class="box">야구</button>
			<button class="box">뉴스</button>
			<button class="box">요리</button>
		</div>
        
        <section class="top20container">
        <div class="top20title">
            <h3>TOP20 드라마 채널</h3>
        </div>
        <div class="top20_box">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="./drama_images/1717472960793.png" alt="kino" />
                        <div class="rank">1</div>
                        <a href="javascript:void(0);" class="r_tilte">키노라이츠</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/20240604_171540_172.jpg" alt="daynight" />
                        <div class="rank">2</div>
                        <a href="javascript:void(0);" class="r_tilte">낮과 밤이 다른 그녀</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/1649860853169.jpg" alt="tving" />
                        <div class="rank">3</div>
                        <a href="javascript:void(0);" class="r_tilte">티빙(TVING)</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/dec68228-9180-4c81-8d64-c6b4347e3167.jpg" alt="thanks" />
                        <div class="rank">4</div>
                        <a href="javascript:void(0);" class="r_tilte">감사합니다</a>
                    </div>
                    <!-- 4 -->
                    <!-- 5 -->
                    <div class="swiper-slide">
                        <img src="./drama_images/1467019091809.jpg" alt="net" />
                        <div class="rank">5</div>
                        <a href="javascript:void(0);" class="r_tilte">Netflix Korea</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/1711553000666.png" alt="disney" class="crop" />
                        <div class="rank">6</div>
                        <a href="javascript:void(0);" class="r_tilte">디즈니+ 코리아</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/5003cac6-b1b2-403b-8945-ad9fb9f16b55.jpg" alt="if" />
                        <div class="rank">7</div>
                        <a href="javascript:void(0);" class="r_tilte">우연일까?</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/1549470301400.png" alt="koc" />
                        <div class="rank">8</div>
                        <a href="javascript:void(0);" class="r_tilte">콬티비</a>
                    </div>
                    <!-- 8 -->
                    <!-- 9 -->
                    <div class="swiper-slide">
                        <img src="./drama_images/d89383a7-9210-4655-ab6a-681d295270f8.jpg" alt="good">
                        <div class="rank">9</div>
                        <a href="javascript:void(0);" class="r_tilte">굿파트너</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/20240516_102609_046.jpg" alt="play_woman" />
                        <div class="rank">10</div>
                        <a href="javascript:void(0);" class="r_tilte">놀아주는여자</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/default_clip.png" alt="1min" class="crop" />
                        <div class="rank">11</div>
                        <a href="javascript:void(0);" class="r_tilte">1분영화드라마</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/1702277166329.jpg" alt="kizzle" />
                        <div class="rank">12</div>
                        <a href="javascript:void(0);" class="r_tilte">kizzle</a>
                    </div>
                    <!-- 12 -->
                    <!-- 13 -->
                    <div class="swiper-slide">
                        <img src="./drama_images/yk1pdcvpmzjL.jpg" alt="suzy" />
                        <div class="rank">13</div>
                        <a href="javascript:void(0);" class="r_tilte">수지맞은 우리</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/1703727072632.png" alt="pick" />
                        <div class="rank">14</div>
                        <a href="javascript:void(0);" class="r_tilte">pick go</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/HxNAO3QvHyHL.jpg" alt="beauty">
                        <div class="rank">15</div>
                        <a href="javascript:void(0);" class="r_tilte">미녀와 순정남</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/T60479G_pgm_poster1_20240408112127939.jpg" alt="brave" />
                        <div class="rank">16</div>
                        <a href="javascript:void(0);" class="r_tilte">용감무쌍 용수정</a>
                    </div>
                    <!-- 16 -->
                    <!-- 17 -->
                    <div class="swiper-slide">
                        <img src="./drama_images/1702272428033.png" alt="hiteen" />
                        <div class="rank">17</div>
                        <a href="javascript:void(0);" class="r_tilte">하이틴에이저 Hi-teenager</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/1667978365556.png" alt="original" />
                        <div class="rank">18</div>
                        <a href="javascript:void(0);" class="r_tilte">연애 플레이 리스트</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/1566784610491.png" alt="jun" />
                        <div class="rank">19</div>
                        <a href="javascript:void(0);" class="r_tilte">AXN</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./drama_images/players2.jpg" alt="players2" />
                        <div class="rank">20</div>
                        <a href="javascript:void(0);" class="r_tilte">플레이어2:꾼들의전쟁</a>
                    </div>
                <!-- 20 -->
                </div> <!-- swiper-wrapper -->
				<div class="swiper-prev">
					<span class="material-symbols-outlined">
						chevron_backward
					</span>
				</div>
				<div class="swiper-next">
					<span class="material-symbols-outlined">
						chevron_forward
					</span>
				</div>
				<div class="swiper-pagination"></div>
			</div> <!-- swiper-container -->
		</div> <!-- top20_box -->
	</section>
	
    <section class="bottom_menu">
        <div class="bot_title">

        </div>
        <div class="bot_content">

        </div>
    </section>
    </div> <!-- video_selection -->
    </div> <!-- YtBody -->
    
</body>
</html>
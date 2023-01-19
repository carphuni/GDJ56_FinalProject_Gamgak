<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 부트스트랩 css/js -->
    <link href="./bootstrap-5.2.3-dist/css/bootstrap.css" rel="stylesheet">
    <script src="./bootstrap-5.2.3-dist/js/jquery-3.6.1.min.js"></script>
    <!-- Main css -->
    <link href="./bootstrap-5.2.3-dist/css/mainProfile.css" rel="stylesheet">
    <!-- Font Awesome icons (free version)-->
    <script src="https://kit.fontawesome.com/d87d902b0c.js" crossorigin="anonymous"></script>
</head>
<body>
    <div id="basic-wrapper">
        <!-- Side NavBar -->
        <aside id="sidebar-wrapper" class="col-sm-3">
            <div id="sidebar" class="col-sm-3">
                <img id="logo-img" src="./img/2-1.png" >
                <nav class="nav flex-column">
                    <a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-circle-user"></i>
                        <span>프로필 홈</span>
                    </a><a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-magnifying-glass-chart"></i>
                        <span>인기 맛집 및 검색</span>
                    </a><a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-people-group"></i>
                        <span>모임</span>
                    </a><a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-user-group"></i>
                        <span>친구</span>
                    </a><a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-envelope"></i>
                        <span>메세지</span>
                    </a>
                </nav>
                <a><i class="fa-solid fa-bars"></i><span>더 보기</span></a>
            </div>
        </aside>
        <!-- Article -->
        <article id="main-wrapper">
            <!-- Main -->
            <section>
                <div id="meeting-wrapper"></div>
                <div id="profile-wrapper"></div>
            </section>
            <!-- Footer -->
            <footer>
                <div>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                </div>
                <p>
                    &copy;2023 Gamgak from LDH
                </p>
            </footer>
        </article> 
            
        
    </div>

    <!-- 부트스트랩 js -->
    <script src="./bootstrap-5.2.3-dist/js/bootstrap.js"></script>
    <script>

    </script>
</body>
</html>
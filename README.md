# **GamGak Project**

## **📗 목차**

<br>

* 📋 [개요](#📋-포트폴리오-개요)
* 👨🏻‍💻 [기능 구현](#⚙️-기능-구현)
  * [전체적인 페이지 Front UI 구현](#1-전체적인-페이지-front-ui-구현)
  * [마이 페이지](#2-마이-페이지-구현)
  * [맛집 저장](#3-맛집-저장-기능)
  * [저장한 맛집 조회](#4-저장한-맛집-조회-기능)
 

<br>

## **📋 포트폴리오 개요**

<img width="100%" alt="마이 페이지" src="./ReadMeImg/마이 페이지.png" />

> <br>
>
> **프로젝트 :** GamGak - 맛집 저장 사이트
>
> **분류 :** GDJ56 Final Project
>
> **제작 기간 :** 2022.01.18 ~ 2022.02.15 (4주)
>
> **인원 :** 5명
>
> **주요 기능 :** 
> 1) 내가 좋아하는 맛집 저장
> 2) 다른 사람들의 맛집 저장 데이터를 통한 맛집 순위 체크
> 3) 친구 기능
> 4) 타인의 맛집 저장 열람
> 5) 친구와 채팅
> 6) 맛집 모임 기능
>
> **개발환경 및 라이브러리 :**
> * 구현언어 : JDK 11, HTML, JavaScript, jQuery, Bootstrap, Ajax, JAVA, SpringBoot
> * WAS : Tomcat 9.0
> * DB 서버 : Oracle DB
> * 형상관리 : Git
>
> <br>

<br>
<br>

## **⚙️ 기능 구현**

### **1. 전체적인 페이지 Front UI 구현**

<img width="100%" alt="Front UI" src="./ReadMeImg/Front UI.gif" />

- 전체적인 페이지를 Html, css, js, BootStrap 사용하여 구현
- 로그인 페이지 : BootStrap 캐러셀 사용
- Header : FontAwsome 아이콘 사용

<br>

### **2. 마이 페이지 구현**

<img width="100%" alt="마이 페이지" src="./ReadMeImg/마이 페이지.png" />

- 기본적인 회원 정보를 출력
- 내가 저장한 맛집 수, 친구 수, 모임 수 출력

<br>

### **3. 맛집 저장 기능**

<img width="100%" alt="맛집 저장" src="./ReadMeImg/맛집 저장.gif" />

- Kakao지도 API를 사용하여 맛집의 위치 정보 저장
- 사진 업로드 및 기록 내용 저장

<br>

<img width="100%" alt="맛집 상세페이지" src="./ReadMeImg/맛집 상세페이지.gif" />

<br>

### **4. 저장한 맛집 조회 및 삭제 기능**

<img width="100%" alt="맛집 조회" src="./ReadMeImg/맛집 조회.gif" />

- 내가 저장한 전체 맛집 조회
- select를 사용한 지역 별 저장한 맛집 조회
- 제목, 카테고리 검색을 통한 저장한 맛집 조회

<br>

<img width="100%" alt="맛집 페이징" src="./ReadMeImg/맛집 페이징.gif" />

- 스크롤 이벤트를 이용한 페이징 처리

<br>

<img width="100%" alt="맛집 삭제" src="./ReadMeImg/맛집 삭제.gif" />

- 저장한 맛집 삭제

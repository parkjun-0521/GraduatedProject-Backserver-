# Withrium

  - 2023년 서일대학교 졸업작품

## 개요

  - 웹에서 DB에 저장한 데이터를 유니티에서 사용할 수 있도록 한 백엔드 프로젝트입니다.
  - 로그인 여부, 유저데이터, 관리자와 사용자 구별, 각종 팀 데이터, 아바타 및 캐릭터 데이터, 채팅 기록
  - 위 정보를 받아오는 백엔드 프로젝트입니다. 

## 개발 언어 

  - Java

## 웹 서버 

  - Apache Tomcat 

## 기능 설명 

  ### DBConect.jsp ( Ignore 파일 )
  - 외부 DB와 연결하기 기초적인 작업
  - URL과 DB 로그인 정보 

  ### Login.jsp
  - 유니티 로그인 페이지의 정보를 받아온다.
  - DB에 있는 정보와 비교하여 로그인 여부를 판단.

  ### ChatLog.jsp
  - 유니티 월드 안에서 실시간 채팅을 쳤을 때 웹으로 데이터를 보내준다.
  - 웹에서 채팅 기록을 확인하기 위해서 데이터를 DB에 저장
  
  ### ItemInput.jsp
  - 각 계정에 있는 아바타 및 캐릭터 데이터를 불러온다.
  - 

Logout.jsp

NewUserCreate.jsp

TeamAllData.jsp

TeamData.jsp

UserData.jsp

UserTeamData.jsp

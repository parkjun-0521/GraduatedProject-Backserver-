<%--
  Created by IntelliJ IDEA.
  User: parkj
  Date: 2023-01-18
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@include file="/DBConect.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String chat_log = request.getParameter("chat_log");
    String team_name = request.getParameter("team_name");
    String nick = request.getParameter("nick");


    Connection conn = null;
    PreparedStatement pstmt = null;


    try{

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(url,user,userpw);

        String sql = "insert into chat_data(user_chat,team_name,user_name,chat_time) values(?,?,?,sysdate())";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,chat_log);
        pstmt.setString(2,team_name);
        pstmt.setString(3,nick);

        pstmt.executeUpdate();

        //out.println("테이블에 새로운 레코드를 추가 성공");
        out.print(chat_log + ",");
        out.print(team_name + ",");
        out.print(nick);

    }catch(Exception e){
        e.printStackTrace();
        //out.println("테이블에 새로운 레코드 추가 실패");
    }finally {
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
    }
%>
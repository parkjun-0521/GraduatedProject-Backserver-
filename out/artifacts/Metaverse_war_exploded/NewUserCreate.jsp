<%--
  Created by IntelliJ IDEA.
  User: parkjun
  Date: 2022-12-28
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String nick = request.getParameter("nick");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try{

        String url = "jdbc:mysql://localhost:3306/metaverse";
        String user = "root";
        String userpw = "qkrwns@0521";

        //String url = "jdbc:mysql://121.164.87.241:1128/project";
        //String user = "unity_con";
        //String userpw = "1234";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(url,user,userpw);
        out.println("제대로 연결되었습니다.");

        String sql = "insert into user_data(user_id,user_pass ,user_name ,user_admin) values(?,?,?,0)";

        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1,id);
        pstmt.setString(2,pwd);
        pstmt.setString(3,nick);

        pstmt.executeUpdate();

        //out.println("테이블에 새로운 레코드를 추가 성공");
        out.print(id + ",");
        out.print(pwd + ",");
        out.print(nick);

    }catch(Exception e){
        e.printStackTrace();
        //out.println("테이블에 새로운 레코드 추가 실패");
    }finally {
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
    }
%>

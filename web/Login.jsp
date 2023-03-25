<%--
  Created by IntelliJ IDEA.
  User: parkjun
  Date: 2022-12-28
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@include file="/DBConect.jsp" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try{

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(url,user,userpw);

        String sql = "select * from user_data where user_id = ? and user_pass = ? and login_state = 0";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,id);
        pstmt.setString(2,pw);

        rs = pstmt.executeQuery();

        if(rs.next()){
            //String isql = "update user_data set login_state = 1 where user_id = ?";
            //pstmt = conn.prepareStatement(isql);
            //pstmt.setString(1,id);
            //pstmt.executeUpdate();

            String adminUser = rs.getString("user_admin");
            out.println(adminUser);
        } else {
            out.println("2");
        }

    }catch(Exception e){

        e.printStackTrace();
        out.println("호출 실패");

    }finally{

        if(rs != null) try{rs.close();}catch(SQLException sqle){}
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}

    }
%>

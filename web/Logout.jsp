<%--
  Created by IntelliJ IDEA.
  User: parkjun
  Date: 2023-01-02
  Time: 오후 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
  String id = request.getParameter("id");

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try{

    String url = "jdbc:mysql://localhost:3306/metaverse";
    String user = "root";
    String userpw = "qkrwns@0521";

    //String url = "jdbc:mysql://121.164.87.241:1128/project";
    //String user = "unity_con";
    //String userpw = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn=DriverManager.getConnection(url,user,userpw);

    String sql = "select * from user_data where user_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);

    rs = pstmt.executeQuery();

    if(rs.next()){
      String isql = "update user_data set login_state = 0 where user_id = ?";
      pstmt = conn.prepareStatement(isql);
      pstmt.setString(1,id);
      pstmt.executeUpdate();
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
<%--
  Created by IntelliJ IDEA.
  User: parkj
  Date: 2023-01-09
  Time: 오후 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@include file="/DBConect.jsp" %>
<%
    String id = request.getParameter("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try{

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(url,user,userpw);

        String sql = "select * from team_data where user_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,id);

        rs = pstmt.executeQuery();

        while(rs.next()){
            String TeamName = rs.getString("team_name");
            out.print(TeamName + ",");
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
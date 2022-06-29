<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! 
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/odbo";
	String username = "root";
	String password = "12345";
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, username, password);
		String sql = "INSERT INTO testmember(id, pw, name, email, phone, gender) VALUES (?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);//sql 인수 삽입 주의
		
		pstmt.setString(1, "LKJHGHG");
		pstmt.setString(2, "12345");
		pstmt.setString(3, "홍길성");
		pstmt.setString(4, "hong@hong.com");
		pstmt.setString(5, "010-8888-9999");
		pstmt.setString(6, "남성");
		
		int flag = pstmt.executeUpdate();//성공시 1 반환
		System.out.print(flag);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

%>


</body>
</html>
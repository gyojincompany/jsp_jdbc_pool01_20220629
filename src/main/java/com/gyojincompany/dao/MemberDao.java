package com.gyojincompany.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.gyojincompany.dto.MemberDto;

public class MemberDao {
	
	private String url = "jdbc:mysql://localhost:3306/odbo";
	private String username = "root";
	private String password = "12345";
	private String driverName = "com.mysql.jdbc.Driver";
	
	public MemberDao() {
		try {
			Class.forName(driverName);//드라이버 로딩
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDto> memberList() {
		
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from testmember");
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");				
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String gender = rs.getString("gender");
				
				//MemberDto dto = new MemberDto(id, pw, name, email, phone, gender);
				
				MemberDto dto = new MemberDto();
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setEmail(email);
				dto.setPhone(phone);
				dto.setGender(gender);
				//dto 완성(레코드 1개 완성)
				
				dtos.add(dto);
				
			}
			
			for(int i=0;i<dtos.size();i++) {
				
				MemberDto dto = dtos.get(i);
				String mid = dto.getId();
				String mpw = dto.getPw();
				String mname = dto.getName();
				String memail = dto.getEmail();
				String mphone = dto.getPhone();
				String mgender = dto.getGender();
				
				System.out.println("아이디 : " + mid);
				System.out.println("비번 : " + mpw);
				System.out.println("이름 : " + mname);
				System.out.println("이메일 : " + memail);
				System.out.println("전화번호 : " + mphone);
				System.out.println("성별 : " + mgender);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
	}	
	
}

package com.soulstrk;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {

	public static final int MEMBER_NONEXISTENT = 0; // 로그인시 발생하는 경우의 수들..
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	public MemberDAO() { // 생성과 동시에 클래스를 로드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("에러1");
		}
	}

	public int insertMember(MemberDTO dto) {
		int ri = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member values(?,?,?,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS'),?)";

		try {
			conn = DriverManager.getConnection(url, "scott", "soul4310");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUsername());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getGender());
			pstmt.executeUpdate(); // Select구문에선 Quert 나머지는 Update를 사용!
			ri = MEMBER_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러2");
		} finally {
			try {
				conn.commit();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				System.out.println("에러3");
			}
		}
		return ri;
	}

	public int confirmId(String id) {
		int ri = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where username = ?";

		try {
			conn = DriverManager.getConnection(url, "scott", "soul4310");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ri = MEMBER_EXISTENT;
			} else {
				ri = MEMBER_NONEXISTENT;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("에러4");
		} finally {
			try {
				if (rs != null) 
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				System.out.println("에러5");
			}
		}
		return ri;
	}
	
	public int checkUser(String id, String pwd) {
		int ri = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPw;
		String sql = "select * from member where username = ?";

		try {
			conn = DriverManager.getConnection(url, "scott", "soul4310");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPw = rs.getString("password");
				if(dbPw.equals(pwd)) {
					ri = MemberDAO.MEMBER_LOGIN_SUCCESS;
				}else {
					ri = MemberDAO.MEMBER_LOGIN_PW_NO_GOOD;
				}
			} else {
				ri = MemberDAO.MEMBER_LOGIN_IS_NOT;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("에러4");
		} finally {
			try {
				if (rs != null) 
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				System.out.println("에러5");
			}
		}
		return ri;
	}
	
	public MemberDTO getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO dto = null;
		
		String sql = "select * from member where username = ?";

		try {
			conn = DriverManager.getConnection(url, "scott", "soul4310");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String username = rs.getString("username");
				String pwd = rs.getString("password");
				String email = rs.getString("email");
				String date = rs.getString("join_date");
				String gender = rs.getString("gender");
				dto = new MemberDTO(username, pwd, email, gender, date);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("에러4");
		} finally {
			try {
				if (rs != null) 
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				System.out.println("에러5");
			}
		}
		return dto;
	}
	
	public int updateMember(String id, String pwd, String email) {
		int ri = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set password = ?, email = ? where username = ?";

		try {
			conn = DriverManager.getConnection(url, "scott", "soul4310");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, email);
			pstmt.setString(3, id);
			pstmt.executeUpdate(); // Select구문에선 Query 나머지는 Update를 사용!
			ri = MEMBER_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러2");
		} finally {
			try {
				conn.commit();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				System.out.println("에러3");
			}
		}
		return ri;
	}
	
	public ArrayList<MemberDTO> getAllMember() { // 모든 멤버 가져오기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO dto = null;
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		String sql = "select * from member where username != 'admin'";

		try {
			conn = DriverManager.getConnection(url, "scott", "soul4310");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String username = rs.getString("username");
				String pwd = rs.getString("password");
				String email = rs.getString("email");
				String date = rs.getString("join_date");
				String gender = rs.getString("gender");
				dto = new MemberDTO(username, pwd, email, gender, date);
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("에러4");
		} finally {
			try {
				if (rs != null) 
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				System.out.println("에러5");
			}
		}
		return list;
	}
	
	public ArrayList<MemberDTO> getAllMember_date() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO dto = null;
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		String sql = "select * from member where username != 'admin' order by join_date asc";

		try {
			conn = DriverManager.getConnection(url, "scott", "soul4310");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String username = rs.getString("username");
				String pwd = rs.getString("password");
				String email = rs.getString("email");
				String date = rs.getString("join_date");
				String gender = rs.getString("gender");
				dto = new MemberDTO(username, pwd, email, gender, date);
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("에러4");
		} finally {
			try {
				if (rs != null) 
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				System.out.println("에러5");
			}
		}
		return list;
	}
	
	

}

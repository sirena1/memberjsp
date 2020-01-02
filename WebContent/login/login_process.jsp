<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%!
public void init() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver Loading Success!!!!!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}	
	}

private Connection getConnection() throws SQLException {
	return DriverManager.getConnection("jdbc:oracle:thin:@192.168.12.65:1521:xe","c##kitri","kitri");
}
 %>
 <%
 Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String name = null;
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	try {
		conn = getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select name \n");
		sql.append("from member \n");
		sql.append("where id = ? and pass = ?");
		pstmt = conn.prepareStatement(sql.toString());
		//물음표의 개수
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			name = rs.getString("name");	
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {
				rs.close();
			}
			if(pstmt !=  null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>회원가입 결과!!!</h3>
<%
if(name != null) {
%>
<font size="15" color="steelblue"><%=name %>(<%=id%>)님 안녕하세요!!!!!!</font> <br>
<%
} else { 
%>
<font size="15" color="magenta">아이디 또는 비밀번호를 확인해주세요!!!!!!</font>
<a href="/memberservlet/login/login.html">로그인</a>
<%
}
%>
</div>
</body>
</html>
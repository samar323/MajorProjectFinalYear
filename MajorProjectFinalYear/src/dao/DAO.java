package dao;

import java.io.InputStream;
import java.sql.*;
import java.util.*;

public class DAO {
	private Connection con;

	public DAO() throws Exception {
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/major_project?allowPublicKeyRetrieval=true", "root",
//				"Samar323@");
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/major_project","root","aniket");

	}
	
	public HashMap getAdmin(String aid, String password) throws Exception {
		PreparedStatement p = con.prepareStatement("select * from admin where aid=? and password=?");
		p.setString(1, aid);
		p.setString(2, password);
		ResultSet rs = p.executeQuery();
		if (rs.next()) {
			HashMap user = new HashMap();
			user.put("name", rs.getString("name"));
			return user;
		} else {
			return null;
		}
	}

	public boolean insertStudent(HashMap student) throws Exception {
		try {
			PreparedStatement p=con.prepareStatement("insert into students"
	+ "(email,password,name,phone,gender,school,branch,roll,id,"
	+ "photo,status)values(?,?,?,?,?,?,?,?,?,?,'pending')");
			p.setString(1, (String)student.get("email"));
			p.setString(2, (String)student.get("password"));
			p.setString(3, (String)student.get("name"));
			p.setString(4, (String)student.get("phone"));
			p.setString(5, (String)student.get("gender"));
			p.setString(6, (String)student.get("school"));
			p.setString(7, (String)student.get("branch"));
			p.setString(8, (String)student.get("roll"));
			p.setBinaryStream(9, (InputStream)student.get("id"));
			p.setBinaryStream(10, (InputStream)student.get("photo"));
			
			p.executeUpdate();
			return true;
		}catch(java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}

	public HashMap getStudent(String email, String password) throws Exception {
		PreparedStatement p=con.prepareStatement("select * from students where email=? and password=?");
		p.setString(1, email);
		p.setString(2,password);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			HashMap student=new HashMap();
			student.put("name", rs.getString("name"));
			student.put("email", rs.getString("email"));
			student.put("phone", rs.getString("phone"));
			student.put("school", rs.getString("school"));
			student.put("branch", rs.getString("branch"));
			student.put("roll", rs.getString("roll"));
			//student.put("photo",rs.getBlob("photo"));
			student.put("status", rs.getString("status"));
			return student;
		}else {
			return null;
		}	
	}
	
}
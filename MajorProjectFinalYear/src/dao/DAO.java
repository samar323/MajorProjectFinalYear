package dao;

import java.io.InputStream;
import java.sql.*;
import java.util.*;

public class DAO {
	private Connection con;

	public DAO() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/major_project?allowPublicKeyRetrieval=true", "root",
				"Samar323@");

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
}
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
	
	public ArrayList<HashMap> getQuestion(String question) throws Exception {
		PreparedStatement p = con.prepareStatement("select * from questions where question like ?");
		p.setString(1, "%"+question+"%");
		ResultSet rs = p.executeQuery();
		ArrayList<HashMap> questions = new ArrayList();
		while (rs.next()) {
			HashMap ques = new HashMap();
			ques.put("quesId", rs.getString("quesId"));
			ques.put("question", rs.getString("question"));
			ques.put("studentId", rs.getString("studentId"));
			ques.put("dateTime", rs.getDate("dateTime"));
			questions.add(ques);
		}
		return questions;
	}
	
	public ArrayList<HashMap> getAnswer(int quesId) throws Exception {
		PreparedStatement p = con.prepareStatement("select * from answers where qid= ?");
		p.setInt(1, quesId);
		ResultSet rs = p.executeQuery();
		ArrayList<HashMap> answers = new ArrayList();
		while (rs.next()) {
			HashMap ans = new HashMap();
			ans.put("qid", rs.getString("qid"));
			ans.put("answers", rs.getString("answers"));
			ans.put("studentId", rs.getString("studentId"));
			ans.put("dateTime", rs.getDate("dateTime"));
			answers.add(ans);
		}
		return answers;
	}
	
	public String getQuestionById(int qid) throws Exception {
		PreparedStatement p = con.prepareStatement("select * from questions where quesId=?");
		p.setInt(1, qid);
		ResultSet rs = p.executeQuery();
		if (rs.next()) {
			return rs.getString("question");
		} else {
			return null;
		}
	}
}
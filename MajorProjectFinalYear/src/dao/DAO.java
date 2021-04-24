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
	
	public byte[] getPhoto(String email,String type) throws Exception{
		
		PreparedStatement pr = null;
		if(type.equalsIgnoreCase("student")) {
			pr=con.prepareStatement(
				"select (photo) from students where email=?");
		}
		else{
			
		}
		pr.setString(1, email);
		ResultSet rs=pr.executeQuery();
		if(rs.next()) {
		
			byte[] photo=rs.getBytes("photo");
			if(photo.length!=0) {
				return photo;
			}else {
				return null;
			}
			
			
		}
		else {
			return null;
		}
	}
	
public byte[] getId(String email) throws Exception{
		
	
			PreparedStatement pr=con.prepareStatement(
				"select (id) from students where email=?");
		
		pr.setString(1, email);
		ResultSet rs=pr.executeQuery();
		if(rs.next()) {
		
			byte[] id=rs.getBytes("id");
			if(id.length!=0) {
				return id;
			}else {
				return null;
			}
			
			
		}
		else {
			return null;
		}
	}
	
	public ArrayList<HashMap> getAllStudents(String status) throws Exception {
		PreparedStatement p=con.prepareStatement("select * from students where status=?");
		p.setString(1, status);
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> allStudents=new ArrayList();
		while(rs.next()) {
			HashMap student=new HashMap();
			student.put("name", rs.getString("name"));
			student.put("email", rs.getString("email"));
			student.put("phone", rs.getString("phone"));
			student.put("school", rs.getString("school"));
			student.put("branch", rs.getString("branch"));
			student.put("gender", rs.getString("gender"));
			student.put("roll", rs.getString("roll"));

			student.put("status", rs.getString("status"));
			//student.put("id", rs.getString("id"));
			
			allStudents.add(student);
		}
		return allStudents;
	
}

	public boolean changeStudentStatus(String email, String status) throws Exception {
		PreparedStatement p=con.prepareStatement("update students set status=? where email=?");
		p.setString(1,status);
		p.setString(2,email);
		
		p.executeUpdate();
		return true;
}

	public byte[] getFile(String email) throws SQLException {
	
	
		 PreparedStatement p=con.prepareStatement("select id from students where email=?");
		
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			byte[] file=rs.getBytes(1);
			if(file.length!=0) {
				return file;
			}
			else {
				return null;
			}
		}
		else {
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

	public ArrayList<HashMap> getQuestionByStudent(String studentId) throws Exception{
	PreparedStatement p=con.prepareStatement("select * from questions where studentId=?");
	p.setString(1, studentId);
	ResultSet rs=p.executeQuery();
	ArrayList<HashMap> questions = new ArrayList();
	while(rs.next()) {
		HashMap student=new HashMap();
		student.put("quesId", rs.getInt("quesId"));
		student.put("question", rs.getString("question"));
		student.put("studentId", rs.getString("studentId"));
		student.put("dateTime", rs.getDate("dateTime"));
		questions.add(student);
		
	}
	return questions;
}
	public boolean insertQuestion(HashMap student) throws Exception{
		try {
			PreparedStatement p=con.prepareStatement("insert into questions"
	+ "(question,studentId,dateTime)values(?,?,CURRENT_TIMESTAMP)");
			p.setString(1, (String)student.get("question"));
			p.setString(2, (String)student.get("studentId"));
			
			p.executeUpdate();
			return true;
		}catch(java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}
	public boolean insertAnswer(HashMap answerDetails) throws Exception {
		try {
			PreparedStatement p = con.prepareStatement(
					"insert into answers (qid,answers,studentId,dateTime) values(?,?,?,CURRENT_TIMESTAMP)");
			p.setInt(1, (Integer) answerDetails.get("qid"));
			p.setString(2, (String) answerDetails.get("answer"));
			p.setString(3, (String) answerDetails.get("studentId"));
			p.executeUpdate();
			return true;
		} catch (Exception ex) {
			return false;
		}


	}

	public boolean insertSubject(HashMap subject) throws Exception {
		try {
			PreparedStatement p=con.prepareStatement("insert into subjects"
	+ "(subjectName,subjectCode,dateTime)values(?,?,CURRENT_TIMESTAMP)");
			p.setString(1, (String)subject.get("subName"));
			p.setString(2, (String)subject.get("subCode"));
			
			p.executeUpdate();
			return true;
		}catch(java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}
	public ArrayList<HashMap> getAllSubjects(int subjectId) throws Exception {
		PreparedStatement p = con.prepareStatement("select * from subjects where subjectId= ?");
		p.setInt(1, subjectId);
		ResultSet rs = p.executeQuery();
		ArrayList<HashMap> subjects = new ArrayList();
		while (rs.next()) {
			HashMap sub = new HashMap();
			sub.put("subjectId", rs.getInt("subjectId"));
			sub.put("subjectName", rs.getString("subjectName"));
			sub.put("subjectCode", rs.getString("subjectCode"));
			sub.put("dateTime", rs.getDate("dateTime"));
			subjects.add(sub);
		}
		return subjects;
	}
}
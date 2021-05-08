package dao;

import javaFiles.*;
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
	public ArrayList<HashMap> getAnswerByStudent(String studentId) throws Exception {
		PreparedStatement p = con.prepareStatement("select  q.question, q.quesId, a.studentId, a.dateTime, a.answers "
				+ "from questions q join answers a on q.quesId=a.qid"
				+ " where a.studentId=?");
		p.setString(1, studentId);
		ResultSet rs = p.executeQuery();
		ArrayList<HashMap> answers = new ArrayList();
		while (rs.next()) {
			HashMap ans = new HashMap();
			ans.put("question", rs.getString("question"));
			ans.put("qid", rs.getInt("quesId"));
			ans.put("answers", rs.getString("answers"));
			ans.put("studentId", rs.getString("studentId"));
			ans.put("dateTime", rs.getDate("dateTime"));
			answers.add(ans);
		}
		return answers;
		//pplk;l
		 
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
	public String getQuestionByStudentId(String studentId) throws Exception {
		PreparedStatement p = con.prepareStatement("select * from questions where studentId=?");
		p.setString(1, studentId);
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
			p.setString(1, (String)subject.get("subjectName"));
			p.setString(2, (String)subject.get("subjectCode"));
			
			p.executeUpdate();
			return true;
		}catch(java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}
	public List<Subject> getAllSubjects() throws Exception {
		PreparedStatement p = con.prepareStatement("SELECT * FROM subjects");
		ResultSet rs = p.executeQuery();
		List<Subject> subjects = new ArrayList();
		while (rs.next()) {
			Subject subject=new Subject();
			subject.setId(Integer.parseInt(rs.getString("subjectId")));
			subject.setSubjectName(rs.getString("subjectName"));
			subject.setSubjectCode(rs.getString("subjectCode"));
			subjects.add(subject);
		}
		return subjects;
	}
	public List<Semester> getAllSemesters(String branch) throws Exception {
		PreparedStatement p = con.prepareStatement("SELECT branchId, semester FROM branch where branchName=?");
		p.setString(1, branch);
		ResultSet rs = p.executeQuery();
		List<Semester> semesters = new ArrayList();
		while (rs.next()) {
			Semester semester=new Semester();
			semester.setId(Integer.parseInt(rs.getString("branchId")));
			semester.setSemester(Integer.parseInt(rs.getString("semester")));
			semesters.add(semester);
		}
		return semesters;
	}
	public boolean deleteQuestion(int quesId) throws Exception {
		try {
			PreparedStatement p = con.prepareStatement(
					"delete from questions where quesId=?");
			p.setInt(1, quesId);
			p.executeUpdate();
			return true;
		} catch (java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}
	
	public boolean deleteAnswer(int quesId) throws Exception {
		try {
			PreparedStatement p = con.prepareStatement(
					"delete from answers where qid=?");
			p.setInt(1, quesId);
			p.executeUpdate();
			return true;
		} catch (java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}

	public boolean deleteSubject(int subjectId) throws Exception {
		try {
			PreparedStatement p = con.prepareStatement(
					"delete from subjects where subjectId=?");
			p.setInt(1, subjectId);
			p.executeUpdate();
			return true;
		} catch (java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}

	public boolean insertBranch(HashMap branch) throws Exception {
		try {
			PreparedStatement p=con.prepareStatement("insert into branch"
	+ "(branchName,school,semester,dateTime)values(?,?,?,CURRENT_TIMESTAMP)");
			p.setString(1, (String)branch.get("branch"));
			p.setString(2, (String)branch.get("school"));
			p.setInt(3, (int) branch.get("semester"));
			p.executeUpdate();
			return true;
		}catch(java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}
	public ArrayList<HashMap> getAllBranches() throws Exception {
		PreparedStatement p = con.prepareStatement("select * from branch");
		ResultSet rs = p.executeQuery();
		ArrayList<HashMap> branches = new ArrayList();
		while (rs.next()) {
			HashMap bran = new HashMap();
			bran.put("branchId", rs.getInt("branchId"));
			bran.put("school", rs.getString("school"));
			bran.put("branchName", rs.getString("branchName"));
			bran.put("semester", rs.getInt("semester"));
			bran.put("dateTime", rs.getDate("dateTime"));
			branches.add(bran);
		}
		return branches;
	}

	public boolean deleteBranch(int branchId) throws Exception {
		try {
			PreparedStatement p = con.prepareStatement(
					"delete from branch where branchId=?");
			p.setInt(1, branchId);
			p.executeUpdate();
			return true;
		} catch (java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}
	public List<School> getAllSchools() throws Exception {
		PreparedStatement p = con.prepareStatement("SELECT distinct school FROM branch");
		ResultSet rs = p.executeQuery();
		List<School> schools = new ArrayList();
		while (rs.next()) {
			School sch=new School();
			sch.setName(rs.getString("school"));
			schools.add(sch);
		}
		return schools;
	}
	public List<Branch> getAllBranchesBySchool(String school) throws Exception {
		PreparedStatement p = con.prepareStatement("SELECT distinct branchName FROM branch where school=?");
		p.setString(1, school);
		ResultSet rs = p.executeQuery();
		List<Branch> list  = new ArrayList<>();
		while (rs.next()) {
			Branch br=new Branch();
			br.setName(rs.getString("branchName"));
			list.add(br);
		}
		return list;
	}
	public boolean checkAnswer(int qid,String studentId) throws Exception{
		PreparedStatement p=con.prepareStatement("select * from answers where qid=? and studentId=?");
		p.setInt(1, qid);
		p.setString(2, studentId);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return false;
		}else {
			
			return true;
		}
	}
	
	public int getBranchId(String school, String branch, int semester ) throws Exception {
		PreparedStatement p=con.prepareStatement("select branchId from branch where branchName=? and school=? and semester=?");
		p.setString(1, branch);
		p.setString(2, school);
		p.setInt(3, semester);
		ResultSet rs = p.executeQuery();
		if (rs.next()) {
			return rs.getInt("branchId");
		} else {
			return 0;
		}
	}
	
	public boolean insertSubjectCombination(int branchId, int subject) throws Exception {
		try {
			PreparedStatement p=con.prepareStatement("insert into subjectcombination"
	+ "(classId,subjectId,dateTime)values(?,?,CURRENT_TIMESTAMP)");
			p.setInt(1, branchId);
			p.setInt(2, subject);
			p.executeUpdate();
			return true;
		}catch(java.sql.SQLIntegrityConstraintViolationException ex) {
			return false;
		}
	}
}
package javaFiles;

public class Grades {
	
	public String getGrades(int marks) {
		String grade=null;
		if(marks>90) {
			grade="O"; 
		}else if(marks>80 && marks<91) {
			grade="A+";
		}else if(marks>70 && marks<81) {
			grade="A";
		}else if(marks>60 && marks<71) {
			grade="B+";
		}else if(marks>50 && marks<61) {
			grade="B";
		}else if(marks>40 && marks<51) {
			grade="C";
		}else if(marks==40) {
			grade="P";
		}else {
			grade="F";
		}
		return grade;
	}
}

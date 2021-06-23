package javaFiles;

public class SuffixSem {
	public String suffix(int sem) {
		String suffix="";
		
		if(sem==1)
			suffix="st";
		else if(sem==2)
			suffix="nd";
		else if(sem==3)
			suffix="rd";
		else
			suffix="th";
		
		return suffix;
	}

}

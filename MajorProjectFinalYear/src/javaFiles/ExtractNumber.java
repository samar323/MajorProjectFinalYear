package javaFiles;

public class ExtractNumber {
	
	static int extractInt(String str)
    {
        
        str = str.replaceAll("[^\\d]", " ");
  
        // Remove extra spaces from the beginning
        // and the ending of the string
        str = str.trim();
  
        // Replace all the consecutive white
        // spaces with a single space
        str = str.replaceAll(" +", " ");
        
        int sem=Integer.parseInt(str);
        if (str.equals(""))
            return -1;
        
        
        return sem;
    }
	
}

package javaFiles;

import java.text.DecimalFormat;
import java.util.Random;

public class OTPGenerate {
	public String OTP() {
		 String otp= new DecimalFormat("000000").format(new Random().nextInt(999999));
		 return otp;
	}
}

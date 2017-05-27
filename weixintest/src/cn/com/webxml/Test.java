package cn.com.webxml;

public class Test {
	 public static void main(String[] args) {
	        MobileCodeWS ws=new MobileCodeWS();
	        MobileCodeWSSoap soap = ws.getMobileCodeWSSoap();
	        String info = soap.getMobileCodeInfo("1860031", null);
	        System.out.println(info);
	    }

}

package ftp;

import javax.jws.WebService;
import javax.xml.ws.Endpoint;
//发布ftp  作为webservice 此处为实验
@WebService
public class TestWsdl {
	public void getFile(){
		FTPMain ftpMain = new FTPMain();
		ftpMain.getFile();
	}
	public static void main(String[] args) {
		Endpoint.publish("http://127.0.0.1:8080/TestWsdl", new TestWsdl());
		System.out.println("service build");
		
	}

}

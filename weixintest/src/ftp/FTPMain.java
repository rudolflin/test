package ftp;

import java.io.InputStream;  
import java.util.Properties;  
  
import org.apache.log4j.Logger;  
  

  
public class FTPMain {  
      
    private static Logger logger = Logger.getLogger(FTPMain.class);  
    public void  getFile(){
    	  int ftpPort = 0;  
          String ftpUserName = "";  
          String ftpPassword = "";  
          String ftpHost = "";  
          String ftpPath = "";  
          String writeTempFielPath = "";  
          try {  
              InputStream in = FTPUtil.class.getClassLoader()  
                      .getResourceAsStream("env.properties");  
              if (in == null) {  
                  logger.info("配置文件env.properties读取失败");  
              } else {  
              	System.out.println("配置文件env.properties读取成功");
                  Properties properties = new Properties();  
                  properties.load(in);  
                  ftpUserName = properties.getProperty("ftpUserName");  
                  ftpPassword = properties.getProperty("ftpPassword");  
                  ftpHost = properties.getProperty("ftpHost");  
                  ftpPort = Integer.valueOf(properties.getProperty("ftpPort"))  
                          .intValue();  
                  ftpPath = properties.getProperty("ftpPath");  
                  writeTempFielPath = properties.getProperty("writeTempFielPath");  
                    
                  ReadFTPFile read = new ReadFTPFile();  
                  String result = read.readConfigFileForFTP(ftpUserName, ftpPassword, ftpPath, ftpHost, ftpPort, "1.txt");  
                  System.out.println("读取配置文件结果为：" + result);  
                    
//                  WriteFTPFile write = new WriteFTPFile();  
//                  ftpPath = ftpPath + "/" + "2.png";  
//                  write.upload(ftpPath, ftpUserName, ftpPassword, ftpHost, ftpPort, result, writeTempFielPath);  
              }  
          } catch (Exception e) {  
              e.printStackTrace();  
          }  
    }
  
    public static void main(String[] args) {  
        int ftpPort = 0;  
        String ftpUserName = "";  
        String ftpPassword = "";  
        String ftpHost = "";  
        String ftpPath = "";  
        String writeTempFielPath = "";  
        try {  
            InputStream in = FTPUtil.class.getClassLoader()  
                    .getResourceAsStream("env.properties");  
            if (in == null) {  
                logger.info("配置文件env.properties读取失败");  
            } else {  
            	System.out.println("配置文件env.properties读取成功");
                Properties properties = new Properties();  
                properties.load(in);  
                ftpUserName = properties.getProperty("ftpUserName");  
                ftpPassword = properties.getProperty("ftpPassword");  
                ftpHost = properties.getProperty("ftpHost");  
                ftpPort = Integer.valueOf(properties.getProperty("ftpPort"))  
                        .intValue();  
                ftpPath = properties.getProperty("ftpPath");  
                writeTempFielPath = properties.getProperty("writeTempFielPath");  
                  
                ReadFTPFile read = new ReadFTPFile();  
                String result = read.readConfigFileForFTP(ftpUserName, ftpPassword, ftpPath, ftpHost, ftpPort, "1.txt");  
                System.out.println("读取配置文件结果为：" + result);  
                  
//                WriteFTPFile write = new WriteFTPFile();  
//                ftpPath = ftpPath + "/" + "2.png";  
//                write.upload(ftpPath, ftpUserName, ftpPassword, ftpHost, ftpPort, result, writeTempFielPath);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
}  
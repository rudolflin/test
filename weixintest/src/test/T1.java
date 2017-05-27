package test;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.codehaus.jackson.map.ObjectMapper;

import com.fasterxml.jackson.core.type.TypeReference;
//去除json中的多余"
public class T1 {
	public static void main(String[] args) {
		test1();
//		test2();
//		test3();
//	  
	}
	//json–>javaBean
	public static void test1(){
		 String json = "{\"id\":\"1\",\"name\":\"红\"楼\"'梦\",\"price\":\"90\",\"author\":\"曹雪芹\"}";
	        List<String> tags = new ArrayList<String>();
	        Pattern pattern = Pattern.compile("\\\"([a-zA-Z0-9]*)\\\":");
	        Matcher m = pattern.matcher(json);
	        while (m.find()) {
	            tags.add(m.group(1));
	        }
	        for (int i = 0; i < tags.size(); i++) {
	        	System.out.println(tags.get(i)+"--"+i);
	            json = json
	                    .replaceAll("\\\"" + tags.get(i) + "\\\"",
	                            "^^" + tags.get(i) + "^^")
	                    .replaceAll(":\\\"", ":^^").replaceAll("\\\",", "^^,");
	            System.out.println( json.toString()+"---"+i);
	        }
	        json = json.replaceAll("\\\"}", "^^}").replaceAll("\\\"]", "^^]")
	                .replaceAll("\"", "~~");
	        System.out.println(json);
	        json = json.replace("^^", "\"");
	        System.out.println(json);
	        ObjectMapper mapper = new ObjectMapper();
	        
	        try {
	            Book book = mapper.readValue(json, Book.class);
	            book.setName(book.getName().replace("~~", "\""));
	            System.out.println("作者：" + book.getAuthor() + "\n书名："
	                    + book.getName());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}
	//json–>list
	public static  void test2() {
        String json = "[{\"id\":\"1\",\"name\":\"红\"楼\"'梦\",\"price\":\"90\",\"author\":\"曹雪芹\"},{\"id\":\"2\",\"name\":\"西游\"\"记\",\"price\":\"45\",\"author\":\"wuche\"ngen\"}]";
        List<String> tags = new ArrayList<String>();
        Pattern pattern = Pattern.compile("\\\"([a-zA-Z0-9]*)\\\":");
        Matcher m = pattern.matcher(json);
        while (m.find()) {
            tags.add(m.group(1));
        }
        for (int i = 0; i < tags.size(); i++) {
            json = json
                    .replaceAll("\\\"" + tags.get(i) + "\\\"",
                            "^^" + tags.get(i) + "^^")
                    .replaceAll(":\\\"", ":^^").replaceAll("\\\",", "^^,");
        }
        json = json.replaceAll("\\\"}", "^^}").replaceAll("\"", "~~");
        json = json.replace("^^", "\"");
        ObjectMapper mapper = new ObjectMapper();
       System.out.println(json.toString());
      /*  try {
            List<Book> books = mapper.readValue(json,
                    new TypeReference<ArrayList<Book>>() {
                    });
            for (Book book : books) {
                book.setName(book.getName().replace("~~", "\""));
                book.setAuthor(book.getAuthor().replace("~~", "\""));
                System.out.println("作者：" + book.getAuthor() + "\n书名："
                        + book.getName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }*/
    }
	public static  void test3(){
		 String json = "{\"respCode\":\"8888\",\"respMsg\":\"[INDETERMINATE]Utility.cpp:207,12CRMException-300041: TCS_ChangeServiceReg执行异常: [WARNING]TradeCheckAfterTrade.cpp:2297,12CRMException-300041: 业务登记后条件判断:退出产品校验TAG校验异常！ Caused by: [WARNING]TradeCheckAfterTrade.cpp:7537,12CRMException-300041: 重复选择，业务无法继续！\"江西省1天假日包2.7元1GB(五四版) -- 江西省1天假日包2.7元1GB(五四版) -- 江西省内流量假日包2.7元1GB1天(五四版)(1)\"、\"江西省1天假日包2.7元1GB(五四版) -- 江西省1天假日包2.7元1GB(五四版) -- 江西省内流量假日包2.7元1GB1天(五四版)(1)\"\"}  ";
	        List<String> tags = new ArrayList<String>();
	        Pattern pattern = Pattern.compile("\\\"([a-zA-Z0-9]*)\\\":");
	        Matcher m = pattern.matcher(json);
	        while (m.find()) {
	            tags.add(m.group(1));
	        }
	        
	        for (int i = 0; i < tags.size(); i++) {
//	        	System.out.println(tags.get(i));
	            json = json
	                    .replaceAll("\\\"" + tags.get(i) + "\\\"",
	                            "^^" + tags.get(i) + "^^")
	                    .replaceAll(":\\\"", ":^^").replaceAll("\\\",", "^^,");
//	            System.out.println(json.toString());
	        }
	        json = json.replaceAll("\\\"}", "^^}").replaceAll("\\\"]", "^^]")
	                .replaceAll("\"", "~~");
	        json = json.replace("^^", "\"");
	       System.out.println( json.toString());
	       /* ObjectMapper mapper = new ObjectMapper();
	        try {
	            Book book = mapper.readValue(json, Book.class);
	            book.setName(book.getName().replace("~~", "\""));
	            System.out.println("作者：" + book.getAuthor() + "\n书名："
	                    + book.getName());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }*/
	}
	 
	     
}

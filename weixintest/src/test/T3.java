package test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;


public class T3 {
	private static Object json;

	public static void main(String[] args) {
	Book book1 = new Book("12", "1", "jdal", "dfas");
	Book book2 = new Book("12.2", "1", "jdal", "dfas");
	Book book3 = new Book("12.5", "1", "jdal", "dfas");
	Book book4 = new Book("12.7", "1", "jdal", "dfas");
	json = JSON.toJSON(book1);
	System.out.println("full"+json.toString());
	
	

	
	
	}
}

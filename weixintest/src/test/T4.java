package test;

import org.junit.Assert;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;

public class T4 {
	public static void main(String[] args) {
		VO vo = new VO();
	    
		vo.setId(123);
		vo.setName("flym");
		      
//		SimplePropertyPreFilter filter = new SimplePropertyPreFilter(VO.class, "name");
//		SimplePropertyPreFilter filter = new SimplePropertyPreFilter(VO.class);
//		filter.e
//		Assert.assertEquals("{\"name\":\"flym\"}", JSON.toJSONString(vo, filter));
//		System.out.println(JSON.toJSONString(vo, filter));
	}

	
	      
	public static class VO {
	      private int    id;
	      private String name;
	      
	      public int getId() {
	          return id;
	      }
	      public void setId(int id) {
	          this.id = id;
	      }

	      public String getName() {
	          return name;
	      }
	      public void setName(String name) {
	          this.name = name;
	    }
	}
}

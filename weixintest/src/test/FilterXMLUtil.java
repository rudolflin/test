package test;

import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FilterXMLUtil {
	public static void main(String[] args) {
		String xml="<?xml version=\"1.0\" encoding=\"UTF-8\"?><books><book><id>1</id><name><三国<><演><演>义</name><price>4<>5</price><author>罗贯中</author></book></books>";
		String result = filterIllegalityChar(xml);
		System.out.println(result);
	}
    /**
     * 传入一个xml字符串，将其中的多余的<>转义后返回
     * @param xmlStr
     * @return
     */
    public static String filterIllegalityChar(String xmlStr) {
        //用来存放标签的集合
        List<String> tags = new ArrayList<String>();
        //去掉最前面的两个尖括号
        xmlStr = xmlStr.replace("<?xml", "?xml").replace("\"UTF-8\"?>", "\"UTF-8\"?");
        //通过正则找到所有的标签
        Pattern tag = Pattern.compile("<([a-zA-Z0-9]+)>");
        Matcher mc = tag.matcher(xmlStr);
        while(mc.find()){
            //匹配成功之后将之存入list中
            tags.add(mc.group(1));
        }
        /**
         * 临时替代符号
         * <-----------> ^^
         * >----------->~~
         * </---------->##/
         */
        for(int i = 0;i<tags.size();i++){
            xmlStr = xmlStr.replaceAll("<" + tags.get(i) + ">",
                    "^^"+tags.get(i)+"~~").replaceAll("</"+tags.get(i)+">", "##/"+tags.get(i)+"~~");
        }
        //转义
        xmlStr = xmlStr.replaceAll("<", "&lt;").replace(">", "&gt;");
        //转换回来
        xmlStr = xmlStr.replace("^^", "<").replace("~~", ">").replace("##/", "</").replace("?xml", "<?xml").replace("\"UTF-8\"?", "\"UTF-8\"?>");
        return xmlStr;
    }
}
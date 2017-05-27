/*package generateTable;

import java.lang.reflect.*;
import java.lang.annotation.*;
import java.util.*;



 
 public class TableCreator {
     private static String getConstraints(Constraints constraints) { // 获取字段约束属性
         String cons = "";
         if (!constraints.allowNull()) {
             cons += " NOT NULL";
         }
         if (constraints.primaryKey()) {
             cons += " PRIMARY KEY";
         }
         if (constraints.unique()) {
             cons += " UNIQUE";
         }
         return cons; 
     }
     
      这边还需要通过IO来遍历指定model包下所有实体类， 如上，待下一篇优化
     private static ArrayList<String> getTables() {
         ArrayList<String> tables = new ArrayList<String>();
         Package pckg = Package.getPackage("model");
         Class<?>[] cls = pckg.; 
         for (Class<?> cl : cls) {
             tables.add(cl.getName());
         }
         return tables;
     }
     
     
     public static String getSql() throws ClassNotFoundException {
         String sql = null;
         //ArrayList<String> tables = getTables();
         String[] tables = {"model.User"};
         for (String className : tables) {
             
             String[] table = className.split("\\.");
             for (String tb : table) {
                 System.out.println(tb);
             }
             
             Class<?> cl = Class.forName(className);            // 通过类名得到该实体类
             DBTable dbtable = cl.getAnnotation(DBTable.class); // 通过注解得到表明
             String tableName = dbtable.name().length() > 1 ? dbtable.name() : cl.getName().toUpperCase();
              comments
             System.out.println("tableName: " + tableName);
             
             List<String> columns = new ArrayList<String>();
             for (Field field : cl.getDeclaredFields()) {       // 得到该类下所有属性
                 String columnName = null;
                 Annotation[] annotations = field.getAnnotations();
                 if (annotations.length < 1) {
                     continue;
                 }
                 if (annotations[0] instanceof SQLInteger) {
                     SQLInteger sStr = (SQLInteger)annotations[0];
                     columnName = sStr.name().length() < 1 ? field.getName() : sStr.name();
                     columns.add(columnName + " VARCHAR(" + sStr.size() + ")" + getConstraints(sStr.constraints()));
                 }
             }
             
             StringBuilder sb = new StringBuilder("Create Table " + tableName + "(");
             for (String column : columns) {
                 sb.append("\n    " + column + ",");            // 拼接各个字段的定义语句
             }
             sql = sb.substring(0, sb.length() - 1) +");";
         }
         System.out.println("=========" + sql + "=========");   // 测试输出
         return sql;
     }
 }*/
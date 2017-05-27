package generateTable;

import java.lang.annotation.*;

@Inherited                             // 允许子类继承父类中的注解
@Documented                            // 将此注解包含在Javadoc中 
@Target(ElementType.TYPE)              // 类、接口（包括注解类型）或枚举类型声明
@Retention(RetentionPolicy.RUNTIME)    // VM在运行时保留注解，从而通过反射获取信息

public @interface DBTable {
     public String name() default "";   // 注解未赋值是，默认为空
 }
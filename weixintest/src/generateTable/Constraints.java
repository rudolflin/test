package generateTable;

import java.lang.annotation.*;

@Inherited
@Documented
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)

public @interface Constraints {
     boolean primaryKey() default false;   // 主键，默认为空
     boolean allowNull() default true;     // 默认允许为空
     boolean unique() default false;          // 默认允许重复
 }

package cn.mogao.annotation;

import java.lang.annotation.*;

/**
 *
 * @author yq
 * @Date  2019/04/15
 *
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**模块*/
    String module() default "";

    /**描述*/
    String description() default "";
}
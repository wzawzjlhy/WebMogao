package cn.mogao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

/**
 *
 * @author yq
 * @Date  2019/04/16
 *
 */

@SpringBootApplication
@ComponentScan(basePackages = {"cn.mogao.*"})
@ServletComponentScan
public class YqApplication extends SpringBootServletInitializer{

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(YqApplication.class);
    }
    public static void main(String[] args) {
        SpringApplication.run(YqApplication.class, args);
    }
}
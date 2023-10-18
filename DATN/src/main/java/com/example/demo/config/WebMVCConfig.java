package com.example.demo.config;

import com.example.demo.filler.loGinInterceptor;
import com.example.demo.filler.adminInterceptor;
import com.example.demo.filler.userInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");

        registry
                .addResourceHandler("/upload/**")
                .addResourceLocations("/upload/");
    }


    //   Authorize the size web

    @Autowired
    loGinInterceptor loginInterceptor;

    @Autowired
    adminInterceptor adminInterceptor;

    @Autowired
    userInterceptor userInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry){

        //chỉ xem member
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/checkout", "/profile","/product/list","/category/list");


        //Phân quyền bắt đăng nhập
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/**");

//        registry.addInterceptor(userInterceptor)
//                .addPathPatterns("/user/**");
      }
}





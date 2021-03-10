package com.blog.service;

import com.blog.dao.BlogTypeMapper;
import com.blog.pojo.BlogType;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

/**
 * @author shkstart
 * @create 2021-03-02 16:40
 */
//@Component
//public class InitComponent implements ServletContextListener, ApplicationContextAware {
//    private static ApplicationContext applicationContext;
//
//
//    //项目初始化时会执行它
//    @Override
//    public void contextInitialized(ServletContextEvent servletContextEvent) {
//        //获取servletContext对象
//        ServletContext servletContext = servletContextEvent.getServletContext();
//        //从容器中取出blogTypeService,并查询所有博客类型存到servletContext中
//        BlogTypeService blogTypeService = applicationContext.getBean(BlogTypeService.class);
//        List<BlogType> blogTypes = blogTypeService.getBlogTypes();
//        servletContext.setAttribute("blogTypes",blogTypes);
//
//
//    }
//
//    @Override
//    public void contextDestroyed(ServletContextEvent servletContextEvent) {
//
//    }
//
//    @Override
//    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
//        this.applicationContext = applicationContext;
//    }
//}

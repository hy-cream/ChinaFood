package com.hy.commons;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by huyu on 2017/7/19.
 */
public class Test {
    public static void main(String[] args){
        ApplicationContext context=new ClassPathXmlApplicationContext("WEB-INF/spring-dao.xml");
        System.out.print(context.toString());
        SqlSessionFactory factory= (SqlSessionFactory) context.getBean("sqlSessionFactory");
        System.out.print("-----------------"+factory.toString());

    }
}

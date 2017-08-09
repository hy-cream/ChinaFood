package com.hy.service;


import com.hy.bean.FoodMethod;

import com.hy.dao.MethodMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * Created by huyu on 2017/6/22.
 */
@Service
public class MethodService {

    @Autowired
    @Qualifier("methodMapper")
    private MethodMapper methodMapper;

    public MethodService() {

    }

    public MethodService(MethodMapper methodMapper) {
        this.methodMapper=methodMapper;
    }

    public MethodMapper getMethodMapper() {
        return methodMapper;
    }

    public void setMethodMapper(MethodMapper methodMapper) {
        this.methodMapper = methodMapper;
    }

    public TreeSet<FoodMethod> getAllMethod(){

        TreeSet<FoodMethod> set=new TreeSet<FoodMethod>();
        set.addAll(methodMapper.findAllMethod());
        return set;
    }

    public FoodMethod addMethod(FoodMethod method){
        int num=0;
        num=methodMapper.addMethod(method);
        if(num==0){
            //抛出异常
        }
        System.out.println("methodService-----------addMethod====="+method.getId());
        return method;
    }


}

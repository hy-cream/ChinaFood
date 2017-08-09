package com.hy.dao;


import com.hy.bean.FoodMethod;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.Set;

/**
 * Created by huyu on 2017/6/22.
 */
@Repository
public interface MethodMapper {
    Set<FoodMethod> findAllMethod();
    int addMethod(FoodMethod method);
}

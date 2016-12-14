/*
package com.fh.junit;

import com.fh.service.datacenter.busorder.BusOrderReportManager;
import com.fh.util.PageData;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

*/
/**
 * 描述:
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/6/21
 * 创建时间: 12:07
 *//*

public class BaseTest {

    @Resource
    private BusOrderReportManager busOrderService;
    @Before
    public void before(){
        @SuppressWarnings("resource")
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring/ApplicationContext*.xml","classpath:mybatis*/
/*.xml"});
        busOrderService = (BusOrderReportManager) context.getBean("BusOrderService");
    }

    @Test
    public void queryData() throws Exception {
        String citys = "1,2,3";
        PageData pd = new PageData();
        pd.put("status", 0);//默认状态
        pd.put("lastLoginStart", "2016");
        String[] city = citys.split(",");//获取用户所有城市信息
        List resultList = busOrderService.queryBusYear(pd, city);
        System.out.println(resultList.size());
    }
}
*/

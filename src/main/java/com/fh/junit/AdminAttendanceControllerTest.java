/*
package com.fh.junit;

import com.fh.junit.base.BaseTest;
import com.fh.service.applicationuser.ApplicationUserManager;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

*/
/**
 * 描述: 员工出勤测试类
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/5/18
 * 创建时间: 10:08
 *//*

public class AdminAttendanceControllerTest extends BaseTest {
    @Autowired ApplicationUserManager applicationuserService;

    @Test
    public void TestList() {
        try {
            System.out.println("====进入测试=====");
            MockHttpServletRequest request = new MockHttpServletRequest();
            MockHttpServletResponse response = new MockHttpServletResponse();
            //请求页面
            request.setServletPath("jsp/attendance/adminattendance/attendance_list.jsp");
            final ModelAndView mav = this.excuteAction(request, response);
            //调用接口
            Assert.assertEquals("userManager/userlist", mav.getViewName());
            String msg=(String)request.getAttribute("msg");
            System.out.println(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
*/

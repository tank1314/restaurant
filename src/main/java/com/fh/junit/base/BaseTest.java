/*
package com.fh.junit.base;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.BeforeClass;
import org.springframework.mock.web.MockServletContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.HandlerExecutionChain;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter;
import org.springframework.web.servlet.mvc.annotation.DefaultAnnotationHandlerMapping;

*/
/**
 * 描述:Junit测试基类
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/5/18
 * 创建时间: 9:40
 *//*

public class BaseTest {
    private static HandlerMapping handlerMapping;
    private static HandlerAdapter handlerAdapter;

    */
/**
     * 读取配置文件
     *//*

    @BeforeClass
    public static void setUp(){
        System.out.println("===Base测试类====");
        if(handlerMapping == null){
            String[] configs = {"file:src/main/resources/spring/ApplicationContext.xml" ,"file:src/main/resources/spring/ApplicationContext-mvc.xml"};
            XmlWebApplicationContext context = new XmlWebApplicationContext();
            context.setConfigLocations(configs);
            MockServletContext msc = new MockServletContext();
            context.setServletContext(msc);
            context.refresh();
            msc.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE,context);
            handlerMapping = context.getBean(DefaultAnnotationHandlerMapping.class);
            handlerAdapter = (HandlerAdapter) context.getBean(context.getBeanNamesForType(AnnotationMethodHandlerAdapter.class)[0]);
        }
    }

    */
/**
     * 执行request请求
     * @param request
     * @param response
     * @return
     * @throws Exception
     *//*

    public ModelAndView excuteAction(HttpServletRequest request,HttpServletResponse response) throws Exception{
        // 这里需要声明request的实际类型，否则会报错
        request.setAttribute(HandlerMapping.INTROSPECT_TYPE_LEVEL_MAPPING, true);
        HandlerExecutionChain chain = handlerMapping.getHandler(request);
        ModelAndView model = null;
        try {
            model = handlerAdapter.handle(request,response,chain.getHandler());
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return model ;
    }
}
*/

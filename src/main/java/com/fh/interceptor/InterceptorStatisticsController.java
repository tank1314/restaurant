package com.fh.interceptor;

import com.fh.service.interceptor.InterceptorManager;
import com.fh.service.interceptor.impl.InterceptorService;
import com.fh.util.Const;
import com.fh.util.PageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by admin on 2016/5/10.
 */
public class InterceptorStatisticsController  extends HandlerInterceptorAdapter {

    @Autowired
    private InterceptorManager interceptorService;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // TODO Auto-generated method stub
        String path = request.getServletPath();
        try {
            if(path.matches(Const.NO_INTERCEPTOR_STATISTICS_PATH)){
                return true;
            }else {
                //System.out.println("wojinlaile ");
                String ip = request.getHeader("x-forwarded-for");
                if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getHeader("Proxy-Client-IP");
                }
                if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getHeader("WL-Proxy-Client-IP");
                }
                if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getRemoteAddr();
                }

                String username = (String)request.getSession().getAttribute("USERNAME");
                //System.out.println(username);

                //获取到/test/index.jsp （服务路径名）
                //System.out.println("aaa" + request.getServletPath());
                //获取到/epet/test/index.jsp（请求地址）
                //System.out.println("bb" + request.getRequestURI());

                PageData pd= new PageData(request);
                pd.put("ip",ip);
                if (request.getRequestURI().startsWith("/")){
                    pd.put("request_url",request.getRequestURI().substring(1));
                }else {
                    pd.put("request_url",request.getRequestURI());
                }
                pd.put("username",username);
                PageData user=interceptorService.queryUserIdByUsername(pd);
                pd.put("user_id",user.get("USER_ID"));
                PageData requestURI=interceptorService.queryMenuNameByRequestURI(pd);
                if (null!=requestURI){
                    pd.put("menu_name",requestURI.get("MENU_NAME"));
                }else {
                    pd.put("menu_name","");
                }
                interceptorService.saveInterceptor(pd);
                return true;
            }
        }catch (Exception e){
            return true;
        }
    }
}

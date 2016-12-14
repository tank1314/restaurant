/*package com.fh.controller.app.appuser;

*//**
 * Created by chenliang on 16/6/23.
 *//*

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fh.controller.base.BaseController;
import com.fh.util.PageData;
import com.fh.util.WXQYUtils;
import com.niuhome.framework.cache.Cache;
import com.niuhome.framework.http.HttpUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value="/app")
public class TestController extends BaseController {
    public static String secret="obcKG_grBcLF5Xah8-EoAwu0L9vF5ShYiu9UWZx3N-ONtW2yKPS5qO0wdlu9x1VG";
    public static String CorpID="wx7863b74fc722635f";
    public static String accessTokenURL="https://qyapi.weixin.qq.com/cgi-bin/gettoken?";
    public static String jsapi_ticket="https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?";
    @Resource(name = "redisCache")
    private Cache cache;

    @RequestMapping(value ="/list")
    public ModelAndView getWeixiN(){
        String qytoken = (String) cache.get("wxqy_access_token_test");
        if(qytoken==null){
            HashMap token=new HashMap();
            token.put("corpid",CorpID);
            token.put("corpsecret",secret);
            String response=HttpUtil.doGet(accessTokenURL,token);
            JSONObject js = (JSONObject) JSON.parse(response);
            String access_token= js.getString("access_token");
            int expires_time=js.getIntValue("expires_in");
            cache.put("wxqy_access_token_test",access_token,expires_time-100);
        }

        String jsToken = (String) cache.get("wxqy_jstoken_test");
        if(jsToken==null){
            HashMap jsTokenMap=new HashMap();
            jsTokenMap.put("access_token",qytoken);
            String response=
                    HttpUtil.doGet(jsapi_ticket,jsTokenMap);
            JSONObject js = (JSONObject) JSON.parse(response);
            String ticket= js.getString("ticket");
            int expires_time=js.getIntValue("expires_in");
            cache.put("wxqy_jstoken_test",ticket,expires_time-100);
        }

        String path = getRequest().getContextPath();
        String basePath = getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+path+"/";

        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        Map<String, String> wx_map =  WXQYUtils.sign(jsToken,basePath);
        wx_map.put("appId",CorpID);
        pd.put("wx_map",wx_map);
        mv.addObject("pd", pd);
        mv.setViewName("m/t");

        return mv;
    }
}
*/
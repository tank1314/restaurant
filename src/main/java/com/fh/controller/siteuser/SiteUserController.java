package com.fh.controller.siteuser;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.siteuser.impl.SiteUserService;
import com.fh.service.userinfo.impl.UserInfoService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2016/4/19.
 */
@Controller
@RequestMapping(value="/siteUser")
public class SiteUserController extends BaseController {

    @Autowired
    private SiteUserService siteUserService;

    @RequestMapping(value="/list")
    public ModelAndView list(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"门店用户");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("/siteuser/siteUser");
        mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
        return mv;
    }

    /**
     * 新增人数
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/querySiteUser")
    public String querySiteUser(Page page) throws Exception{
        PageData pd = new PageData();
        pd = this.getPageData();
        page.setPd(pd);
        List<PageData> varList = siteUserService.querySiteUser(page);
        int totalSiteUserList =siteUserService.queryTotalSiteUser(page);
        List siteList=new ArrayList();
        List dataList=new ArrayList();
        Map<String,Object> resultMap=new HashMap<String, Object>();
        for (PageData pageData : varList) {
            siteList.add(pageData.get("site_name"));
            dataList.add(pageData.get("userCount"));
        }
        resultMap.put("site_name",siteList);
        resultMap.put("userCount",dataList);
        resultMap.put("userTotal",totalSiteUserList);

        ObjectMapper json=new ObjectMapper();
        String date=json.writeValueAsString(resultMap);
        return date;
    }

}

package com.fh.controller.datacenter;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.datacenter.impl.DataCenterService;
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
@RequestMapping(value="/dataCenter")
public class DataCenterController extends BaseController {


    @Autowired
    private DataCenterService dataCenterService;

    @RequestMapping(value="/list")
    public ModelAndView list(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"数据中心列表");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
/*        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");				//关键词检索条件
        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
        page.setPd(pd);
        List<PageData> varList = dataCenterService.list(page);	//列出TwoYear列表*/
        mv.setViewName("/datacenter/dataCenter");
/*        mv.addObject("varList", varList);
        mv.addObject("pd", pd);*/
        mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
        return mv;
    }

    /**
     * 站点已服务订单统计
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/querySiteData")
    public String querySiteData(Page page) throws Exception{
        PageData pd = new PageData();
        pd = this.getPageData();
        page.setPd(pd);
        List<PageData> varList = dataCenterService.list(page);
        List siteList=new ArrayList();
        List dataList=new ArrayList();
        Map<String,Object> resultMap=new HashMap<String, Object>();
        for (PageData pageData : varList) {
            siteList.add(pageData.get("siteName"));
            dataList.add(pageData.get("orderCount"));
        }
        resultMap.put("siteName",siteList);
        resultMap.put("orderCount",dataList);

        ObjectMapper json=new ObjectMapper();
        String date=json.writeValueAsString(resultMap);
        return date;
    }


    /**
     * 订单变化统计
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/queryOrderChangeList")
    public String queryOrderChangeList(Page page) throws Exception{
        PageData pd = new PageData();
        pd = this.getPageData();
        page.setPd(pd);
        List<PageData> varList = dataCenterService.queryOrderChangeList(page);
        List siteList=new ArrayList();
        List dataList=new ArrayList();
        Map<String,Object> resultMap=new HashMap<String, Object>();
        for (PageData pageData : varList) {
            siteList.add(pageData.get("siteName"));
            dataList.add(pageData.get("orderCount"));
        }
        resultMap.put("siteName",siteList);
        resultMap.put("orderCount",dataList);

        ObjectMapper json=new ObjectMapper();
        String date=json.writeValueAsString(resultMap);
        return date;
    }


    /**
     * 专项已服务订单统计
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/queryServiceData")
    public String queryServiceData(Page page) throws Exception{
        PageData pd = new PageData();
        pd = this.getPageData();
        page.setPd(pd);
        List<PageData> varList = dataCenterService.queryServiceData(page);

        if (varList.size()==0){
            PageData resultPd=new PageData();
            resultPd.put("value",0);
            varList.add(resultPd);
        }

        ObjectMapper json=new ObjectMapper();
        String date=json.writeValueAsString(varList);
        return date;
    }

   /**
     * 各终端下载量统计
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/queryTerminalServiceData")
    public String queryTerminalServiceData(Page page) throws Exception{
        PageData pd = new PageData();
        pd = this.getPageData();
        page.setPd(pd);
        List<PageData> varList = dataCenterService.queryTerminalServiceData(page);
        if (varList.size()==0){
            PageData resultPd=new PageData();
            resultPd.put("value",0);
            varList.add(resultPd);
        }
        ObjectMapper json=new ObjectMapper();
        String date=json.writeValueAsString(varList);
        return date;
    }

  /**
     * 各时间段下单量统计
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/queryTimeServiceData")
    public String queryTimeServiceData(Page page) throws Exception{
        PageData pd = new PageData();
        pd = this.getPageData();
        page.setPd(pd);
        List<PageData> varList = dataCenterService.queryTimeServiceData(page);
        if (varList.size()==0){
            PageData resultPd=new PageData();
            resultPd.put("value",0);
            varList.add(resultPd);
        }
        ObjectMapper json=new ObjectMapper();
        String date=json.writeValueAsString(varList);
        return date;
    }

  /**
     * 订单倍率统计
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/queryRateServiceData")
    public String queryRateServiceData(Page page) throws Exception{
        PageData pd = new PageData();
        pd = this.getPageData();
        page.setPd(pd);
        List<PageData> varList = dataCenterService.queryRateServiceData(page);
        if (varList.size()==0){
            PageData resultPd=new PageData();
            resultPd.put("value",0);
            varList.add(resultPd);
        }
        ObjectMapper json=new ObjectMapper();
        String date=json.writeValueAsString(varList);
        return date;
    }



}

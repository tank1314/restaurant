package com.fh.controller.yhinfo.orderserver;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.annotation.Resource;

import com.fh.util.ObjectExcelView;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.yhinfo.yhinfo.OrderServerManager;

/** 
 * 说明：订单服务记录
 * 创建人：FH Q313596790
 * 创建时间：2016-04-26
 */
@Controller
@RequestMapping(value="/orderserver")
public class OrderServerController extends BaseController {
	
	String menuUrl = "orderserver/list.do"; //菜单地址(权限用)
	@Resource(name="orderserverService")
	private OrderServerManager orderserverService;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表OrderServer");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

        List listSite = orderserverService.listAllSite(pd); //站点集合
		String keywords = pd.getString("keywords");				//关键词检索条件
        String site_sid = pd.getString("site_sid");         //站点id
        String lastLoginStart = pd.getString("lastLoginStart");//开始时间
        String lastLoginEnd = pd.getString("lastLoginEnd");//结束时间
        String has_collect_info= pd.getString("has_collect_info");//是否已收集
        String is_evaluate = pd.getString("is_evaluate"); //是否评价处理
		if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
        if(null != site_sid && !"".equals(site_sid)){
            pd.put("site_sid", site_sid);
        }
        if(null !=lastLoginStart && !"".equals(lastLoginStart)){
            pd.put("lastLoginStart",lastLoginStart);
        }
        if(null !=lastLoginEnd && !"".equals(lastLoginEnd)){
            pd.put("lastLoginEnd",lastLoginEnd);
        }
        if(null !=has_collect_info && !"".equals(has_collect_info)){
            pd.put("has_collect_info",has_collect_info);
        }
        if(null !=is_evaluate && !"".equals(is_evaluate)){
            pd.put("is_evaluate",is_evaluate);
        }

		page.setPd(pd);
		List<PageData>	varList = orderserverService.list(page);	//列出OrderServer列表

		mv.setViewName("yhinfo/orderserver/orderserver_list");
		mv.addObject("varList", varList);
        mv.addObject("siteList",listSite);
        mv.addObject("has_collect_info",has_collect_info);
        mv.addObject("is_evaluate",is_evaluate);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	/* *//**导出到excel
	 * @param
	 * @throws Exception
	 *//*
	@RequestMapping(value="/excel")
	/**导出用户信息到EXCEL
	 * @return
	 */
    @RequestMapping(value="/excel")
    public ModelAndView exportExcel(){
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try{
            if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
                String keywords = pd.getString("keywords");				//关键词检索条件
                String site_sid = pd.getString("site_sid");         //站点id
                String lastLoginStart = pd.getString("lastLoginStart");//开始时间
                String lastLoginEnd = pd.getString("lastLoginEnd");//结束时间
                String has_collect_info= pd.getString("has_collect_info");//是否已收集
                String is_evaluate = pd.getString("is_evaluate"); //是否评价处理
                if(null != keywords && !"".equals(keywords)){
                    pd.put("keywords", keywords.trim());
                }
                if(null != site_sid && !"".equals(site_sid)){
                    pd.put("site_sid", site_sid);
                }
                if(null !=lastLoginStart && !"".equals(lastLoginStart)){
                    pd.put("lastLoginStart",lastLoginStart);
                }
                if(null !=lastLoginEnd && !"".equals(lastLoginEnd)){
                    pd.put("lastLoginEnd",lastLoginEnd);
                }
                if(null !=has_collect_info && !"".equals(has_collect_info)){
                    pd.put("has_collect_info",has_collect_info);
                }
                if(null !=is_evaluate && !"".equals(is_evaluate)){
                    pd.put("is_evaluate",is_evaluate);
                }
                Map<String,Object> dataMap = new HashMap<String,Object>();
                List<String> titles = new ArrayList<String>();
                titles.add("订单编号"); 		//1
                titles.add("服务员工号");  		//2
                titles.add("站点名称");			//3
                titles.add("服务日期");			//4
                titles.add("服务时间");			//5
                titles.add("评价详情");			//6
                titles.add("用户习惯");		//7
                dataMap.put("titles", titles);
                List<PageData> userList = orderserverService.listExcel(pd);
                List<PageData> varList = new ArrayList<PageData>();
                for(int i=0;i<userList.size();i++){
                    PageData vpd = new PageData();
                    vpd.put("var1", userList.get(i).getString("id"));		//1
                    vpd.put("var2", userList.get(i).getString("allot_no"));		//2
                    vpd.put("var3", userList.get(i).getString("site_name"));			//3
                    vpd.put("var4", userList.get(i).getString("start_day"));	//4
                    vpd.put("var5", userList.get(i).getString("start_time"));		//5
                    String is_evaluates = userList.get(i).getString("is_evaluate");
                    String service_rating = userList.get(i).getString("service_rating") ;//满意程度
                    String comment = userList.get(i).getString("comment") != null ?userList.get(i).getString("comment").toString():"暂无评价"; //评价
                    String customer_habits = userList.get(i).getString("customer_habits") != null ?userList.get(i).getString("customer_habits").toString():"暂未收集";//用户习惯
                    if("0".equals(is_evaluates)){
                        vpd.put("var6", "");
                    }
                    else{
                        if("满意".equals(service_rating)){
                            vpd.put("var6", "[ "+service_rating+" ]");		//6
                        }
                        else{
                            vpd.put("var6", "[ "+service_rating+" ]"+comment);		//6
                        }
                    }
                    vpd.put("var7", customer_habits);	//7
                    varList.add(vpd);
                }
                dataMap.put("varList", varList);
                ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
                mv = new ModelAndView(erv,dataMap);
            }
        } catch(Exception e){
            logger.error(e.toString(), e);
        }
        return mv;
    }
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

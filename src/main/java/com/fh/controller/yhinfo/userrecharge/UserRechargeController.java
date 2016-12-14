package com.fh.controller.yhinfo.userrecharge;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.yhinfo.yhinfo.UserRechargeManager;

/** 
 * 说明：充值列表展示
 * 创建人：FH Q313596790
 * 创建时间：2016-04-27
 */
@Controller
@RequestMapping(value="/userrecharge")
public class UserRechargeController extends BaseController {
	
	String menuUrl = "userrecharge/list.do"; //菜单地址(权限用)
	@Resource(name="userrechargeService")
	private UserRechargeManager userrechargeService;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表UserRecharge");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
        String keywords = pd.getString("keywords");				//关键词检索条件
        String lastLoginStart = pd.getString("lastLoginStart");//开始时间
        String lastLoginEnd = pd.getString("lastLoginEnd");//结束时间
        String recharge_money= pd.getString("recharge_money");//支付金额

        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
        if(null !=lastLoginStart && !"".equals(lastLoginStart)){
            pd.put("lastLoginStart",lastLoginStart);
        }
        if(null !=lastLoginEnd && !"".equals(lastLoginEnd)){
            pd.put("lastLoginEnd",lastLoginEnd);
        }
        if(null != recharge_money && !"".equals(recharge_money)){
            pd.put("recharge_money", recharge_money);
        }
		page.setPd(pd);
		List<PageData>	varList = userrechargeService.list(page);	//列出UserRecharge列表
		mv.setViewName("yhinfo/userrecharge/userrecharge_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

    @RequestMapping(value="/excel")
    public ModelAndView exportExcel(){
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try{
            if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
                String keywords = pd.getString("keywords");                //关键词检索条件
                String lastLoginStart = pd.getString("lastLoginStart");//开始时间
                String lastLoginEnd = pd.getString("lastLoginEnd");//结束时间
                String recharge_money = pd.getString("recharge_money");//支付金额

                if (null != keywords && !"".equals(keywords)) {
                    pd.put("keywords", keywords.trim());
                }
                if (null != lastLoginStart && !"".equals(lastLoginStart)) {
                    pd.put("lastLoginStart", lastLoginStart);
                }
                if (null != lastLoginEnd && !"".equals(lastLoginEnd)) {
                    pd.put("lastLoginEnd", lastLoginEnd);
                }
                if (null != recharge_money && !"".equals(recharge_money)) {
                    pd.put("recharge_money", recharge_money);
                }
                Map<String, Object> dataMap = new HashMap<String, Object>();
                List<String> titles = new ArrayList<String>();
                titles.add("充值序号");    //1
                titles.add("用户姓名");    //2
                titles.add("手机号码");    //2
                titles.add("充值金额");    //2
                titles.add("充值剩余金额");    //2
                titles.add("赠送金额");    //2
                titles.add("赠送剩余金额");    //2
                titles.add("充值城市");    //2
                titles.add("支付平台");    //2
                titles.add("推广人工号");    //2
                titles.add("充值终端");    //2
                titles.add("支付时间");    //2
                dataMap.put("titles", titles);
                List<PageData> varOList = userrechargeService.listAll(pd);
                List<PageData> varList = new ArrayList<PageData>();
                for (int i = 0; i < varOList.size(); i++) {
                    PageData vpd = new PageData();
                    vpd.put("var1", varOList.get(i).getString("id"));    //1
                    vpd.put("var2", varOList.get(i).getString("realname"));    //2
                    vpd.put("var3", varOList.get(i).getString("mobile"));    //2
                    vpd.put("var4", String.valueOf(varOList.get(i).getDouble("recharge_money")));    //2
                    vpd.put("var5", String.valueOf(varOList.get(i).getDouble("remain_recharge_money")));    //2
                    vpd.put("var6", String.valueOf(varOList.get(i).getDouble("give_money")));    //2
                    vpd.put("var7", String.valueOf(varOList.get(i).getDouble("remain_give_money")));    //2
                    vpd.put("var8", varOList.get(i).getString("recharge_city_name"));    //2
                    vpd.put("var9", varOList.get(i).getString("pay_platform"));    //2
                    vpd.put("var10", varOList.get(i).getString("recommend_no"));    //2
                    vpd.put("var11", varOList.get(i).getString("recharge_terminal"));    //2
                    String pay_time = varOList.get(i).getString("pay_time");
                    vpd.put("var12", varOList.get(i).getString("pay_time"));    //2
                    varList.add(vpd);
                }
                dataMap.put("varList", varList);
                ObjectExcelView erv = new ObjectExcelView();
                mv = new ModelAndView(erv, dataMap);
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

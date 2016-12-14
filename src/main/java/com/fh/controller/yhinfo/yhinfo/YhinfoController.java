package com.fh.controller.yhinfo.yhinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.fh.entity.system.Role;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.yhinfo.yhinfo.YhinfoManager;

/** 
 * 说明：牛魔王用户信息
 * 创建人：FH Q313596790
 * 创建时间：2016-04-25
 */
@Controller
@RequestMapping(value="/yhinfo")
public class YhinfoController extends BaseController {
	
	String menuUrl = "yhinfo/list.do"; //菜单地址(权限用)
	@Resource(name="yhinfoService")
	private YhinfoManager yhinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Yhinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("Yhinfo_ID", this.get32UUID());	//主键
		yhinfoService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Yhinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		yhinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Yhinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		yhinfoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Yhinfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
        String age = pd.getString("age");//年龄区间
        String lastLoginStart = pd.getString("lastLoginStart");//开始时间
        String lastLoginEnd = pd.getString("lastLoginEnd");//结束时间
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
        if(null != age && !"".equals(age)){
            pd.put("age",age);
        }
        if(null !=lastLoginStart && !"".equals(lastLoginStart)){
            pd.put("lastLoginStart",lastLoginStart);
        }
        if(null !=lastLoginEnd && !"".equals(lastLoginEnd)){
            pd.put("lastLoginEnd",lastLoginEnd);
        }
		page.setPd(pd);
		List<PageData>	varList = yhinfoService.list(page);	//列出Yhinfo列表
		mv.setViewName("yhinfo/yhinfo/yhinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
        mv.addObject("age",age);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

    /**
     * 查看用户习惯详情
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/view")
    public ModelAndView view() throws Exception{
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("yhinfo/yhinfo/yhinfo_edit");
        mv.addObject("msg","success");
        mv.addObject("pd", pd);
        return mv;
    }
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("yhinfo/yhinfo/yhinfo_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = yhinfoService.findById(pd);	//根据ID读取
		mv.setViewName("yhinfo/yhinfo/yhinfo_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Yhinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			yhinfoService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Yhinfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("主键");	//1
		titles.add("年龄");	//2
		titles.add("是否是外国人");	//3
		titles.add("是否有小孩");	//4
		titles.add("是否有宠物");	//5
		titles.add("房屋类型");	//6
		titles.add("房屋面积");	//7
		titles.add("顾客习惯");	//8
		titles.add("创建时间");	//9
		titles.add("用户id");	//10
		titles.add("保洁师id");	//11
		titles.add("员工编号");	//12
		titles.add("订单id");	//13
		titles.add("是否已婚");	//14
		titles.add("用户手机号");	//15
		dataMap.put("titles", titles);
		List<PageData> varOList = yhinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("id").toString());	//1
			vpd.put("var2", varOList.get(i).getString("age"));	//2
			vpd.put("var3", varOList.get(i).get("is_foreigner").toString());	//3
			vpd.put("var4", varOList.get(i).getString("child_age"));	//4
			vpd.put("var5", varOList.get(i).getString("pet"));	//5
			vpd.put("var6", varOList.get(i).getString("hourse_type"));	//6
			vpd.put("var7", varOList.get(i).getString("hourse_area"));	//7
			vpd.put("var8", varOList.get(i).getString("customer_habits"));	//8
			vpd.put("var9", varOList.get(i).getString("create_time"));	//9
			vpd.put("var10", varOList.get(i).get("uid").toString());	//10
			vpd.put("var11", varOList.get(i).get("employee_id").toString());	//11
			vpd.put("var12", varOList.get(i).getString("emp_no"));	//12
			vpd.put("var13", varOList.get(i).get("order_id").toString());	//13
			vpd.put("var14", varOList.get(i).get("is_marriage").toString());	//14
			vpd.put("var15", varOList.get(i).getString("mobile"));	//15
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

package com.fh.controller.menu.vipuserinfo;

import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.menu.vipuserinfo.VipUserInfoService;

/** 
 * 说明：vip管理
 * 创建时间：2016-10-29
 */
@Controller
@RequestMapping(value="/vipuserinfo")
public class VipUserInfoController extends BaseController {
	
	String menuUrl = "vipuserinfo/list.do"; //菜单地址(权限用)
	@Resource(name="vipuserinfoService")
	private VipUserInfoService vipuserinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增VipUserInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("create_by",Jurisdiction.getUsername());
		pd.put("create_time",new Date()) ;
		pd.put("registe_time",new Date()) ;
		vipuserinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除VipUserInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		vipuserinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改VipUserInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("modify_by",Jurisdiction.getUsername()) ;
		pd.put("modify_time",new Date()) ;
		vipuserinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表VipUserInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		String lastLoginStart = pd.getString("lastLoginStart");//开始时间
		String lastLoginEnd = pd.getString("lastLoginEnd");//结束时间
		String sex = pd.getString("sex") ;
		String group_type = pd.getString("group_type") ;
		String member_type = pd.getString("member_type") ;
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		if(null != sex && !"".equals(sex)){
			pd.put("sex", sex.trim());
		}
		if(null != group_type && !"".equals(group_type)){
			pd.put("group_type", group_type.trim());
		}
		if(null != member_type && !"".equals(member_type)){
			pd.put("member_type", member_type.trim());
		}

		if(null !=lastLoginStart && !"".equals(lastLoginStart)){
			pd.put("lastLoginStart",lastLoginStart);
		}
		if(null !=lastLoginEnd && !"".equals(lastLoginEnd)){
			pd.put("lastLoginEnd",lastLoginEnd);
		}
		page.setPd(pd);
		List<PageData>	varList = vipuserinfoService.list(page);	//列出VipUserInfo列表
		mv.setViewName("menu/vipuserinfo/vipuserinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
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
		mv.setViewName("menu/vipuserinfo/vipuserinfo_edit");
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
		pd = vipuserinfoService.findById(pd);	//根据ID读取
		mv.setViewName("menu/vipuserinfo/vipuserinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除VipUserInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			vipuserinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出VipUserInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("id");	//1
		titles.add("用户姓名");	//2
		titles.add("性别");	//3
		titles.add("族群（1:学生 2：工人 3：社会精英）");	//4
		titles.add("会员类型(1:普通 2：黄金 3：白银)");	//5
		titles.add("手机号");	//6
		titles.add("注册时间");	//7
		titles.add("常用联系地址");	//8
		titles.add("创建时间");	//9
		titles.add("创建人");	//10
		titles.add("更新人");	//11
		titles.add("更新时间");	//12
		titles.add("会员号");	//13
		titles.add("会员信息备注");	//14
		dataMap.put("titles", titles);
		List<PageData> varOList = vipuserinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("id").toString());	//1
			vpd.put("var2", varOList.get(i).getString("user_name"));	//2
			vpd.put("var3", varOList.get(i).getString("sex"));	//3
			vpd.put("var4", varOList.get(i).get("group_type").toString());	//4
			vpd.put("var5", varOList.get(i).get("member_type").toString());	//5
			vpd.put("var6", varOList.get(i).getString("phone"));	//6
			vpd.put("var7", varOList.get(i).getString("registe_time"));	//7
			vpd.put("var8", varOList.get(i).getString("comm_address"));	//8
			vpd.put("var9", varOList.get(i).getString("create_time"));	//9
			vpd.put("var10", varOList.get(i).getString("create_by"));	//10
			vpd.put("var11", varOList.get(i).getString("modify_by"));	//11
			vpd.put("var12", varOList.get(i).getString("modify_time"));	//12
			vpd.put("var13", varOList.get(i).getString("idcard"));	//13
			vpd.put("var14", varOList.get(i).getString("user_desc"));	//14
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

package com.fh.controller.menu.foodinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.fh.service.menu.cuisine.CuisineService;
import com.fh.service.menu.menutype.MenuTypeService;
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
import com.fh.service.menu.foodinfo.FoodInfoService;

/** 
 * 说明：菜谱
 * 创建时间：2016-10-29
 */
@Controller
@RequestMapping(value="/foodinfo")
public class FoodInfoController extends BaseController {
	
	String menuUrl = "foodinfo/list.do"; //菜单地址(权限用)
	@Resource(name="foodinfoService")
	private FoodInfoService foodinfoService;
	@Resource(name="menutypeService")
	private MenuTypeService menuTypeService;//菜类别管理
	@Resource(name="cuisineService")
	private CuisineService cuisineService ;//菜系管理
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增FoodInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("create_by",Jurisdiction.getUsername());
		pd.put("create_time",new Date()) ;
		foodinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除FoodInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		foodinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改FoodInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("modify_by",Jurisdiction.getUsername()) ;
		pd.put("modify_time",new Date()) ;
		foodinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表FoodInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		String cuisine_id = pd.getString("cuisine_id") ;
		String type_id = pd.getString("type_id") ;
		String lifecycle = pd.getString("lifecycle") ;
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		if(null != lifecycle && !"".equals(lifecycle)){
			pd.put("lifecycle",lifecycle) ;
		}
		if(null != cuisine_id && !"".equals(cuisine_id)){
			pd.put("cuisine_id",cuisine_id) ;
		}
		if(null != type_id && !"".equals(type_id)){
			pd.put("type_id",type_id) ;
		}
		page.setPd(pd);
		List<PageData>	varList = foodinfoService.list(page);	//列出FoodInfo列表
		List cusiList = cuisineService.listAll(pd); //菜系集合
		List menuTypeList = menuTypeService.listAll(pd) ;//菜类集合
		mv.setViewName("menu/foodinfo/foodinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("cusiList",cusiList) ;
		mv.addObject("menuTypeList",menuTypeList) ;
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
		List cusiList = cuisineService.listAll(pd); //菜系集合
		List menuTypeList = menuTypeService.listAll(pd) ;//菜类集合
		mv.addObject("cusiList",cusiList) ;
		mv.addObject("menuTypeList",menuTypeList) ;
		mv.setViewName("menu/foodinfo/foodinfo_edit");
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
		pd = foodinfoService.findById(pd);	//根据ID读取
		List cusiList = cuisineService.listAll(pd); //菜系集合
		List menuTypeList = menuTypeService.listAll(pd) ;//菜类集合
		mv.addObject("cusiList",cusiList) ;
		mv.addObject("menuTypeList",menuTypeList) ;
		mv.setViewName("menu/foodinfo/foodinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除FoodInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			foodinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出FoodInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("id");	//1
		titles.add("名称");	//2
		titles.add("是否启用(0:停用 1:启用 2:删除)");	//3
		titles.add("归属菜系");	//4
		titles.add("所属菜别");	//5
		titles.add("编号");	//6
		titles.add("单价");	//7
		titles.add("创建时间");	//8
		titles.add("创建人");	//9
		titles.add("更新人");	//10
		titles.add("更新时间");	//11
		titles.add("图片1");	//12
		titles.add("图片2");	//13
		dataMap.put("titles", titles);
		List<PageData> varOList = foodinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("id").toString());	//1
			vpd.put("var2", varOList.get(i).getString("menu_name"));	//2
			vpd.put("var3", varOList.get(i).get("lifecycle").toString());	//3
			vpd.put("var4", varOList.get(i).get("cuisine_id").toString());	//4
			vpd.put("var5", varOList.get(i).get("type_id").toString());	//5
			vpd.put("var6", varOList.get(i).getString("menu_id"));	//6
			vpd.put("var7", varOList.get(i).getString("price"));	//7
			vpd.put("var8", varOList.get(i).getString("create_time"));	//8
			vpd.put("var9", varOList.get(i).getString("create_by"));	//9
			vpd.put("var10", varOList.get(i).getString("modify_by"));	//10
			vpd.put("var11", varOList.get(i).getString("modify_time"));	//11
			vpd.put("var12", varOList.get(i).getString("image1"));	//12
			vpd.put("var13", varOList.get(i).getString("image2"));	//13
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

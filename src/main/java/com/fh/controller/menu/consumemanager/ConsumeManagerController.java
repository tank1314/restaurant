package com.fh.controller.menu.consumemanager;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.fh.service.menu.foodinfo.FoodInfoService;
import com.fh.service.menu.vipuserinfo.VipUserInfoService;

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
import com.fh.service.menu.consumemanager.ConsumeManagerService;

/**
 * 说明：消费管理 创建时间：2016-10-29
 */
@Controller
@RequestMapping(value = "/consumemanager")
public class ConsumeManagerController extends BaseController {

	String menuUrl = "consumemanager/list.do"; // 菜单地址(权限用)
	@Resource(name = "consumemanagerService")
	private ConsumeManagerService consumemanagerService;
	@Resource(name = "foodinfoService")
	// 获取菜单列表数据
	private FoodInfoService foodInfoService;
	@Resource(name = "vipuserinfoService")
	private VipUserInfoService vipUserInfoService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增ConsumeManager");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("create_by", Jurisdiction.getUsername());
		pd.put("create_time", new Date());
		consumemanagerService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除ConsumeManager");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		consumemanagerService.delete(pd);
		out.write("success");
		out.close();
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改ConsumeManager");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("modify_by", Jurisdiction.getUsername());
		pd.put("modify_time", new Date());
		consumemanagerService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表ConsumeManager");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		String lastLoginStart = pd.getString("lastLoginStart"); // 开始时间
		String lastLoginEnd = pd.getString("lastLoginEnd"); // 结束时间
		String group_type = pd.getString("group_type");
		String member_type = pd.getString("member_type");
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		if (null != group_type && !"".equals(group_type)) {
			pd.put("group_type", group_type.trim());
		}
		if (null != member_type && !"".equals(member_type)) {
			pd.put("member_type", member_type.trim());
		}
		if (null != lastLoginStart && !"".equals(lastLoginStart)) {
			pd.put("lastLoginStart", lastLoginStart);
		}
		if (null != lastLoginEnd && !"".equals(lastLoginEnd)) {
			pd.put("lastLoginEnd", lastLoginEnd);
		}
		page.setPd(pd);
		List<PageData> varList = consumemanagerService.list(page); // 列出ConsumeManager列表
		mv.setViewName("menu/consumemanager/consumemanager_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> foodList = this.foodInfoService.listAll(pd);
		mv.addObject("foodList", foodList);// 菜单下拉
		mv.setViewName("menu/consumemanager/consumemanager_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = consumemanagerService.findById(pd); // 根据ID读取
		mv.setViewName("menu/consumemanager/consumemanager_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 批量删除
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "批量删除ConsumeManager");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			consumemanagerService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 根据用户信息参数查询用户详情
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/findUserByParams")
	@ResponseBody
	public Object findUserByParams() {
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		PageData resultData = null;
		try {
			resultData = this.vipUserInfoService.findUserByParam(pd);
			if (resultData != null && resultData.size() > 0) {
				map.put("error_no", 0);
			} else {
				map.put("error_no", 1);// 暂无数据
			}
		} catch (Exception e) {
			logger.error("数据检索异常：" + e);
			map.put("error_no", -1);
		}
		map.put("result", resultData);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 菜单下拉
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/findFoodList")
	@ResponseBody
	public Object findFoodList() throws Exception {
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> foodList = this.foodInfoService.listAll(pd);
		if (foodList != null && foodList.size() > 0) {
			map.put("error_no", 0); // 查询成功
		} else {
			map.put("error_no", 1);// 无数据结果集
		}
		map.put("result", foodList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 消费者消费记录数据录入
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "saveCustmer")
	@ResponseBody
	public Object saveCustmer() {
		logBefore(logger, Jurisdiction.getUsername() + "新增ConsumeManager");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String discount_money = pd.getString("discount_money").toString();
		if (discount_money.isEmpty()) {
			pd.put("discount_money", 0);
		}
		pd.put("create_by", Jurisdiction.getUsername());
		pd.put("create_time", new Date());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			consumemanagerService.save(pd);
			//主要获取消费数据ID
			PageData consumer = consumemanagerService.findByParam(pd) ;
			List<PageData> listFood = this.consumemanagerService.listConsumerFood(consumer) ;
			List<PageData> menuList = this.foodInfoService.listAll(pd) ;
			//String id = pd.get("id").toString();
			map.put("error_no", 0); // 数据录入成功
			map.put("consumeId", consumer.get("id").toString());//消费id 
			map.put("foodList", listFood) ;//消费食物汇总列表
			map.put("menuList", menuList) ;
		} catch (Exception e) {
			logger.equals("====消费者消费数据录入失败====" + e);
			map.put("error_no", 1);// 系统异常
		}
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 导出到excel
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "导出ConsumeManager到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("消费id"); // 1
		titles.add("会员id"); // 2
		titles.add("顾客姓名"); // 3
		titles.add("会员手机"); // 4
		titles.add("消费时间"); // 5
		titles.add("用餐人数"); // 6
		titles.add("消费金额"); // 7
		titles.add("折扣价"); // 8
		titles.add("客户需求描述"); // 9
		dataMap.put("titles", titles);
		List<PageData> varOList = consumemanagerService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("consum_id").toString()); // 1
			vpd.put("var2", varOList.get(i).get("user_id").toString()); // 2
			vpd.put("var3", varOList.get(i).getString("user_name")); // 3
			vpd.put("var4", varOList.get(i).getString("user_phone")); // 4
			vpd.put("var5", varOList.get(i).getString("consum_time")); // 5
			vpd.put("var6", varOList.get(i).get("people_num").toString()); // 6
			vpd.put("var7", varOList.get(i).getString("pay_money")); // 7
			vpd.put("var8", varOList.get(i).getString("discount_money")); // 8
			vpd.put("var9", varOList.get(i).getString("consum_desc")); // 9
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv, dataMap);
		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}
}

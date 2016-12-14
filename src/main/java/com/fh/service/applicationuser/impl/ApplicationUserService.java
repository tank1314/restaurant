package com.fh.service.applicationuser.impl;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;

import com.fh.entity.ApplicationUser;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.applicationuser.ApplicationUserManager;

/** 
 * 说明： 用户列表
 * 创建人：FH Q313596790
 * 创建时间：2016-04-13
 * @version
 */
@Service("applicationuserService")
public class ApplicationUserService implements ApplicationUserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{

		ApplicationUser userIsExit=(ApplicationUser)dao.findForObject("ApplicationUserMapper.findByMobile",pd);

		if (null==userIsExit) {

			Calendar c = Calendar.getInstance();

			ApplicationUser user = new ApplicationUser();
			user.setUuid(UUID.randomUUID().toString().replace("-", ""));
			user.setMobile(pd.get("mobile") + "");
			user.setPassword("");
			user.setRealName("");
			user.setSource("");
			user.setUserName("");
			user.setLastLoginTime(c.getTimeInMillis() / 1000);
			user.setCreateTime(c.getTimeInMillis() / 1000);
			user.setEmail("");
			user.setStatus(false);
			user.setBalance(0);
			user.setScore(0);
			user.setNotes("");
			user.setSex((byte) 1);
			user.setLastLoginTime(0);
			user.setAllowCod(true);
			user.setSessionId("");
			user.setAreaId(0);
			user.setOpenId("");
			user.setUnionSource("");
			user.setAllowEmployee("");
			user.setRefuseEmployee("");
			user.setAllowSex(0);

			if ("9000".equals(pd.get("level_score"))) {
				user.setLevel_name("超级VIP");
			} else if ("0".equals(pd.get("level_score"))) {
				user.setLevel_name("普通用户");
			}
			user.setLevel_score(Integer.parseInt(pd.get("level_score").toString()));
			dao.save("ApplicationUserMapper.save", user);

			//userDao.save(user);


			/**
			 * 赠送优惠券
			 **/
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DAY_OF_MONTH, 30);
			ApplicationUser user1 = (ApplicationUser) dao.findForObject("ApplicationUserMapper.findByUUID", user.getUuid());
			HashMap<String, String> couponMap = new HashMap<String, String>();
			couponMap.put("uid", "" + user1.getId());
			couponMap.put("price", "10");
			couponMap.put("end_time", "" + c1.getTimeInMillis() / 1000);
			couponMap.put("productType", "-1");
			couponMap.put("productId", "-1");
			couponMap.put("coupon_id", "register");
			couponMap.put("city_id", "1");
			couponMap.put("service_type", "1");
			couponMap.put("coupon_type", "4");
			couponMap.put("title", "家政服务 - 通用券");
			for (int i = 0; i < 3; i++) {
				dao.save("ApplicationUserMapper.saveCoupon", couponMap);
			}
		}
		//dao.save("ApplicationUserMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ApplicationUserMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ApplicationUserMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ApplicationUserMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ApplicationUserMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ApplicationUserMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ApplicationUserMapper.deleteAll", ArrayDATA_IDS);
	}
	
}


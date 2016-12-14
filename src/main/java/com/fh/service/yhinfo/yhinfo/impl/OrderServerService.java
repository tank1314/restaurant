package com.fh.service.yhinfo.yhinfo.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.yhinfo.yhinfo.OrderServerManager;

/** 
 * 说明： 订单服务记录
 * 创建人：FH Q313596790
 * 创建时间：2016-04-26
 * @version
 */
@Service("orderserverService")
public class OrderServerService implements OrderServerManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("OrderServerMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("OrderServerMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("OrderServerMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrderServerMapper.datalistPage", page);
	}

    @Override
    public List<PageData> listExcel(PageData pd) throws Exception {
        return (List<PageData>)dao.findForList("OrderServerMapper.datalistExcel", pd);
    }

    /**下拉查询站点集合
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAllSite(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrderServerMapper.listSite", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrderServerMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrderServerMapper.deleteAll", ArrayDATA_IDS);
	}
	
}


package com.fh.service.yhinfo.yhinfo;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 订单服务记录接口
 * 创建人：FH Q313596790
 * 创建时间：2016-04-26
 * @version
 */
public interface OrderServerManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;

    /**
     * 导出excel
     * @param pd
     * @return
     * @throws Exception
     */
    public List<PageData> listExcel(PageData pd)throws Exception;
	
	/**下拉查询站点集合
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllSite(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}


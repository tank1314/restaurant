package com.fh.service.menu.consumfoodlog.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.menu.consumfoodlog.ConsumFoodLogService;

/**
 * 说明： 消费食物日志记录
 * 创建时间：2016-10-29
 * @version
 */
@Service("consumfoodlogService")
public class ConsumFoodLogServiceImpl implements ConsumFoodLogService{

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**新增
     * @param pd
     * @throws Exception
     */
    @Override
    public void save(PageData pd)throws Exception{
        dao.save("ConsumFoodLogMapper.save", pd);
    }

    /**删除
     * @param pd
     * @throws Exception
     */
    @Override
    public void delete(PageData pd)throws Exception{
        dao.delete("ConsumFoodLogMapper.delete", pd);
    }

    /**修改
     * @param pd
     * @throws Exception
     */
    @Override
    public void edit(PageData pd)throws Exception{
        dao.update("ConsumFoodLogMapper.edit", pd);
    }

    /**列表
     * @param page
     * @throws Exception
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<PageData> list(Page page)throws Exception{
        return (List<PageData>)dao.findForList("ConsumFoodLogMapper.datalistPage", page);
    }

    /**列表(全部)
     * @param pd
     * @throws Exception
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<PageData> listAll(PageData pd)throws Exception{
        return (List<PageData>)dao.findForList("ConsumFoodLogMapper.listAll", pd);
    }

    /**通过id获取数据
     * @param pd
     * @throws Exception
     */
    @Override
    public PageData findById(PageData pd)throws Exception{
        return (PageData)dao.findForObject("ConsumFoodLogMapper.findById", pd);
    }

    /**批量删除
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    @Override
    public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
        dao.delete("ConsumFoodLogMapper.deleteAll", ArrayDATA_IDS);
    }

}


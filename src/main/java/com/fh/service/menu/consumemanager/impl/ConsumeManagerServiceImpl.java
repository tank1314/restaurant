package com.fh.service.menu.consumemanager.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.menu.consumemanager.ConsumeManagerService;

/**
 * 说明： 消费管理
 * 创建时间：2016-10-29
 * @version
 */
@Service("consumemanagerService")
public class ConsumeManagerServiceImpl implements ConsumeManagerService{

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**新增
     * @param pd
     * @throws Exception
     */
    @Override
    public void save(PageData pd)throws Exception{
        dao.save("ConsumeManagerMapper.save", pd);
    }

    /**删除
     * @param pd
     * @throws Exception
     */
    @Override
    public void delete(PageData pd)throws Exception{
        dao.delete("ConsumeManagerMapper.delete", pd);
    }

    /**修改
     * @param pd
     * @throws Exception
     */
    @Override
    public void edit(PageData pd)throws Exception{
        dao.update("ConsumeManagerMapper.edit", pd);
    }

    /**列表
     * @param page
     * @throws Exception
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<PageData> list(Page page)throws Exception{
        return (List<PageData>)dao.findForList("ConsumeManagerMapper.datalistPage", page);
    }

    /**列表(全部)
     * @param pd
     * @throws Exception
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<PageData> listAll(PageData pd)throws Exception{
        return (List<PageData>)dao.findForList("ConsumeManagerMapper.listAll", pd);
    }

    /**通过id获取数据
     * @param pd
     * @throws Exception
     */
    @Override
    public PageData findById(PageData pd)throws Exception{
        return (PageData)dao.findForObject("ConsumeManagerMapper.findById", pd);
    }

    /**批量删除
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    @Override
    public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
        dao.delete("ConsumeManagerMapper.deleteAll", ArrayDATA_IDS);
    }

	@Override
	public PageData findByParam(PageData pd) throws Exception {
		return (PageData) this.dao.findForObject("ConsumeManagerMapper.findByParam", pd) ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listConsumerFood(PageData pd) throws Exception {
		return (List<PageData>) this.dao.findForList("ConsumeManagerMapper.listConsumerFood", pd) ;
	}

}


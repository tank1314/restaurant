package com.fh.service.menu.vipuserinfo.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.menu.vipuserinfo.VipUserInfoService;

/**
 * 说明： vip管理
 * 创建时间：2016-10-29
 * @version
 */
@Service("vipuserinfoService")
public class VipUserInfoServiceImpl implements VipUserInfoService{

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**新增
     * @param pd
     * @throws Exception
     */
    @Override
    public void save(PageData pd)throws Exception{
        dao.save("VipUserInfoMapper.save", pd);
    }

    /**删除
     * @param pd
     * @throws Exception
     */
    @Override
    public void delete(PageData pd)throws Exception{
        dao.delete("VipUserInfoMapper.delete", pd);
    }

    /**修改
     * @param pd
     * @throws Exception
     */
    @Override
    public void edit(PageData pd)throws Exception{
        dao.update("VipUserInfoMapper.edit", pd);
    }

    /**列表
     * @param page
     * @throws Exception
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<PageData> list(Page page)throws Exception{
        return (List<PageData>)dao.findForList("VipUserInfoMapper.datalistPage", page);
    }

    /**列表(全部)
     * @param pd
     * @throws Exception
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<PageData> listAll(PageData pd)throws Exception{
        return (List<PageData>)dao.findForList("VipUserInfoMapper.listAll", pd);
    }

    /**通过id获取数据
     * @param pd
     * @throws Exception
     */
    @Override
    public PageData findById(PageData pd)throws Exception{
        return (PageData)dao.findForObject("VipUserInfoMapper.findById", pd);
    }

    /**批量删除
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    @Override
    public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
        dao.delete("VipUserInfoMapper.deleteAll", ArrayDATA_IDS);
    }

    /**
     * add by tankun 20161107
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData findUserByParam(PageData pd) throws Exception {
        return (PageData) dao.findForObject("VipUserInfoMapper.findUserByParam",pd);
    }

}


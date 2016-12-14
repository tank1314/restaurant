package com.fh.service.menu.consumemanager;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 说明： 消费管理接口
 * 创建时间：2016-10-29
 * @version
 */
public interface ConsumeManagerService{

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

    /**列表(全部)
     * @param pd
     * @throws Exception
     */
    public List<PageData> listAll(PageData pd)throws Exception;

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
    
    /**
     * 根据参数查询数据详情内容
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData findByParam(PageData pd)throws Exception ;
    
    
    public List<PageData> listConsumerFood(PageData pd)throws Exception ;

}


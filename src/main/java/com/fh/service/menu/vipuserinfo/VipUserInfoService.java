package com.fh.service.menu.vipuserinfo;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 说明： vip管理接口
 * 创建时间：2016-10-29
 * @version
 */
public interface VipUserInfoService{

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
     * 根据用户手机号姓名详查
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData findUserByParam(PageData pd) throws Exception;
}


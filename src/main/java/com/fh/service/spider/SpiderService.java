package com.fh.service.spider;

import com.fh.entity.NmwCityCommunity;
import com.fh.util.PageData;

import java.util.List;
import java.util.Map;

/**
 * 描述: 安居客数据采集
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/7/5
 * 创建时间: 11:23
 */
public interface SpiderService {

    /**
     * 区域数据采集
     * @param pd
     * @throws Exception
     */
    /*public void saveTownShip(PageData pd)throws Exception;

    *//**
     * 新增特色信息
     * @param pd
     * @throws Exception
     *//*
    public void saveCharacter(PageData pd) throws  Exception ;

    *//**
     * 小区信息录入
     * @param
     * @throws Exception
     *//*
    public void saveCityCommunity(PageData pd)throws Exception;*/

    public void saveCityCommunityInfo(NmwCityCommunity city)throws Exception;

    public void saveTownShipInfo(NmwCityCommunity city)throws Exception;

    /**
     * 批量查询数据
     * @return
     * @throws Exception
     */
    public List<NmwCityCommunity> querynmwCityCommunity()throws Exception;

    /**
     * 编辑小区
     * @param city
     * @throws Exception
     */
    public void editnmwCityCommunity(NmwCityCommunity city)throws Exception;

    /**
     * 分页查询
     * @param map
     * @return
     * @throws Exception
     */
    public List<NmwCityCommunity> queryCommuntiyPage(Map map)throws Exception;

}

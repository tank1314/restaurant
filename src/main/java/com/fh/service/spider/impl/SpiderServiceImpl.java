package com.fh.service.spider.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.NmwCityCommunity;
import com.fh.service.spider.SpiderService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 描述:
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/7/5
 * 创建时间: 11:25
 */
@Service("spiderService")
public class SpiderServiceImpl implements SpiderService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**
     * 新增区域信息
     * @param pd
     * @throws Exception
     */
    public void saveTownShip(PageData pd) throws Exception {
        this.dao.save("SpiderMapper.saveTownShip",pd);
    }

    /**
     * 新增区域特色分类
     * @param pd
     * @throws Exception
     */
    public void saveCharacter(PageData pd) throws Exception {
        this.dao.save("SpiderMapper.saveCharacter",pd);
    }

    public void saveCityCommunity(PageData pd) throws Exception {
        this.dao.save("SpiderMapper.saveCityCommunity",pd);
    }

    public void saveCityCommunityInfo(NmwCityCommunity city) throws Exception {

    }

    public void saveTownShipInfo(NmwCityCommunity city) throws Exception {

    }

    @Override
    public List<NmwCityCommunity> querynmwCityCommunity() throws Exception {
        return null;
    }

    @Override
    public void editnmwCityCommunity(NmwCityCommunity city) throws Exception {

    }

    public List queryCommuntiyPage(Map map) throws Exception {
        return null;
    }
}

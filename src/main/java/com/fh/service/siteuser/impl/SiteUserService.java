package com.fh.service.siteuser.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.siteuser.SiteUserManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by admin on 2016/4/19.
 */
@Service("siteUserService")
public class SiteUserService implements SiteUserManager{

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    public List<PageData> querySiteUser(Page page) throws Exception {
        return (List<PageData>)dao.findForList("SiteUserMapper.querySiteUser",page);
    }

    public int queryTotalSiteUser(Page page)throws Exception {
        return (Integer) dao.findForObject("SiteUserMapper.queryTotalSiteUser",page);
    }
}

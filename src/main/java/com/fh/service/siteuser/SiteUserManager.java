package com.fh.service.siteuser;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/**
 * Created by admin on 2016/4/19.
 */
public interface SiteUserManager {
    List<PageData> querySiteUser(Page page) throws Exception;

    int queryTotalSiteUser(Page page)throws Exception ;
}

package com.fh.service.userinfo.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.userinfo.UserInfoServiceManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by admin on 2016/4/19.
 */
@Service("userInfoService")
public class UserInfoService implements UserInfoServiceManager{


    @Resource(name = "daoSupport")
    private DaoSupport dao;



    public List<PageData> queryAddUser(Page page)throws Exception {
        return (List<PageData>)dao.findForList("UserInfoMapper.queryAddUser",page);

    }
}

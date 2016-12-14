package com.fh.service.interceptor.impl;

import com.fh.dao.DaoSupport;
import com.fh.service.interceptor.InterceptorManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by admin on 2016/5/10.
 */
@Service("interceptorService")
public class InterceptorService implements InterceptorManager {

    @Resource(name = "daoSupport")
    private DaoSupport dao;


    public void save(PageData pd)throws Exception{
        dao.save("InterceptorMapper.save", pd);
    }

    public void saveInterceptor(PageData pd) throws Exception{
        dao.save("InterceptorMapper.save", pd);

    }

    public PageData queryUserIdByUsername(PageData pd)throws Exception {
        return (PageData)dao.findForObject("InterceptorMapper.queryUserIdByUsername", pd);

    }

    public PageData queryMenuNameByRequestURI(PageData pd)throws Exception {
        return (PageData)dao.findForObject("InterceptorMapper.queryMenuNameByRequestURI", pd);
    }
}

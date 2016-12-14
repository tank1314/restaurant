package com.fh.service.datacenter.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.datacenter.DataCenterServiceManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by admin on 2016/4/19.
 */
@Service("dataCenterService")
public class DataCenterService implements DataCenterServiceManager{

    @Resource(name = "daoSupport")
    private DaoSupport dao;


    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>)dao.findForList("DataCenterMapper.querySiteDataList",page);
    }

    public List<PageData> queryServiceData(Page page)  throws Exception {
        return (List<PageData>)dao.findForList("DataCenterMapper.queryServiceData",page);
    }

    public List<PageData> queryTerminalServiceData(Page page)throws Exception {
        return (List<PageData>)dao.findForList("DataCenterMapper.queryTerminalServiceData",page);

    }

    public List<PageData> queryTimeServiceData(Page page) throws Exception {
        return (List<PageData>)dao.findForList("DataCenterMapper.queryTimeServiceData",page);
    }

    public List<PageData> queryRateServiceData(Page page) throws Exception  {
        return (List<PageData>)dao.findForList("DataCenterMapper.queryRateServiceData",page);

    }

    public List<PageData> queryOrderChangeList(Page page)throws Exception{
        return (List<PageData>)dao.findForList("DataCenterMapper.queryOrderChangeList",page);
    }


}

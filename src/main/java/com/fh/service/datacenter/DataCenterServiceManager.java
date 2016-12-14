package com.fh.service.datacenter;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/**
 * Created by admin on 2016/4/19.
 */
public interface DataCenterServiceManager {


    List<PageData> list(Page page) throws Exception;

    List<PageData> queryServiceData(Page page) throws Exception ;

    List<PageData> queryTerminalServiceData(Page page)throws Exception;

    List<PageData> queryTimeServiceData(Page page) throws Exception;

    List<PageData> queryRateServiceData(Page page) throws Exception ;

    List<PageData> queryOrderChangeList(Page page)throws Exception;
}

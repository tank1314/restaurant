package com.fh.service.interceptor;

import com.fh.util.PageData;

/**
 * Created by admin on 2016/5/10.
 */
public interface InterceptorManager {
    void saveInterceptor(PageData pd)throws Exception;

    PageData queryUserIdByUsername(PageData pd)throws Exception;

    PageData queryMenuNameByRequestURI(PageData pd)throws Exception;
}

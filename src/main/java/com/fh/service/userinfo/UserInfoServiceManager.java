package com.fh.service.userinfo;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/**
 * Created by admin on 2016/4/19.
 */
public interface UserInfoServiceManager {
    List<PageData> queryAddUser(Page page) throws Exception;
}

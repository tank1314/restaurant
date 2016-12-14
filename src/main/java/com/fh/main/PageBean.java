package com.fh.main;

/**
 * Created by tankun on 2016/7/16.
 */

/**
 * 模拟分页控件
 */
public class PageBean {
    private int currentPage;
    private int pageSize ;

    public PageBean(){

    }
    public PageBean(int currentPage, int pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}

package com.fh.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 描述: 数据分析封装实体类
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/6/23
 * 创建时间: 9:57
 */
public class DataCenterBean {

    private String cityid ;//城市id
    private String cityName ;//城市名称
    private String rule;//标尺/刻度
    private int dataCountInt ;//数据量
    private double dataCountdouble;//数据金额
    private String dayInfo ;//日期

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule;
    }

    public String getCityid() {
        return cityid;
    }

    public void setCityid(String cityid) {
        this.cityid = cityid;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public int getDataCountInt() {
        return dataCountInt;
    }

    public void setDataCountInt(int dataCountInt) {
        this.dataCountInt = dataCountInt;
    }

    public double getDataCountdouble() {
        return dataCountdouble;
    }

    public void setDataCountdouble(double dataCountdouble) {
        this.dataCountdouble = dataCountdouble;
    }

    public String getDayInfo() {
        return dayInfo;
    }

    public void setDayInfo(String dayInfo) {
        this.dayInfo = dayInfo;
    }


    /**
     * 结果集比较  返回list数组
     *
     * @param rList    初始化数据结果集
     * @param dataList 要处理的数据结果集
     * @return 最终结果集
     */
    public static List returnResultList(List rList, List dataList) {
        List<DataCenterBean> resultInner = null;
        Map<String, List> resultList = new HashMap<String, List>();
        //初始化时所有城市下数据列表
        for (int j = 0; j < rList.size(); j++) {
            //初始化的集合对象数据
            List<DataCenterBean> beanList = (List) rList.get(j);
            //对应城市下的 时间段数据
            resultInner = new ArrayList<DataCenterBean>();
            String cityId1 = "";//初始化的城市id
            //初始化的数据结果集
            for (int a = 0; a < beanList.size(); a++) {
                DataCenterBean uc = new DataCenterBean();
                cityId1 = beanList.get(a).getCityid();
                String t1 = beanList.get(a).getRule();
                int datacount1 = beanList.get(a).getDataCountInt();
                double datacountdoubel1 = beanList.get(a).getDataCountdouble();
                int datacount = 0;//数据库中的数据量
                double datacountdouble = 0 ;//数据库中的数据量(金额)
                String t = ""; //数据库中的刻度标记
                //查询出来的结果集对象
                if (dataList != null && dataList.size() > 0) {
                    for (int i = 0; i < dataList.size(); i++) {
                        DataCenterBean us = (DataCenterBean) dataList.get(i);
                        t = us.getRule(); //数据库中的时间段
                        String cityId = us.getCityid();// 数据库中的城市id
                        datacount = us.getDataCountInt();//数据库中的数据量
                        datacountdouble = us.getDataCountdouble();
                        if ((cityId + t).equals(cityId1 + t1)) {
                            datacount1 = datacount;
                            datacountdoubel1 = datacountdouble;
                            break;
                        }
                    }
                }
                uc.setCityid(cityId1);
                uc.setRule(t1);
                uc.setDataCountInt(datacount1);
                uc.setDataCountdouble(datacountdoubel1);
                resultInner.add(uc);
            }
            resultList.put(cityId1, resultInner);
        }
        List result_resultList = new ArrayList<List>(resultList.values());
        return result_resultList;
    }
}


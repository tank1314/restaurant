package com.fh.main;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import com.fh.entity.NmwCityCommunity;
import com.fh.service.spider.SpiderService;
import com.fh.spider.DetailDataCrawler;
import com.fh.util.PageData;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 描述:
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/7/6
 * 创建时间: 16:21
 */
public class JDBCMapperTest {
    private static SqlSessionFactory sqlSessionFactory;
    private static Reader reader;

    static {
        try {
            reader = Resources.getResourceAsReader("config/Configuration.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SqlSessionFactory getSession() {
        return sqlSessionFactory;
    }

    /**
     * 程序入口
     *
     * @param args
     */
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        SqlSession session = sqlSessionFactory.openSession();
        try {
           /* SpiderService iuser = session.getMapper(SpiderService.class);
           // testInsert();
            System.out.println("==========插入成功==============");*/
            getUserList(10);
            /*List<PageData> list = new ArrayList<>();
            PageData pd = new PageData();
            pd.put("develop_bus", "开发商");
            pd.put("property_comany", "物业公司");
            pd.put("property_type", "物业类型");
            pd.put("property_free", "业务费");
            pd.put("total_built_area", "100平米");
            pd.put("total_house", "300户");
            pd.put("volume", "35%");
            pd.put("rental_rate", "9%");
            pd.put("parking_space", "9");
            pd.put("green_rate", "35%");
            pd.put("comm_desc", "小区描述");
            pd.put("ajk_id", 117);
            list.add(pd);
            saveCommunityInfo(list);*/
        } finally {
            session.close();
        }
    }

    public static void testInsert(List<PageData> resultList) {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            SpiderService userMapper = session.getMapper(SpiderService.class);
            System.out.println("Test insert start...");
            // 执行插入
            NmwCityCommunity user = null;
            if (resultList != null && resultList.size() > 0) {
                for (int i = 0; i < resultList.size(); i++) {
                    user = new NmwCityCommunity();
                    PageData pd = resultList.get(i);
                    user.setAjk_id(pd.getInt("ajk_id"));
                    user.setBuilt_date(pd.getString("built_date"));
                    user.setComm_address(pd.getString("comm_address"));
                    user.setComm_name(pd.getString("comm_name"));
                    user.setLat(pd.getString("lat"));
                    user.setLongi(pd.getString("longi"));
                    user.setTown_id(pd.getInt("town_id"));//所属区域
                    user.setTown_name(pd.getString("town_name"));//区域名称
                    userMapper.saveCityCommunityInfo(user);
                }
            }
            // 提交事务
            session.commit();
            // 显示插入之后User信息
            System.out.println("共成功插入数据====" + resultList.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 小区信息录入
     *
     * @param list
     */
    public static void saveTownShipInfo(String[] list) {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            SpiderService userMapper = session.getMapper(SpiderService.class);
            System.out.println("Test insert start...");
            // 执行插入
            NmwCityCommunity user = null;
            PageData pd = null;
            for (int i = 0; i < list.length; i++) {
                if (StringUtils.isEmpty(list[i])) {
                    continue;
                }
                user = new NmwCityCommunity();
                user.setComm_name(list[i]);
               /* pd.put("district_id",11);
                pd.put("district_name","浦东新区");*/
                userMapper.saveTownShipInfo(user);
            }
            // 提交事务
            session.commit();
            // 显示插入之后User信息
            System.out.println("共成功插入数据====" + list.length);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 小区信息查询
     */
    public static List getUserList(int currentPage) {
        List<PageData> dataList = null;
        SqlSession session = sqlSessionFactory.openSession();
        try {
            SpiderService userMapper = session.getMapper(SpiderService.class);
            // 显示User信息
            System.out.println("查询开始...");
            Map paraMap = new HashedMap();
            paraMap.put("pstart",currentPage);
            paraMap.put("psize",20);//每页显示记录数
            List<NmwCityCommunity> list = userMapper.queryCommuntiyPage(paraMap);
            //List<NmwCityCommunity> list = userMapper.querynmwCityCommunity();
            PageData pd = null;
            dataList = new ArrayList<PageData>();
            for (int i = 0; i < list.size(); i++) {
                int ajkId = list.get(i).getAjk_id();
                pd = new PageData();
                pd.put("ajk_id", ajkId);
                dataList.add(pd);
            }
            System.out.println("查询结束....");
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        return dataList;
    }


    /**
     * 更新
     *
     * @param list
     */
    public static void saveCommunityInfo(List<PageData> list) {
        // 获取Session连接
        SqlSession session = sqlSessionFactory.openSession();
        try {
            // 获取Mapper
            SpiderService userMapper = session.getMapper(SpiderService.class);
            System.out.println("更新数据开始....");
            // 执行插入
            NmwCityCommunity user = null;
            System.out.println("==========共爬取数据==========="+list.size());
            for (int i = 0; i < list.size(); i++) {
                PageData p = list.get(i);
                user = new NmwCityCommunity();
                user.setDevelop_bus(p.getString("develop_bus"));
                user.setProperty_comany(p.getString("property_comany"));
                user.setProperty_type(p.getString("property_type"));
                user.setProperty_free(p.getString("property_free"));
                user.setTotal_built_area(p.getString("total_built_area"));
                user.setTotal_house(p.getString("total_house"));
                user.setVolume(p.getString("volume"));
                user.setRental_rate(p.getString("rental_rate"));
                user.setParking_space(p.getString("parking_space"));
                user.setGreen_rate(p.getString("green_rate"));
                user.setComm_desc(p.getString("comm_desc"));
                user.setAjk_id(p.getInt("ajk_id"));//牛家帮主键id
                userMapper.editnmwCityCommunity(user);
            }
            // 提交事务
            session.commit();
            System.out.println("=========数据更新成功======" + list.size());
            // 显示插入之后User信息
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }
}

package com.fh.spider;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import com.fh.main.JDBCMapperTest;
import com.fh.util.PageData;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

/**
 * 描述: 列表数据抓取
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/7/6
 * 创建时间: 11:58
 */
public class ListDataCrawler extends BreadthCrawler {

    //元数据封装
    public static List<PageData> dataList = null ;

    public static List<PageData> resultDataList = new ArrayList<>();
    String keyWord = "［淳安-淳安］";
    int townId= 375 ;
    //String a = "chunana";

    public static void main(String[] args) throws Exception {
        ListDataCrawler crawler = new ListDataCrawler("E:\\spider\\crawl", true);
        /*线程数*/
        crawler.setThreads(1);
         /*设置每次迭代中爬取数量的上限*/
        crawler.setTopN(100);
        /*设置是否为断点爬取，如果设置为false，任务启动前会清空历史数据。
           如果设置为true，会在已有crawlPath(构造函数的第一个参数)的基础上继
           续爬取。对于耗时较长的任务，很可能需要中途中断爬虫，也有可能遇到
           死机、断电等异常情况，使用断点爬取模式，可以保证爬虫不受这些因素
           的影响，爬虫可以在人为中断、死机、断电等情况出现后，继续以前的任务
           进行爬取。断点爬取默认为false*/
        //crawler.setResumable(true);
        /*开始深度为4的爬取，这里深度和网站的拓扑结构没有任何关系
            可以将深度理解为迭代次数，往往迭代次数越多，爬取的数据越多*/
        crawler.start(2);
        JDBCMapperTest jdbcData = new JDBCMapperTest();
        jdbcData.testInsert(resultDataList);
        System.out.println("===========数据采集完毕！总有数据"+resultDataList.size()+"====================");
       /* for (int i = 0 ;i<resultDataList.size() ;i++){
            PageData p = resultDataList.get(i);
            System.out.println("小区名称:"+p.getString("comm_name")+"经度:"+p.getString("longi")+"纬度:"+p.getString("lat"));
        }*/
    }

    public ListDataCrawler(String crawlPath, boolean autoParse) {
        super(crawlPath, autoParse);
        /*start page*/
        //添加种子URL
        // 当数据量较大时，需要涉及分页处理
        //this.addSeed("http://shanghai.anjuke.com/community/hengshadao/p16/");
        //this.addSeed("http://hangzhou.anjuke.com/community/chunana/p11/");
        this.addSeed("http://hangzhou.anjuke.com/community/chunana/");
        // //限定爬取范围
        /*fetch url like http://news.hfut.edu.cn/show-xxxxxxhtml*/
        //=========1、处理浦东 数据
        this.addRegex("http://hangzhou.anjuke.com/community/chunana/.*");
        /*do not fetch jpg|png|gif*/
        this.addRegex("-.*\\.(jpg|png|gif).*");
        /*do not fetch url contains #*/
        this.addRegex("-.*#.*");
    }
    /*
       可以往next中添加希望后续爬取的任务，任务可以是URL或者CrawlDatum
       爬虫不会重复爬取任务，从2.20版之后，爬虫根据CrawlDatum的key去重，而不是URL
       因此如果希望重复爬取某个URL，只要将CrawlDatum的key设置为一个历史中不存在的值即可
       例如增量爬取，可以使用 爬取时间+URL作为key。

       新版本中，可以直接通过 page.select(css选择器)方法来抽取网页中的信息，等价于
       page.getDoc().select(css选择器)方法，page.getDoc()获取到的是Jsoup中的
       Document对象，细节请参考Jsoup教程
    */
    public void visit(Page page, CrawlDatums crawlDatums) {
        String url = page.getUrl();
        if (page.matchUrl("http://hangzhou.anjuke.com/community/chunana/p.*") || page.matchUrl("http://hangzhou.anjuke.com/community/chunana/")) {
       //if (page.matchUrl("http://hangzhou.anjuke.com/community/chunana/p8/") || page.matchUrl("http://hangzhou.anjuke.com/community/chunana/p9/") || page.matchUrl("http://hangzhou.anjuke.com/community/chunana/p10/") || page.matchUrl("http://hangzhou.anjuke.com/community/chunana/p11/")) {
        //if (page.matchUrl("http://shanghai.anjuke.com/community/hengshadao/p.*") && !page.matchUrl("http://shanghai.anjuke.com/community/hengshadao/p1/") && !page.matchUrl("http://shanghai.anjuke.com/community/hengshadao/p7/")) {
            System.out.println("processing "+page.getUrl());
            dataList = new ArrayList<>();
            PageData pd = null ;//单个对象

            Elements eles = page.select("p[class=date]");
            String dateStrings = page.select("p[class=date]").text();//日期
            String address = page.select("address").text();//地址
           /* System.out.println(dateStrings);
            System.out.println(address);*/
            String[] dates = dateStrings.replace("竣工日期：","").split(" ");
            for (int i  = 0 ;i<dates.length ; i++){
                pd = new PageData();
                pd.put("built_date",dates[i].replace("年","-").replace("月",""));
                dataList.add(pd);
            }
            //获取小区详细地址address.split("［浦东-北蔡］");
            String[] ad = address.split(keyWord);
            for (int i = 1 ;i<ad.length ;i++){
                String built_date = "暂无数据";//建筑日期
                String comm_address = ad[i];
                for (int j = 0 ;j<dataList.size() ;j++){
                    if(j == i-1){
                        PageData pData = dataList.get(0);
                        built_date = pData.getString("built_date");
                        dataList.remove(0);
                        break;
                    }
                }
                pd = new PageData();
                pd.put("built_date",built_date);//建筑日期
                pd.put("comm_address",comm_address);//小区地址
                dataList.add(pd);
            }

            //获取小区详情地址+小区名称
            /*Elements addressResults = page.select(".li-info h3>a ");
            for (int rank = 0; rank < addressResults.size(); rank++) {
                Element result = addressResults.get(rank);
                *//*
                我们希望继续爬取每条搜索结果指向的网页，这里统称为外链。
                我们希望在访问外链时仍然能够知道外链处于搜索引擎的第几页、第几条，
                所以将页号和排序信息放入后续的CrawlDatum中，为了能够区分外链和
                搜索引擎结果页面，我们将其pageType设置为outlink，这里的值完全由
                用户定义，可以设置一个任意的值

                在经典爬虫中，每个网页都有一个referer信息，表示当前网页的链接来源。
                例如我们首先访问新浪首页，然后从新浪首页中解析出了新的新闻链接，
                则这些网页的referer值都是新浪首页。WebCollector不直接保存referer值，
                但我们可以通过下面的方式，将referer信息保存在metaData中，达到同样的效果。
                经典爬虫中锚文本的存储也可以通过下面方式实现。

                在一些需求中，希望得到当前页面在遍历树中的深度，利用metaData很容易实现
                这个功能，在将CrawlDatum添加到next中时，将其depth设置为当前访问页面
                的depth+1即可。
                *//*
                String hrefs = result.attr("href");
                System.out.println(hrefs);
                String townName = result.attr("title");
                System.out.println(townName);
            }*/

            PageData pdComm = null ;//小区详情数据
            List<PageData> commList = new ArrayList<>() ;//小区集合
            Elements jwdResults = page.select(".bot-tag :nth-last-child(4)");
            for (int rank = 0; rank < jwdResults.size(); rank++) {
                Element result = jwdResults.get(rank);
                String jwdData = result.attr("href");
                String[] detailAddress = jwdData.replace("/map/sale/#","").toString().split("&");
                String longi = "";//经度
                String lat = "";//纬度
                String comm_name = "";//小区名称
                int ajk_id = 0 ;//小区编号
                pdComm = new PageData();;
                for (int i = 0 ;i<detailAddress.length;i++){
                    String a = detailAddress[i];
                    if(i == 0 ){
                        longi =  a.substring(a.indexOf("=")+1,a.length()) ;
                        pdComm.put("longi",longi);
                        continue;
                    }
                    if(i == 1){
                        lat  =  a.substring(a.indexOf("=")+1,a.length()) ;
                        pdComm.put("lat",lat);
                        continue;
                    }
                    if(i == 4){
                        comm_name =  a.substring(a.indexOf("=")+1,a.length()) ;
                        pdComm.put("comm_name",comm_name);
                        continue;
                    }
                    if( i == 5){
                        ajk_id = Integer.parseInt(a.substring(a.indexOf("=")+1,a.length())) ;
                        pdComm.put("ajk_id",ajk_id);
                        continue;
                    }
                }
                commList.add(pdComm);
            }
            //小区详情和小区的详细地址+建筑日期合并
            if(commList !=null && commList.size() > 0){
                for (int i = 0 ;i<commList.size() ;i++){
                    String built_date = "暂无数据";//建筑日期
                    String comm_address = "";//小区地址
                    PageData commData = commList.get(i);
                    for (int j = 0 ;j<dataList.size() ;j++){
                        if(j == i){
                            PageData pData = dataList.get(0);
                            built_date = pData.getString("built_date");
                            comm_address = pData.getString("comm_address");
                            dataList.remove(0);
                            break;
                        }
                    }
                    pd = new PageData();
                    pd.put("built_date",built_date);//建筑日期
                    pd.put("comm_address",comm_address);//小区地址
                    pd.put("longi",commData.getString("longi"));//经度
                    pd.put("lat",commData.getString("lat"));//纬度
                    pd.put("comm_name",commData.getString("comm_name"));//小区名称
                    pd.put("ajk_id",commData.getInt("ajk_id"));//小区id
                    pd.put("town_id",townId);//区域id
                    pd.put("town_name",keyWord.substring(keyWord.indexOf("-")+1,keyWord.length()-1));//区域
                    dataList.add(pd);
                }
            }
            resultDataList.addAll(dataList);
        }
    }
}

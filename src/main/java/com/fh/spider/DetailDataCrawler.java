package com.fh.spider;


import cn.edu.hfut.dmic.webcollector.model.CrawlDatum;
import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import com.fh.entity.NmwCityCommunity;
import com.fh.main.JDBCMapperTest;
import com.fh.main.ThreadUtil;
import com.fh.util.PageData;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

/**
 * 安居客详情页
 */

public class DetailDataCrawler extends BreadthCrawler {
    //数据结果集

    public static PageData pd = null;
    public static List<PageData> dataList = new ArrayList<>(); ;

    public static void main(String[] args) throws Exception {
            new ThreadUtil().start();

        /*JDBCMapperTest jdbc = new JDBCMapperTest();
        List<PageData> list = jdbc.getUserList(4000);
        DetailDataCrawler crawler = new DetailDataCrawler("E:\\spider\\crawl", true, list);
        crawler.setThreads(1);
        crawler.setTopN(100);
        crawler.start(1);
        for (int i = 0 ;i<dataList.size() ;i++){
            PageData p = dataList.get(i);
            System.out.println(p.getInt("ajk_id")+"=====");
        }
        jdbc.saveCommunityInfo(dataList);*/
    }




    public DetailDataCrawler(String crawlPath, boolean autoParse,List list) throws Exception {
        super(crawlPath, autoParse);
        for (int i = 0; i < list.size(); i++) {
            PageData pageData = (PageData) list.get(i);
            int id = pageData.getInt("ajk_id");
        //int id = 117 ;
            this.addSeed("http://shanghai.anjuke.com/community/view/" + id);
            this.addRegex("http://shanghai.anjuke.com/community/view/" + id);
            this.addRegex("-.*\\.(jpg|png|gif).*");
            this.addRegex("-.*#.*");
        }
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
        /*if page is news page*/
        if (page.matchUrl("http://shanghai.anjuke.com/community/view/.*")) {
            //System.out.println("====访问地址====" + url);
            int ajk_id = Integer.parseInt(url.substring(url.indexOf("view/")+5));
            Elements contentText = page.select(".comm-detail");
            String html = contentText.toString();
            Document doc = Jsoup.parse(html);
            String text = doc.body().text();
            String[] textData = text.split(" ");
            StringBuffer descStr = new StringBuffer();//小区描述
            pd = new PageData();
            for (int i = 0; i < textData.length; i++) {
                String a = textData[i];
                if (i == 29) {
                    descStr.append(a);
                }
                if (i > 29) {
                    descStr.append(a);
                }
                // 剔除所在版块数据 和 每列标题
                if (i == 0 || i == 2 || i == 3 || i == 4 || i>29 || (i % 2 == 1 && i <29)) {
                    continue;
                }
                /*if (i == 6) {
                    pd.put("comm_address", a);//详细地址
                    continue;
                }*/
                if (i == 8) {
                    pd.put("develop_bus", a);//开发商
                    continue;
                }
                if (i == 10) {
                    pd.put("property_comany", a);//物业公司
                    continue;
                }
                if (i == 12) {
                    pd.put("property_type", a);//物业类型
                    continue;
                }
                if (i == 14) {
                    pd.put("property_free", a);//物业费用
                    continue;
                }
                if (i == 16) {
                    pd.put("total_built_area", a);//总建筑面积
                    continue;
                }
                if (i == 18) {
                    pd.put("total_house", a);//总户数
                    continue;
                }
                if (i == 22) {
                    pd.put("volume", a);//容积率
                    continue;
                }
                if (i == 24) {
                    pd.put("rental_rate", a);//出租率
                    continue;
                }
                if (i == 26) {
                    pd.put("parking_space", a);//停车位
                    continue;
                }
                if (i == 28) {
                    pd.put("green_rate", a);//绿化率
                    continue;
                }
                pd.put("comm_desc", descStr.toString());//描述
            }
            pd.put("ajk_id",ajk_id);
            dataList.add(pd);
        }
    }

}

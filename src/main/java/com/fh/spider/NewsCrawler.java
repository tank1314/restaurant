package com.fh.spider;


import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import com.fh.main.JDBCMapperTest;
import com.fh.service.spider.SpiderService;
import com.fh.util.PageData;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by yuwei on 2016/7/4.
 */

public class NewsCrawler extends BreadthCrawler {
    //数据结果集
    public static String[] result = null ;

    public static void main(String[] args) throws Exception {
        NewsCrawler crawler = new NewsCrawler("E:\\spider\\crawl", true);
        crawler.setThreads(1);
        crawler.setTopN(100);
        crawler.start(2);
        JDBCMapperTest jdbc = new JDBCMapperTest();
        jdbc.saveTownShipInfo(result);
        System.out.println(result.length+"===========");
        /*for (int i= 0 ;i<result.length;i++){
            System.out.println(result[i]);
        }*/
    }

    public NewsCrawler(String crawlPath, boolean autoParse) {
        super(crawlPath, autoParse);
        /*start page*/
        this.addSeed("http://hangzhou.anjuke.com/community/chunan/");

        /*fetch url like http://news.hfut.edu.cn/show-xxxxxxhtml*/
        this.addRegex("http://hangzhou.anjuke.com/community/chunan/");
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
        /*if page is news page*/
        if (page.matchUrl("http://hangzhou.anjuke.com/community/chunan/")) {
            System.out.println("====访问地址===="+url);
            //String title = page.select(" .elems-l").first().text();
            String content = page.select(".sub-items").first().text();
            System.out.println("========"+content);
            result =  content.replace("全部 ","").replaceAll("[a-zA-Z]", "").trim().toString().split(" ");
        }
    }

}

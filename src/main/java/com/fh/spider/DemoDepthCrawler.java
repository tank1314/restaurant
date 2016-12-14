package com.fh.spider;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatum;
import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import  cn.edu.hfut.dmic.webcollector.fetcher.Fetcher;

import java.util.regex.Pattern;

/**
 * 描述:
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/7/5
 * 创建时间: 15:53
 */
public class DemoDepthCrawler extends BreadthCrawler {
    public DemoDepthCrawler(String crawlPath, boolean autoParse) {
        super(crawlPath, autoParse);
    }

    @Override
    public void visit(Page page, CrawlDatums next) {
        //System.out.println("visiting:"+page.getUrl()+"\tdepth="+page.meta("depth"));
        /*System.out.println("visiting:"+page.getUrl());*/
        String question_regex="^http://shanghai.anjuke.com/community/view/.*";
        if(Pattern.matches(question_regex, page.getUrl())){
            System.out.println("processing "+page.getUrl());
            /*extract title of the page*/
            String title=page.getDoc().title();
            System.out.println(title+"=================");

            /*extract the content of question*/
           /* String question=page.getDoc().select("div[id=zh-question-detail]").text();
            System.out.println(question);*/

        }
    }

    @Override
    protected void afterParse(Page page, CrawlDatums next) {
        //当前页面的depth为x，则从当前页面解析的后续任务的depth为x+1
        int depth;
        //如果在添加种子时忘记添加depth信息，可以通过这种方式保证程序不出错
        if(page.meta("depth")==null){
            depth=1;
        }else{
            depth=Integer.valueOf(page.meta("depth"));
        }
        depth++;
        for(CrawlDatum datum:next){
            datum.meta("depth", depth+"");
        }
    }

    public static void main(String[] args) throws Exception {
        DemoDepthCrawler crawler=new DemoDepthCrawler("depth_crawler", true);
        for(int i=1;i<=6;i++){
            //crawler.addSeed(new CrawlDatum("http://news.hfut.edu.cn/list-1-"+i+".html").meta("depth", "1"));
            crawler.addSeed(new CrawlDatum("http://shanghai.anjuke.com/community/beicai/p" + i+"/").meta("depth", "1"));
            //crawler.addRegex(urlString.trim().toString());
        }
        /*正则规则用于控制爬虫自动解析出的链接，用户手动添加的链接，例如添加的种子、或
          在visit方法中添加到next中的链接并不会参与正则过滤*/
        /*自动爬取类似"http://news.hfut.edu.cn/show-xxxxxxhtml"的链接*/
        //crawler.addRegex("http://news.hfut.edu.cn/show-.*html");
        String urlString = "http://shanghai.anjuke.com/community/view/.*/";
        crawler.addRegex(urlString.trim().toString());

        /*不要爬取jpg|png|gif*/
        crawler.addRegex("-.*\\.(jpg|png|gif).*");
        /*不要爬取包含"#"的链接*/
        crawler.addRegex("-.*#.*");

        crawler.setTopN(50);

        crawler.start(2);
    }
}

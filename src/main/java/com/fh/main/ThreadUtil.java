package com.fh.main;

/**
 * Created by tankun on 2016/7/16.
 */

import com.fh.spider.DetailDataCrawler;
import com.fh.util.PageData;

import java.util.List;

/**
 * 线程控制爬虫数据
 */
public class ThreadUtil extends Thread {
   /* private boolean shouldStopFlag = false;
    private long checkIntervalTime;

    public ThreadUtil(long checkIntervalTimeIn) {
        this.checkIntervalTime = checkIntervalTimeIn;
    }*/

    public void run() {
            long currentTime = System.currentTimeMillis();
            int i = 5060;
            JDBCMapperTest jdbc = new JDBCMapperTest();
            for (int j = i; j < 10000; j = j + 20) {
                try {
                    List<PageData> list = jdbc.getUserList(j);
                    if (list != null && list.size() > 0) {
                        //线程暂停10s
                        System.out.println("...线程暂停...");
                        sleep(15000);
                        DetailDataCrawler crawler = new DetailDataCrawler("E:\\spider\\crawl", true, list);
                        crawler.setThreads(1);
                        crawler.setTopN(100);
                        crawler.start(1);
                        //详情数据更新
                        List listDetail = DetailDataCrawler.dataList;
                        jdbc.saveCommunityInfo(listDetail);

                    } else {
                        System.out.println("===数据爬取完毕！共采集数据" + i + "条");
                        System.exit(0);
                    }
                } catch (Exception e) {
                    System.out.println("=====线程异常====" + i);
                    e.printStackTrace();
                }
                finally {
                    System.exit(0);
                }
                long endTime = System.currentTimeMillis();
                System.out.println("共耗时：" + (endTime - currentTime));
            }
        /*while (!shouldStopFlag) {
            //如果获取不到.线程等待指定的时间间隔后，再去获取执行任务
            Runnable nexRunnable = getNextTask();
            if (nexRunnable != null) {
                try {
                    Thread.sleep(checkIntervalTime);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                nexRunnable.run();
            } else {
                try {
                    Thread.sleep(checkIntervalTime);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }*/
    }

   /* private Runnable getNextTask() {
        //获取下一个需要至执行的任务，可以队列等数据结合中获取
        return new MyTask();
    }*/
}


/*
class MyTask implements Runnable {
    public void run() {
        long currentTime = System.currentTimeMillis();
        int i = 5040;
        JDBCMapperTest jdbc = new JDBCMapperTest();
        for (int j = i; j < 10000; j = j + 20) {
            try {
                List<PageData> list = jdbc.getUserList(j);
                if (list != null && list.size() > 0) {
                    DetailDataCrawler crawler = new DetailDataCrawler("E:\\spider\\crawl", true, list);
                    crawler.setThreads(1);
                    crawler.setTopN(100);
                    crawler.start(1);

                */
/*for (int a = 0; a < list.size(); a++) {
                                        PageData p = list.get(a);
                                        System.out.println(p.getInt("ajk_id") + "====aaaaa=");
                                    }*//*


                    //详情数据更新
                    List listDetail = DetailDataCrawler.dataList;
                    jdbc.saveCommunityInfo(listDetail);
                } else {
                    System.out.println("===数据爬取完毕！共采集数据" + i + "条");
                    System.exit(0);
                }
            } catch (Exception e) {
                System.out.println("=====线程异常====" + i);
                e.printStackTrace();
            }
            long endTime = System.currentTimeMillis();
            System.out.println("共耗时：" + (endTime - currentTime));
        }
    }

}
*/


package com.fh;

import com.fh.util.PageData;
import com.fh.util.SortUtil;
import net.sf.json.JSONArray;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.math.BigDecimal;
import java.text.Collator;
import java.text.DecimalFormat;
import java.util.*;

/**
 * 描述:
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/4/27
 * 创建时间: 18:45
 */
public class Main extends Thread {
    static class Users {
        private String city_id;
        private String time;
        private int datacount;

        public String getcity_id() {
            return city_id;
        }

        public void setcity_id(String city_id) {
            this.city_id = city_id;
        }

        public String getTime() {
            return time;
        }

        public void setTime(String time) {
            this.time = time;
        }

        public int getDatacount() {
            return datacount;
        }

        public void setDatacount(int datacount) {
            this.datacount = datacount;
        }
    }

    /*public static List<Map<String, Object>> test() {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        User user = new User();
        user.setId(1);
        user.setName("zhangsan");
        list.add(add(user, "aa"));
        user.setId(2);
        user.setName("lisi");
        list.add(add(user, "bb"));
        return list;
    }*/
    /*public static Map<String, Object> add(User user, String str) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(str, user);
        return map;

    }*/

    public void run() {
        int i = 0;
        for (i = 0; i < 100; i = i+2) {
            try {
                System.out.println("=====先执行任务+" + i);
                sleep(1000);
                System.out.println("======10s后====" + i);
            } catch (Exception e) {
                System.out.println("=====线程异常====" + i);
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
       /* String a = "1,2,3,4,5" ;
        String[] b = null;
        b = a.split(",");
        System.out.println(b[1]);*/
        /*String json = "[{\"id\":1000,\"type\":\"01\"},{\"id\":1010,\"type\":\"02\"}]"; */
        String passwd = new SimpleHash("SHA-1", "admin", "1").toString();
        System.out.print(passwd);

       /*java.util.List lista = new ArrayList() ;
        PageData p1 = new PageData();
        p1.put("a1","a1");
        p1.put("a11","a11");
        lista.add(p1) ;
        System.out.println(lista.get(0));
        List listb = new ArrayList() ;
        PageData p2 = new PageData();
        p2.put("a2","a2");
        p2.put("a22","a22");
        listb.add(p2) ;
        List resultLisy = new ArrayList() ;
        resultLisy.add(lista);
        resultLisy.add(listb) ;
        System.out.println(resultLisy.size());*/
        /* StringBuffer mobile = new StringBuffer("15000629795");
        System.out.println(mobile.replace(3,7,"牛家帮x").toString());*/
        /*new Main().start();*/

       /* String passwd = new SimpleHash("SHA-1", "huamingcan", "1").toString();
        System.out.printf(passwd);*/
        /*String url = "http://shanghai.anjuke.com/community/view/200907";
        System.out.println(url.substring(url.indexOf("view/")+5));*/
        /*String html = "<div class=\"border-info comm-detail\"> \n" +
                " <div class=\"comm-list clearfix\"> \n" +
                "  <dl class=\"comm-l-detail float-l\"> \n" +
                "   <dt>\n" +
                "    小区名\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    浦东星河湾\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    所在版块\n" +
                "   </dt> \n" +
                "   <dd>\n" +
                "    <a title=\"浦东\" alt=\"浦东\" href=\"http://shanghai.anjuke.com/sale/pudong/\" target=\"_blank\" _soj=\"commaddrQ\"> 浦东</a> \n" +
                "    <a title=\"北蔡\" alt=\"北蔡\" href=\"http://shanghai.anjuke.com/sale/beicai/\" target=\"_blank\" _soj=\"commaddrB\"> 北蔡</a> \n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    地址\n" +
                "   </dt>\n" +
                "   <dd class=\"comm-adres\">\n" +
                "    <em>锦绣路2580弄</em> \n" +
                "    <a class=\"comm-icon\" target=\"_blank\" _soj=\"commaddr\" href=\"http://shanghai.anjuke.com/map/sale/?#l1=31.2009522&amp;l2=121.543381&amp;l3=18&amp;commid=200907&amp;commname=浦东星河湾\"></a>\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    开发商\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    上海浦东星河湾房地产开发有限公司\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    物业公司\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    星河湾物业管理有限公司\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    物业类型\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    公寓\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    物业费用\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    4.9元/平方米/月\n" +
                "   </dd> \n" +
                "   <div style=\"clear: both\"></div> \n" +
                "  </dl> \n" +
                "  <dl class=\"comm-r-detail float-r\"> \n" +
                "   <dt>\n" +
                "    总建面\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    95000平方米（中型小区）\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    总户数\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    531户\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    建造年代\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    2009-08\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    容积率\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    1.72\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    出租率\n" +
                "   </dt>\n" +
                "   <dd id=\"rate\">\n" +
                "    暂无数据\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    停车位\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    825\n" +
                "   </dd> \n" +
                "   <dt>\n" +
                "    绿化率\n" +
                "   </dt>\n" +
                "   <dd>\n" +
                "    58%（绿化率高）\n" +
                "   </dd> \n" +
                "   <div style=\"clear: both\"></div> \n" +
                "  </dl> \n" +
                " </div> \n" +
                " <div id=\"comm-description\" class=\"comm-description\"> \n" +
                "  <div class=\"desc-cont\">\n" +
                "   浦东星河湾为距离陆家嘴最近的最后一个开发中的规模型社区。项目分为三期开发，一期2009年亮相之初，就凭借卓越的产品品质惊艳上海。浦东星河湾二期在市场期待了2年后，倾城绽放，是星河湾集团着力打造的全新建筑艺术品。浦东星河湾二期总建筑面积约8万平米，由6幢小高层组成，只有209套单位，延续星河湾一贯的精装、精饰大平层产品特征；标准层产品以4房和5房为主，有8种不同的户型。 在建筑布局方面，浦东星河湾二期秉承星河湾集团不断创新、追求卓越的理念，建筑与园林同步设计，融汇中西文化精髓，形成独特的建筑语言。百米楼间距、经典的三段式建筑设计，凝练一种独特的建筑艺术风格。浦东星河湾二期坚持“打造同纬度最美的园林”，采用独到的园林堆坡+下沉式庭院的立体造景手法，从世界各地引入近千种植被，采用全冠移植手法搭配栽种。浦东星河湾预计今年6、7月推出三期最新样板房，预计户型为200-250平米的三房，以及250-300平米的四房，精装交付，总高18层。销售称，目前三期价格未定，外传均价80000元/平并未得到官方认可。曲径幽深的园区小径掩映在四季变幻的园林中，一草一木之间的替换使空间变得更加灿烂而欢快。2600余吨黄蜡石的广泛使用，搭配大面积的水系景观，宽达4米左右的星河湾独特的宅间水系，蜿蜒流转于建筑与园林之中。更有超大规模的梦幻灯光泳湖等，为业主营造“大隐隐于市”的生活氛围。\n" +
                "  </div> \n" +
                " </div> \n" +
                " <div style=\"width: 868px; height: 35px;\">\n" +
                "  <a id=\"click-arrow\" href=\"javascript:void(0)\" class=\"click-arrow\"><i class=\"arrow-i\"></i></a>\n" +
                " </div> \n" +
                "</div>";
        Document doc = Jsoup.parse(html);
        //System.out.println(doc);
        String text = doc.body().text();
       // System.out.println(text+"=============");
        String[] textData = text.split(" ");
        for (int i = 0 ;i<textData.length ;i++){
            String a = textData[i];
            // 剔除所在版块数据 和 每列标题
            if(i ==0 || i == 2 || i == 3 || i == 4 || (i%2 == 1  && i != 1)){
                continue;
            }
            System.out.println(a);
        }*/

        /*String detail = "/map/sale/#l1=31.1917934417725&l2=121.543739318848&l3=18&flag=1&commname=锦华花园&commid=2681";
       *//* String a1 = detail.replace("/map/sale/#","").toString();
        System.out.println(detail.replace("/map/sale/#","").toString());*//*
        String[] detailAddress = detail.replace("/map/sale/#","").toString().split("&");
        String longi = "";//经度
        String lat = "";//纬度
        String comm_name = "";//小区名称
        int ajk_id = 0 ;//小区编号
        PageData pdComm = new PageData();;
        List<PageData> commList = new ArrayList<>();
        for (int i = 0 ;i<detailAddress.length;i++){
            String a = detailAddress[i];
            if(i == 0 ){
                longi =  a.substring(a.indexOf("=")+1,a.length()) ;
                pdComm.put("longi",longi);
            }
            if(i == 1){
                lat  =  a.substring(a.indexOf("=")+1,a.length()) ;
                pdComm.put("lat",lat);
            }
            if(i == 4){
                comm_name =  a.substring(a.indexOf("=")+1,a.length()) ;
                pdComm.put("comm_name",comm_name);
            }
            if( i == 5){
                ajk_id = Integer.parseInt(a.substring(a.indexOf("=")+1,a.length())) ;
                pdComm.put("ajk_id",ajk_id);
            }
        }
        commList.add(pdComm);
        System.out.println(commList.get(0));
*/

        /*String adresss = "［浦东-北蔡］锦绣路2580弄 锦绣路2581弄［浦东-北蔡］莲溪路126弄 莲园路555弄 ［浦东-北蔡］五星路239弄 151弄 231弄 ";
        int index=adresss.indexOf("]");
        String last=adresss.substring(index+1);
//        String new = "锦绣路2580弄 锦绣路2581弄 五星路239弄 151弄 231弄";
        String[] ad = adresss.split("［浦东-北蔡］");
        System.out.println(ad.length);
        for (int i = 0 ;i<ad.length ;i++){
            System.out.println(ad[i]);
        }*/

       /* String keyWord = "［浦东-航头］";
        System.out.println(keyWord.substring(keyWord.indexOf("-")+1,keyWord.length()-1));*/
        /*String dateStrings = "竣工日期：1994年10月 竣工日期：暂无数据 竣工日期：暂无数据 竣工日期：1985年05月 竣工日期：暂无数据 竣工日期：2000年01月 竣工日期：2001年06月 竣工日期：1997年09月 竣工日期：2010年06月 竣工日期：1994年01月 竣工日期：暂无数据 竣工日期：暂无数据 竣工日期：暂无数据 竣工日期：1997年06月 竣工日期：暂无数据 竣工日期：1997年12月 竣工日期：暂无数据 竣工日期：1997年01月 竣工日期：1997年01月 竣工日期：暂无数据 竣工日期：1997年12月 竣工日期：暂无数据 竣工日期：暂无数据 竣工日期：1997年12月 竣工日期：暂无数据 竣工日期：暂无数据 竣工日期：1996年07月 竣工日期：2000年01月 竣工日期：1998年06月 竣工日期：暂无数据";
        //String a = dateStrings.replace("竣工日期：","");
        String[] dates = dateStrings.replace("竣工日期：","").split(" ");
        System.out.println(dates.length);
        for (int i  = 0 ;i<dates.length ; i++){
            System.out.println(dates[i].replace("年","-").replace("月",""));
        }*/

       /* String a = new SimpleHash("SHA-1", "lizhi", "1").toString();
        System.out.println(a);*/
        //String a = "B 北蔡 碧云 C 川沙 曹路 G 高行 H 惠南 航头 花木 J 金杨 金桥 K 康桥 L 临港新城 六里 联洋 陆家嘴 M 梅园 N 南码头 泥城 P 浦东外环 S 三林 上南 世博滨江 世纪公园 T 唐镇 塘桥 W 外高桥 潍坊 X 新场 Y 杨东 洋泾 源深 Z 周浦 张江 祝桥";
       /* String str="B 北蔡 碧云 ";//str是要检测的字符串
        String strNew = str.replaceAll("[a-zA-Z]","").trim();*/
       /* String regex="^[A-Z]\\u4e00-\\u9fa5]{0,60}$";
        Boolean Flag=str.matches(regex);
        if (Flag) {
            System.out.println(str+ "是合法的");
        } else {
            System.out.println(str+ "是不合法的.....");
        }*/
        //System.out.println(strNew);


        /*List<PageData> list = new ArrayList<>();
        PageData pd = new PageData();
        pd.put("room","一室");
        pd.put("dataCount",200) ;
        list.add(pd);

        PageData pd1 = new PageData();
        pd1.put("room","三室");
        pd1.put("dataCount",300) ;
        list.add(pd1);

        PageData pd2 = new PageData();
        pd2.put("room","四室");
        pd2.put("dataCount",400) ;
        list.add(pd2);

        PageData pd3 = new PageData();
        pd3.put("room","二室");
        pd3.put("dataCount",500) ;
        list.add(pd3);
        SortUtil.sort(list, "room", "desc");
        for(PageData result:list){
            System.out.println("房间类型："+result.getString("room")+"数据量："+result.getInt("dataCount"));
        }

        String[] strs = {"1室", "3室", "2室"};
    // 定义一个中文排序器
        Comparator c = Collator.getInstance(Locale.CHINA);
    // 升序排序
            Arrays.sort(strs, c);
        for (int j = 0 ;j<strs.length;j++){
            System.out.println(strs[j]);
        }*/



        /*int[] arry = new int[]{5,0,1,2,6,9,7};
        int[] index = new int[]{2,0,1,1,1,4,3,5,6,5,0};
        String tel = "";
        for(int i:index){
            tel+=arry[i];
        }
        System.out.println(tel+"");*/
        /*String city = "1,3";
        String newcity =city.replace("1","上海市").replace("2","深圳市").replace("3","杭州市");
        System.out.println(newcity);*/

        /*List listA = new ArrayList();
        listA.add("A");
        listA.add("A1");

        List listB = new ArrayList();
        listB.add("B");
        listB.add("B1");

        List listFinal = new ArrayList();
        listFinal.addAll(listA);
        listFinal.addAll(listB);

        //same result
        //List<String> listFinal = new ArrayList<String>(listA);
        //listFinal.addAll(listB);

        System.out.println("listA : " + listA);
        System.out.println("listB : " + listB);
        System.out.println("listFinal : " + listFinal);*/
        /*String[] dateTime = new String[]{"08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00"};
        Map<String, List> resultMap = new HashMap<>();//一天13个服务时间的数据结果集
        String[] city = new String[]{"1", "2"};
        for (int c = 0; c < city.length; c++) {
            String city_info = city[c];
            ArrayList<Users> a1 = new ArrayList<>();
            for (int t = 0; t < dateTime.length; t++) {
                Users us = new Users();
                us.setTime(dateTime[t]);
                us.setDatacount(0);
                us.setcity_id(city_info);
                a1.add(us);
            }
            resultMap.put(city_info, a1);
        }
        List rList = new ArrayList<>(resultMap.values());
        List dataList = new ArrayList<>();
        Users u = new Users();
        u.setDatacount(12);
        u.setTime("08:00");
        u.setcity_id("1");
        dataList.add(u);
        Users u2 = new Users();
        u2.setDatacount(12);
        u2.setTime("09:00");
        u2.setcity_id("1");
        dataList.add(u2);

        Users u3 = new Users();
        u3.setDatacount(102);
        u3.setTime("09:00");
        u3.setcity_id("2");
        dataList.add(u3);

        List list = new ArrayList<>();
        list.addAll(rList);
        list.addAll(dataList);
        System.out.println("listA : " + rList);
        System.out.println("listB : " + dataList);
        System.out.println("listFinal : " + list);*/
        /*List<Users> resultInner = null;
        Map<String, List> resultList = new HashMap<>();
        //初始化时所有城市下数据列表
        for (int j = 0; j < rList.size(); j++) {
            //初始化的集合对象数据
            List<Users> cshList = (List) rList.get(j);
            //对应城市下的 时间段数据
            resultInner = new ArrayList<>();
            String cityId1 = "";//初始化的城市id
            //初始化的数据结果集
            for (int a = 0; a < cshList.size(); a++) {
                Users uc = new Users();
                cityId1 = cshList.get(a).getcity_id();
                String t1 = cshList.get(a).getTime();//初始化的时间段
                int datacount1 = cshList.get(a).getDatacount();//初始化的数据量
                int datacount = 0;//数据库中的数据量
                String t = ""; //数据库中的时间段
                //查询出来的结果集对象
                if(dataList !=null && dataList.size() > 0){
                    for (int i = 0; i < dataList.size(); i++) {
                        Users us = (Users) dataList.get(i);
                        t = us.getTime(); //数据库中的时间段
                        String cityId = us.getcity_id();// 数据库中的城市id
                        datacount = us.getDatacount();//数据库中的数据量
                        if ((cityId + t).equals(cityId1 + t1)) {
                            datacount1 = datacount;
                            break;
                        }
                    }
                }
                uc.setcity_id(cityId1);
                uc.setTime(t1);
                uc.setDatacount(datacount1);
                resultInner.add(uc);
            }
            resultList.put(cityId1, resultInner);
        }
        List result_resultList = new ArrayList<>(resultList.values());
        for (int i = 0; i < result_resultList.size(); i++) {
            System.out.println(result_resultList.get(i));
        }*/
        //p.put("")


        /*List<PageData> resultList = new ArrayList(resultMap.values()) ;
        Map rMap = new HashMap<>();
        for (int i = 0 ;i<resultList.size() ;i++){
            PageData pd = resultList.get(i);
            for (int j = 0 ;j<pd.size();j++){
                Users user = new Users();


                int city_id = pd.getInt("city_id");
                String time = pd.getString("time");
                int datacount = pd.getInt("datacount");
                user.setCity_id(city_id);
                user.setDatacount(datacount);
                user.setTime(time);

            }
        }*/

       /* StringBuilder s =new StringBuilder( "15000629795");
        StringBuffer a = new StringBuffer("15000629795");
        System.out.println(a.replace(3,7,"aaaaa"));
        System.out.println(s.replace(3, 7, "****"));

        String as = ",1200,1213,";
        String [] asa = as.split(",",as.length());
        for(int i = 0 ;i<asa.length;i++){
            System.out.println(asa.length+"==="+asa[i]);
        }*/
       /* System.out.println(System.currentTimeMillis());
        StringBuffer str = new StringBuffer();
        String time = "2016-10-02";
       // StringBuffer str = new StringBuffer();
        str.append(time.substring(6).replace("-","月"));
        System.out.println(str.append("日").toString());*/
//        double a = 48.7;
//        double b = 49.3;
//        System.out.println(sub(a,b));
        /*String a = "洗衣";
        System.out.println(a.hashCode());*/
        // System.out.println(DateUtil.fomatDate2Str(DateUtil.getPreMonth(DateUtil.fomatDate("2016-06","yyyy-MM")),"yyyy-MM"));

       /* String a = "abdc|efcd|131sg";
        String [] b = a.split("\\|");
        System.out.println(b.length+b[1]);*/
        //System.out.println(DateUtil.getDay());

       /*Map map = new HashMap();
        map.put("20160304&13111231", "a1");
        map.put("20160306@1232131", "b1");
        map.put("20160306&13131", "c1");

        List listKey = new ArrayList();
        Iterator it = map.keySet().iterator();
        while (it.hasNext()) {
            String key = it.next().toString();
            if(key.contains("20160306")){
                System.out.println("进入次数："+key);
            }
            *//*PageData pdRow = new PageData();
            pdRow.put("key",key);
            pdRow.put("value",map.get(key));
            listKey.add(pdRow);*//*
        }
        System.out.println("Convert Finished !");*/

//        for(int i =0 ;i<listKey.size();i++){
//            System.out.print(listKey.get(i));
//        }
        /*String s2 = "-1,08:00,21:30,可出勤工段|";
        String[] strs = s2.split("\\|");
        for(int i =0 ;i<strs.length ;i++){
            System.out.println(strs[i]);
        }*/


        // System.out.println((scaleNumber(280, 3980)));
    }

    public static double sub(double d1, double d2) {
        BigDecimal bd1 = new BigDecimal(Double.toString(d1));
        BigDecimal bd2 = new BigDecimal(Double.toString(d2));
        return bd1.subtract(bd2).doubleValue();
    }

    public static double scaleNumber(double num, double scale) {
        DecimalFormat df = null;
        if (scale == 1.0D) {
            df = new DecimalFormat("#.0000");
        } else {
            df = new DecimalFormat("#.00");
        }
        double scaledNum = num / scale;
        return Double.valueOf(df.format(scaledNum)).doubleValue();
    }

    public int compareTo(PageData p) {

        return 0;
    }
}

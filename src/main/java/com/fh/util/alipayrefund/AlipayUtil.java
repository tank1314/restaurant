package com.fh.util.alipayrefund;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * 自定义支付宝工具类
 * @author Administrator
 *
 */
public class AlipayUtil {

    /**
     * 获取当前日期+时间 格式为 yyyy-MM-dd HH:mm:ss
     * @return
     */
    public static String currentDateTime(){
        return getDateByOffset("yyyy-MM-dd HH:mm:ss",0);
    }

    /**
     * 获取当前日期 格式为 yyyyMMdd
     * @return
     */
    public static String currentDate(){
        return getDateByOffset("yyyyMMdd",0);
    }

    /**
     * 获取相隔offset天的日期,并根据formatStr格式化日期
     * @param formatStr
     * @param offset
     * @return
     */
    private static String getDateByOffset(String formatStr,int offset){
        SimpleDateFormat format=new SimpleDateFormat(formatStr);
        Calendar calendar=Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, offset);
        return format.format(calendar.getTime());
    }

    /**
     * 获取批次号
     * @return
     */
    public static String getBatchCode(){
        long code=System.currentTimeMillis();
        String batchCode=currentDate()+code;
        return batchCode;
    }

}

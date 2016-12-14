package com.fh.util;

import java.text.DecimalFormat;

/**
 * 描述:
 * 版权: Copyright (c) 2016
 * 公司: 牛家帮
 * 作者: 谭坤(tan.kun@niuhome.com)
 * 版本: 1.0
 * 创建日期: 2016/4/28
 * 创建时间: 18:22
 */
public class MathUtil {

    /**
     * 相关计算
     * 将计算成%格式
     * @param num  除数
     * @param scale 被除数
     * @return
     */
    public static double scaleNumber(double num, double scale)
    {
        DecimalFormat df = null;
        if (scale == 1.0D)
        {
            df = new DecimalFormat("#.0000");
        }
        else
        {
            df = new DecimalFormat("#.000");
        }
        double scaledNum = (num / scale)*100;
        return Double.valueOf(df.format(scaledNum)).doubleValue();
    }

}

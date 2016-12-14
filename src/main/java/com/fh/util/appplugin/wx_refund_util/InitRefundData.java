package com.fh.util.appplugin.wx_refund_util;

import com.tencent.WXPay;

/**
 * User: rizenguo
 * Date: 2014/12/6
 * Time: 14:39
 */
public class InitRefundData {

    public static void initSDK(){
       //String wxcertificate= CodeData.getCodeByBianma("weixinpayplatform", "wxcertificate");
        WXPay.initSDKConfiguration(
                "f15c3b01fce2e51b7b610aa1565788e5",
                "wxf3d109497dba84f1",
                "1227126001",
                "",
                //wxcertificate,
                "D:/wxrefund/apiclient_cert.p12",
                //"G:/workDemo/zhengshu/apiclient_cert.p12",
                "1227126001"
        );
    }
    //wxcertificate
}

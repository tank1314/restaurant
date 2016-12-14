package com.fh.util.alipayrefund;

/**
 * Created by admin on 2016/6/16.
 */
public class AlipayGlobalConfig {

    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    // 合作身份者ID，以2088开头由16位纯数字组成的字符串
    public static String partner = "2088411630885226";
    public static String appid = "2015011600025859";
    // 商户的私钥
    public static String private_key = "MIICWwIBAAKBgQDiEnYEmYoPp1BexLB5kHn2Xrhi3tWiVlwJMlHXWpRJ4rIG6Zun" +
            "phm9OIl/w9inoBAF+yn4DkIF5Qm1yz4fds0W91i4zq2rHkO8oCPPDdZQsN/iSytL" +
            "GilV3U8cGsaJ/FKDiaqg+pXdFg2Kjef3cVQs0QEK4UkMjlFM5rvzuJjyqQIDAQAB" +
            "AoGALiwJEI1vRh0s6/4N8PYSAsB7ti2+wiYTLAmr72jfimuTYpgJo2boMN5ALukH" +
            "8cxeGWqfurrmvx91KTz2ViTEY/8dQ2Mu/jTpDKIqMkLKhAHa5MDwJvmOorlqPy6x" +
            "iUS/Kya8NqsubEqjnGmOEx/1uFadl0oLj83iI1te3R9ME9ECQQD1Q/Ji7ELz+e3h" +
            "yOZjS3vnH0i17B1F9VbvLDU4bXX62seglIPl2/UfoOf8L6Npnof9N5oV7TazFwL4" +
            "Tw2HmO4FAkEA6/d28b6C7JVTSCkPA4oR7Szl789GbiyIBgtTzqdXjY51IJ74gTTb" +
            "fce2JqTdPRLgeXnNXuEqMWj4cgHcfdMvVQJALFvOod+TOGcShAx+xqSnUyTQVL7Q" +
            "iI+X2ogHVB5QAT/CbSOPO2ptyfujGXRQPNEETWLaBm8xvnBCBEDf9I9PNQJAYRDw" +
            "FeunkcivdJynN26Bh04T3D0onMOmxM2+EOFXq7xxRBUA5q2mqKwRqv3goHH2cyH+" +
            "sEvxflfO857+Y6gO7QJADUXeMeFNhltJxIGKU083Bci1alzgxfXIyR9WW7pChD5K" +
            "LcjHZNg0vHethsxdZ4CkkB6ObfHqXEzkEevmsA9fxA==";

    //public static String private_key = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAOISdgSZig+nUF7EsHmQefZeuGLe1aJWXAkyUddalEnisgbpm6emGb04iX/D2KegEAX7KfgOQgXlCbXLPh92zRb3WLjOraseQ7ygI88N1lCw3+JLK0saKVXdTxwaxon8UoOJqqD6ld0WDYqN5/dxVCzRAQrhSQyOUUzmu/O4mPKpAgMBAAECgYAuLAkQjW9GHSzr/g3w9hICwHu2Lb7CJhMsCavvaN+Ka5NimAmjZugw3kAu6QfxzF4Zap+6uua/H3UpPPZWJMRj/x1DYy7+NOkMoioyQsqEAdrkwPAm+Y6iuWo/LrGJRL8rJrw2qy5sSqOcaY4TH/W4Vp2XSguPzeIjW17dH0wT0QJBAPVD8mLsQvP57eHI5mNLe+cfSLXsHUX1Vu8sNThtdfrax6CUg+Xb9R+g5/wvo2meh/03mhXtNrMXAvhPDYeY7gUCQQDr93bxvoLslVNIKQ8DihHtLOXvz0ZuLIgGC1POp1eNjnUgnviBNNt9x7YmpN09EuB5ec1e4SoxaPhyAdx90y9VAkAsW86h35M4ZxKEDH7GpKdTJNBUvtCIj5faiAdUHlABP8JtI487am3J+6MZdFA80QRNYtoGbzG+cEIEQN/0j081AkBhEPAV66eRyK90nKc3boGHThPcPSicw6bEzb4Q4VervHFEFQDmraaorBGq/eCgcfZzIf6wS/F+V87znv5jqA7tAkANRd4x4U2GW0nEgYpTTzcFyLVqXODF9cjJH1ZbukKEPkotyMdk2DS8d62GzF1ngKSQHo5t8epcTOQR6+awD1/E";

    //public static String private_key ="MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAOISdgSZig+nUF7EsHmQefZeuGLe1aJWXAkyUddalEnisgbpm6emGb04iX/D2KegEAX7KfgOQgXlCbXLPh92zRb3WLjOraseQ7ygI88N1lCw3+JLK0saKVXdTxwaxon8UoOJqqD6ld0WDYqN5/dxVCzRAQrhSQyOUUzmu/O4mPKpAgMBAAECgYAuLAkQjW9GHSzr/g3w9hICwHu2Lb7CJhMsCavvaN+Ka5NimAmjZugw3kAu6QfxzF4Zap+6uua/H3UpPPZWJMRj/x1DYy7+NOkMoioyQsqEAdrkwPAm+Y6iuWo/LrGJRL8rJrw2qy5sSqOcaY4TH/W4Vp2XSguPzeIjW17dH0wT0QJBAPVD8mLsQvP57eHI5mNLe+cfSLXsHUX1Vu8sNThtdfrax6CUg+Xb9R+g5/wvo2meh/03mhXtNrMXAvhPDYeY7gUCQQDr93bxvoLslVNIKQ8DihHtLOXvz0ZuLIgGC1POp1eNjnUgnviBNNt9x7YmpN09EuB5ec1e4SoxaPhyAdx90y9VAkAsW86h35M4ZxKEDH7GpKdTJNBUvtCIj5faiAdUHlABP8JtI487am3J+6MZdFA80QRNYtoGbzG+cEIEQN/0j081AkBhEPAV66eRyK90nKc3boGHThPcPSicw6bEzb4Q4VervHFEFQDmraaorBGq/eCgcfZzIf6wS/F+V87znv5jqA7tAkANRd4x4U2GW0nEgYpTTzcFyLVqXODF9cjJH1ZbukKEPkotyMdk2DS8d62GzF1ngKSQHo5t8epcTOQR6+awD1/E";
    //public static String private_key ="MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAOePK42IunKyaUmu8iYB5iMer7f2HwN49I4TzQZkwCTxXoAJOoD9CEyr0bmBvTOlrbMclKcrRjYrLUvZq2Hyd0kae6mgQMNcyB5l4JFcfZ3Ugkt4eyP0dkGgWOZTbtUjllR7YmAoz4RXAOHr3DHZwRjvj+0Qfzl4BITeJvDDJ58LAgMBAAECgYBQPJ710xvwJHwxSQqlOuE46CgxUXpbpKzxElFn1r9xzaVWLlx0V7lpf9wTMK6T1+QBfXTRHECfAoUWlF07el30cQvcAwoVrNHlMBCek/vcDuZtsdYeAaEllJOfrujWV2HXxYvtpH0zOXvt/LnbXsLI/kC/e2FwHtISxpcFeMKAWQJBAPnV7Kmy9l2+/2oiGMY9cKXZJNhER0EjaXJ3oKPKA2wm/3ugN1bfJHA9SFQWtgtjxWY1Y808c4+BahP0BOapn68CQQDtRc2/9RZ5opHj4ZFv7bmOolXSuyRa3LYuynD63PTLvFBlL4GLr9+VbVsQp3wjKKZqaXnZ28yc4QOJjNiKrxFlAkAtW1Md8+maV2STZiFNTDY5RdTUloDBKKaqK2G0mqZIakQTs6CYWuaIofeRnJXsN27NAYBe8EyijwItIS4KmlztAkEAr04kr1AAtAvmKG1PjFgjAfx01obIXI232Shfgynff+v5plkMKM3frsKmRs7IDB4LnpGhotIgAkTJ3UX/869XdQJBANw0j3S6c7ZbCfjP1F/MtvSTO0NTp6d5Br2MwWCxCYwNP30ORfnQLQRRAiORkd4ryfjIogW2WIoFlsWxBF+rsxE=";

    // 支付宝的公钥，无需修改该值
    public static String ali_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";
    //copy过来的
    //public static String ali_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";
    //public static String ali_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrpHdd7PEUXiqI3+HENwlFuK0ruYW6x82OnvtDQTOVs4omxBlph+D/5UJljBH7eaz+NyR9hQvd05aos5EDXkibi1ew1Cs9xSM/yBZjN7CBoI4LJU2Tbwr7BxMuZWzfX72bz8r5iZy78QnflWaGHuZCWWbYsIGvYIL67+4aAaOLzwIDAQAB";

    //APP
    //public static String ali_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDnjyuNiLpysmlJrvImAeYjHq+39h8DePSOE80GZMAk8V6ACTqA/QhMq9G5gb0zpa2zHJSnK0Y2Ky1L2ath8ndJGnupoEDDXMgeZeCRXH2d1IJLeHsj9HZBoFjmU27VI5ZUe2JgKM+EVwDh69wx2cEY74/tEH85eASE3ibwwyefCwIDAQAB";

    //↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


    // 调试用，创建TXT日志文件夹路径

    public static String log_path ="/mnt/alipaylog/";

    // 字符编码格式 目前支持 gbk 或 utf-8
    public static String input_charset = "utf-8";

    // 签名方式 不需修改
    public static String sign_type = "RSA";
}

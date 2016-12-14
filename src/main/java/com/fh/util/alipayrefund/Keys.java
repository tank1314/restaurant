/*
 * Copyright (C) 2010 The MobileSecurePay Project
 * All right reserved.
 * author: shiqun.shi@alipay.com
 *
 *  提示：如何获取安全校验码和合作身份者id
 *  1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
 *  2.点击“商家服务”(https://b.alipay.com/order/myorder.htm)
 *  3.点击“查询合作者身份(pid)”、“查询安全校验码(key)”
 */
package com.fh.util.alipayrefund;

//
// 请参考 Android平台安全支付服务(msp)应用开发接口(4.2 RSA算法签名)部分，并使用压缩包中的openssl RSA密钥生成工具，生成一套RSA公私钥。
// 这里签名时，只需要使用生成的RSA私钥。
// Note: 为安全起见，使用RSA私钥进行签名的操作过程，应该尽量放到商家服务器端去进行。
public final class Keys {

    //合作身份者id，以2088开头的16位纯数字
    public static final String DEFAULT_PARTNER = "2088411630885226";

    //收款支付宝账号
    public static final String DEFAULT_SELLER = "caiwu@niuhome.com";

    //商户私钥，自助生成
    public static final String PRIVATE = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAOISdgSZig+nUF7EsHmQefZeuGLe1aJWXAkyUddalEnisgbpm6emGb04iX/D2KegEAX7KfgOQgXlCbXLPh92zRb3WLjOraseQ7ygI88N1lCw3+JLK0saKVXdTxwaxon8UoOJqqD6ld0WDYqN5/dxVCzRAQrhSQyOUUzmu/O4mPKpAgMBAAECgYAuLAkQjW9GHSzr/g3w9hICwHu2Lb7CJhMsCavvaN+Ka5NimAmjZugw3kAu6QfxzF4Zap+6uua/H3UpPPZWJMRj/x1DYy7+NOkMoioyQsqEAdrkwPAm+Y6iuWo/LrGJRL8rJrw2qy5sSqOcaY4TH/W4Vp2XSguPzeIjW17dH0wT0QJBAPVD8mLsQvP57eHI5mNLe+cfSLXsHUX1Vu8sNThtdfrax6CUg+Xb9R+g5/wvo2meh/03mhXtNrMXAvhPDYeY7gUCQQDr93bxvoLslVNIKQ8DihHtLOXvz0ZuLIgGC1POp1eNjnUgnviBNNt9x7YmpN09EuB5ec1e4SoxaPhyAdx90y9VAkAsW86h35M4ZxKEDH7GpKdTJNBUvtCIj5faiAdUHlABP8JtI487am3J+6MZdFA80QRNYtoGbzG+cEIEQN/0j081AkBhEPAV66eRyK90nKc3boGHThPcPSicw6bEzb4Q4VervHFEFQDmraaorBGq/eCgcfZzIf6wS/F+V87znv5jqA7tAkANRd4x4U2GW0nEgYpTTzcFyLVqXODF9cjJH1ZbukKEPkotyMdk2DS8d62GzF1ngKSQHo5t8epcTOQR6+awD1/E";

    public static final String PUBLIC = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";

}
package com.fh.util.appplugin;

import com.fh.util.alipayrefund.AlipayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Dictionary;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：3.3
 *日期：2012-08-10
 *说明:
 *整合Spring框架，使用@Component标注bean，使得Spring可以自动注入该bean

 *提示：如何获取安全校验码和合作身份者ID
 *1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
 *2.点击“商家服务”(https://b.alipay.com/order/myOrder.htm)
 *3.点击“查询合作者身份(PID)”、“查询安全校验码(Key)”

 *安全校验码查看时，输入支付密码后，页面呈灰色的现象，怎么办？
 *解决方法：
 *1、检查浏览器配置，不让浏览器做弹框屏蔽设置
 *2、更换浏览器或电脑，重新登录查询。
 */
@Component("alipayConfig")
public class AlipayConfig {
    /**
     * 商户支付宝账号
     */
    @Value("${alipayConfig.account}")
    private String account;
    /**
     * 合作身份者ID，以2088开头由16位纯数字组成的字符串
     */
    @Value("${alipayConfig.partner}")
    private String partner;
    /**
     * 商户签约安全校验码
     */
    @Value("${alipayConfig.key}")
    private String key;

    /**
     * 字符编码
     */
    @Value("${alipayConfig.input_charset}")
    private String input_charset;

    /**
     * 签名类型
     */
    @Value("${alipayConfig.sign_type}")
    private String sign_type;

    /**
     * 支付宝提供给商户的服务接入网关URL(新)
     */
    @Value("${alipayConfig.alipay_gateway_new}")
    private String alipay_gateway_new;

    /**
     * 支付宝消息验证地址
     */
    @Value("${alipayConfig.https_verify_url}")
    private String https_verify_url;

/*    @Autowired
    private DictionaryDao dictionaryDao;*/

    public String getHttps_verify_url() {
        return https_verify_url;
    }

    public void setHttps_verify_url(String https_verify_url) {
        this.https_verify_url = https_verify_url;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getInput_charset() {
        return input_charset;
    }

    public void setInput_charset(String input_charset) {
        this.input_charset = input_charset;
    }

    public String getSign_type() {
        return sign_type;
    }

    public void setSign_type(String sign_type) {
        this.sign_type = sign_type;
    }

    public String getAlipay_gateway_new() {
        return alipay_gateway_new;
    }

    public void setAlipay_gateway_new(String alipay_gateway_new) {
        this.alipay_gateway_new = alipay_gateway_new;
    }


    public String getNotify_url(){
        //System.out.println("支付宝退款回调="+CodeData.getCodeByBianma("apypayplatform","shenniuurl"));
        return "http://suny.iego.cn.46040/huanxin/app/paylog/alipay/SNAlipayPayCallBackOrder";
        //Dictionary alipayRefundUrl=dictionaryDao.getDictionaryBykey("apypayplatform_xiaoniuurl");
        //return alipayRefundUrl.getValue();
    }

    /**
     * 退款日志保存路径
     * @return
     */
    public String log_path(){
        //return CodeData.getCodeByBianma("apypayplatform","refundaddress");
        return "d:/apy/refundlog";
    }

    /***
     * 退款当天日期,格式为yyyy-MM-dd HH:mm:ss
     * @return
     */
    public String refound_date(){
        return AlipayUtil.currentDateTime();
    }

    /**
     * 退款批次号,格式yyyyMMdd+(3到24位的序列号)
     * @return
     */
    public String batch_no(){
        return AlipayUtil.getBatchCode();
    }





}

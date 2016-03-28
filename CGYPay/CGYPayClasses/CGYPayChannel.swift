//
//  PayWay.swift
//  CGYPay
//
//  Created by Chakery on 16/3/25.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import Foundation

public enum CGYPayChannel {
    /**
     *  微信支付
     *
     *  @param appid        appid
     *  @param partnerId    商家id
     *  @param prepayid     订单id
     *  @param nonceStr     随机字符串(防止重发)
     *  @param timeStamp    时间戳(防止重发)
     *  @param package      数据和签名
     *  @param sign         签名
     */
    case weixin(partnerId: String, prepayid: String, nonceStr: String, timeStamp: UInt32, package: String, sign: String)
    /**
     *  支付宝
     *
     *  @param orderString  订单(签名后的订单) 格式如下: partner="2088101568358171"&seller_id="xxx@alipay.com"&out_trade_no="0819145412-6177"&subject="测试"&body="测试测试"&total_fee="0.01"&notify_url="http://notify.msp.hk/notify.htm"&service="mobile.securitypay.pay"&payment_type="1"&_input_charset="utf-8"&it_b_pay="30m"&sign="lBBK%2F0w5LOajrMrji7DUgEqNjIhQbidR13GovA5r3TgIbNqv231yC1NksLdw%2Ba3JnfHXoXuet6XNNHtn7VE%2BeCoRO1O%2BR1KugLrQEZMtG5jmJIe2pbjm%2F3kb%2FuGkpG%2BwYQYI51%2BhA3YBbvZHVQBYveBqK%2Bh8mUyb7GM1HxWs9k4%3D"&sign_type="RSA"
     
     *  @param appScheme    应用注册scheme,在Info.plist定义URL types
     */
    case aliPay(orderString: String, appScheme: String)
}
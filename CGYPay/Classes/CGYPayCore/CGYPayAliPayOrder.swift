//
//  CGYPayAliPayOrder.swift
//  CGYPay
//
//  Created by Chakery on 16/3/31.
//  Copyright © 2016年 Chakery. All rights reserved.
//
//  支付宝支付订单

import Foundation

/**
 *  支付宝订单
 */
public struct CGYPayAliPayOrder {
     /// 商家id（以2088开头的16位纯数字组成）
    var partner: String
     /// 支付宝账号
    var seller_id: String
     /// 订单号
    var out_trade_no: String
     /// 商品名称（该参数最长为128个汉字）
    var subject: String
     /// 商品详情
    var body: String
     /// 总金额（精确到小数点后两位）
    var total_fee: String
     /// 服务器异步通知页面路径（支付宝服务器主动通知商户网站里指定的页面http路径）
    var notify_url: String
     /// 接口名称（固定值：mobile.securitypay.pay）
    var service: String
     /// 支付类型（默认值为：1（商品购买））
    var payment_type: String
     /// 参数编码字符集（固定值：utf-8）
    var _input_charset: String
     /// 签名
    var sign: String
     /// 签名方式（目前仅支持RSA）
    var sign_type: String
     /// URL types 下的 URL Scheme
    var appScheme: String
// ------------------ 以下字段可以为空 ---------------------
    /// 未付款交易的超时时间
    var it_b_pay: String?
    /// appid
    var app_id: String?
    /// 客户端来源
    var appenv: String?
    /// 商品类型
    var goods_type: String?
    /// 是否发起实名校验
    var rn_check: String?
    /// 授权令牌
    var extern_token: String?
    /// 商户业务扩展参数
    var out_context: String?
    
    init (partner: String, seller_id: String, out_trade_no: String, subject: String, body: String, total_fee: String, notify_url: String, payment_type: String = "1", sign: String, appScheme: String) {
        self.partner = partner
        self.seller_id = seller_id
        self.out_trade_no = out_trade_no
        self.subject = subject
        self.body = body
        self.total_fee = total_fee
        self.notify_url = notify_url
        self.service = "mobile.securitypay.pay"
        self.payment_type = payment_type
        self._input_charset = "utf-8"
        self.sign = sign
        self.sign_type = "RSA"
        self.appScheme = appScheme
    }
}

extension CGYPayAliPayOrder {
    /**
     把参数拼接成订单字符串
     
     - returns: 调起支付的订单字符串
     */
    public func toOrderString() -> String {
        var orderstring = "partner=\"\(partner)\"&seller_id=\"\(seller_id)\"&out_trade_no=\"\(out_trade_no)\"&subject=\"\(subject)\"&body=\"\(body)\"&total_fee=\"\(total_fee)\"&notify_url=\"\(notify_url)\"&service=\"\(service)\"&payment_type=\"\(payment_type)\"&_input_charset=\"\(_input_charset)\"&sign=\"\(sign)\"&sign_type=\"\(sign_type)\""
        
        if let it_b_pay = it_b_pay {
            orderstring += "&it_b_pay=\"\(it_b_pay)\""
        }
        if let app_id = app_id {
            orderstring += "&app_id=\"\(app_id)\""
        }
        if let appenv = appenv {
            orderstring += "&appenv=\"\(appenv)\""
        }
        if let goods_type = goods_type {
            orderstring += "&goods_type=\"\(goods_type)\""
        }
        if let rn_check = rn_check {
            orderstring += "&rn_check=\"\(rn_check)\""
        }
        if let extern_token = extern_token {
            orderstring += "&extern_token=\"\(extern_token)\""
        }
        if let out_context = out_context {
            orderstring += "&out_context=\"\(out_context)\""
        }
        
        return orderstring
    }
}
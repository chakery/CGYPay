//
//  CGYPayWxOrder.swift
//  CGYPay
//
//  Created by Chakery on 16/3/31.
//  Copyright © 2016年 Chakery. All rights reserved.
//
//  微信支付订单

import Foundation

/**
 *  微信订单
 */
public struct CGYPayWxOrder {
     /// 商家id
    public var partnerId: String
     /// 订单id
    public var prepayid: String
     /// 随机字符串
    public var nonceStr: String
     /// 时间戳
    public var timeStamp: UInt32
     /// 扩展字段
    public var package: String
     /// 签名
    public var sign: String
    
    public init(partnerId: String, prepayid: String, nonceStr: String, timeStamp: UInt32, package: String, sign: String) {
        self.partnerId = partnerId
        self.prepayid = prepayid
        self.nonceStr = nonceStr
        self.timeStamp = timeStamp
        self.package = package
        self.sign = sign
    }
}
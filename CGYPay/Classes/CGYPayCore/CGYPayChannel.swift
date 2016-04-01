//
//  PayWay.swift
//  CGYPay
//
//  Created by Chakery on 16/3/25.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import Foundation
/**
 支付通道
 
 - weixin: 微信支付
 - aliPay: 支付宝支付
 - upPay:  银联支付
 */
public enum CGYPayChannel {
    /**
     *  微信支付
     *
     *  @param CGYPayWxOrder 订单
     */
    case weixin(order: CGYPayWxOrder)
    /**
     *  支付宝
     *
     *  @param CGYPayAliPayOrder 订单
     */
    case aliPay(order: CGYPayAliPayOrder)
    
    /**
     *  银联支付
     *
     *  @param CGYPayUpOrder 订单
     */
    case upPay(order: CGYPayUpOrder)
}
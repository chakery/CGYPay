//
//  CGYPay.swift
//  CGYPay
//
//  Created by Chakery on 16/3/26.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import Foundation

class CGYPay: NSObject {
    /**
     调起支付
     
     - parameter channel:  支付渠道
     - parameter callBack: 支付回调
     */
    class func createPayment(channel: CGYPayChannel, callBack: CGYPayCompletedBlock) {
        switch channel {
        case .weixin:
            CGYPayWxService.sharedCGYPayWxService.sendWxPay(channel, callBack: callBack)
        case .aliPay:
            CGYPayAliService.sharedCGYPayAliService.sendAliPay(channel, callBack: callBack)
        case .upPay:
            CGYPayUPService.sharedCGYPayUPService.sendUPPay(channel, callBack: callBack)
        }
    }
    
    
    class func handlerOpenURL(url: NSURL) -> Bool {
        CGYPayWxService.sharedCGYPayWxService.handleOpenURL(url)
        CGYPayAliService.sharedCGYPayAliService.handleOpenURL(url)
        CGYPayUPService.sharedCGYPayUPService.handleOpenURL(url)
        return true
    }
}
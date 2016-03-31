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
            if let wxPay = wxPay {
                wxPay.sendPay(channel, callBack: callBack)
            }
        case .aliPay:
            if let aliPay = aliPay {
                aliPay.sendPay(channel, callBack: callBack)
            }
        case .upPay:
            if let unPay = unPay {
                unPay.sendPay(channel, callBack: callBack)
            }
        }
    }
    
    
    class func handlerOpenURL(url: NSURL) -> Bool {
        if let wxPay = wxPay {
            wxPay.handleOpenURL(url)
        }
        if let aliPay = aliPay {
            aliPay.handleOpenURL(url)
        }
        if let unPay = unPay {
            unPay.handleOpenURL(url)
        }
        return true
    }
    
    // 银联支付
    private static var unPay: BaseCGYPay? = {
        let upPayType = NSObject.cgy_classFromString("CGYPayUPService") as? BaseCGYPay.Type
        return upPayType?.sharedInstance
    }()
    // 微信支付
    private static var wxPay: BaseCGYPay? = {
        let wxPayType = NSObject.cgy_classFromString("CGYPayWxService") as? BaseCGYPay.Type
        return wxPayType?.sharedInstance
    }()
    // 支付宝支付
    private static var aliPay: BaseCGYPay? = {
        let aliPayType = NSObject.cgy_classFromString("CGYPayAliService") as? BaseCGYPay.Type
        return aliPayType?.sharedInstance
    }()
}
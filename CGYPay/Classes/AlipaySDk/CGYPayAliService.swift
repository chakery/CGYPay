//
//  CGYPayAliPay.swift
//  CGYPay
//
//  Created by Chakery on 16/3/26.
//  Copyright © 2016年 Chakery. All rights reserved.
//
//  支付宝

import Foundation

class CGYPayAliService: BaseCGYPay {
    var payCallBack: CGYPayCompletedBlock?
    private static let _sharedInstance = CGYPayAliService()
    override class var sharedInstance: CGYPayAliService {
        print("支付宝 初始化")
        return _sharedInstance
    }
    
    // 发送支付宝支付
    override func sendPay(channel: CGYPayChannel, callBack: CGYPayCompletedBlock) {
        payCallBack = callBack
        if case .aliPay(let order) = channel {
            AlipaySDK.defaultService().payOrder(order.toOrderString(), fromScheme: order.appScheme, callback: { [unowned self] resultDic in
                if let dic = resultDic as? [String:AnyObject] {
                    let payStatus = self.aliPayResultHandler(dic)
                    self.payCallBack?(status: payStatus)
                }
            })
        }
    }
    
    /**
     从支付宝返回到app
     
     - parameter url: url
     */
    override func handleOpenURL(url: NSURL) {
        guard url.host == "safepay" || url.host == "platformapi" else { return }
        AlipaySDK.defaultService().processOrderWithPaymentResult(url, standbyCallback: { [unowned self] resultDic in
            if let dic = resultDic as? [String:AnyObject] {
                let payStatus = self.aliPayResultHandler(dic)
                self.payCallBack?(status: payStatus)
            }
        })
    }
    
    /**
     支付宝支付返回的结果处理
     
     - parameter resultDic: 支付宝返回的结果
     
     - returns: 返回处理结果
     */
    private func aliPayResultHandler(resultDic: [String:AnyObject]) -> CGYPayStatusCode {
        var payStatus: CGYPayStatusCode
        switch resultDic["resultStatus"]!.intValue {
        case 9000:
            payStatus = CGYPayStatusCode.PaySuccess(wxPayResult: nil, aliPayResult: resultDic["result"]?.stringValue, upPayResult: nil)
        case 8000:
            payStatus = CGYPayStatusCode.PayProcessing
        case 4000:
            payStatus = CGYPayStatusCode.PayErrPayFail
        case 6001:
            payStatus = CGYPayStatusCode.PayErrCodeUserCancel
        case 6002:
            payStatus = CGYPayStatusCode.PayErrNetWorkFail
        default:
            payStatus = CGYPayStatusCode.PayErrUnKnown
        }
        return payStatus
    }
}
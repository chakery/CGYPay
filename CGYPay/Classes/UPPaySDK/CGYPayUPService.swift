//
//  CGYPayUPService.swift
//  CGYPay
//
//  Created by Chakery on 16/3/28.
//  Copyright © 2016年 Chakery. All rights reserved.
//
//  银联支付

import Foundation

class CGYPayUPService: BaseCGYPay {
    private var payCallBack: CGYPayCompletedBlock?
    private static let _sharedInstance = CGYPayUPService()
    override class var sharedInstance: CGYPayUPService {
        print("银联初始化")
        return _sharedInstance
    }
    
    override func sendPay(channel: CGYPayChannel, callBack: CGYPayCompletedBlock) {
        payCallBack = callBack
        if case .upPay(let order) = channel {
            if let rootViewControl = UIApplication.sharedApplication().keyWindow?.rootViewController {
                UPPaymentControl.defaultControl().startPay(order.tn, fromScheme: order.appScheme, mode: order.mode, viewController: rootViewControl)
            } else {
                payCallBack?(status: CGYPayStatusCode.PayErrUnKnown)
            }
        }
    }
    
    override func handleOpenURL(url: NSURL) {
        guard "uppayresult" == url.host else { return }
        UPPaymentControl.defaultControl().handlePaymentResult(url) { [unowned self] stringCode, resultDic in
            switch stringCode {
            case "success":
                self.payCallBack?(status: CGYPayStatusCode.PaySuccess(wxPayResult: nil, aliPayResult: nil, upPayResult: resultDic as! [String:AnyObject]?))
            case "cancel":
                self.payCallBack?(status: CGYPayStatusCode.PayErrCodeUserCancel)
            case "fail":
                self.payCallBack?(status: CGYPayStatusCode.PayErrPayFail)
            default:
                self.payCallBack?(status: CGYPayStatusCode.PayErrUnKnown)
            }
        }
    }
    
}
//
//  CGYPayUPService.swift
//  CGYPay
//
//  Created by Chakery on 16/3/28.
//  Copyright © 2016年 Chakery. All rights reserved.
//
//  银联支付

import Foundation

class CGYPayUPService: NSObject {
    private static let sharedInstance = CGYPayUPService()
    private var payCallBack: CGYPayCompletedBlock?
    class var sharedCGYPayUPService: CGYPayUPService {
        return sharedInstance
    }
    
    func sendUPPay(channel: CGYPayChannel, callBack: CGYPayCompletedBlock) {
        payCallBack = callBack
        if case .upPay(let tn, let appScheme, let mode) = channel {
            if let rootViewControl = UIApplication.sharedApplication().keyWindow?.rootViewController {
                UPPaymentControl.defaultControl().startPay(tn, fromScheme: appScheme, mode: mode, viewController: rootViewControl)
            } else {
                payCallBack?(status: CGYPayStatusCode.PayErrUnKnown)
            }
        }
    }
    
    func handleOpenURL(url: NSURL) {
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

/*
 CFNetwork.framework
 ＳystemConfiguration.framework
 libz
 
 允许URL Scheme白名单:
 uppaysdk
 uppaywallet
 uppayx1
 uppayx2
 uppayx3
 
 
 
 */
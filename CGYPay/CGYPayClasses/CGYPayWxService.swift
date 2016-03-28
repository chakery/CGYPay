//
//  WXAPIService.swift
//  CGYPay
//
//  Created by Chakery on 16/3/25.
//  Copyright © 2016年 Chakery. All rights reserved.
//
//  微信支付

import Foundation

class CGYPayWxService: NSObject, WXApiDelegate {
    private static let sharedInstance: CGYPayWxService = CGYPayWxService()
    var payCallBack: CGYPayCompletedBlock?
    class var sharedCGYPayWxService: CGYPayWxService {
        return sharedInstance
    }
    
    func onReq(req: BaseReq!) {
        print(req)
    }
    
    func onResp(resp: BaseResp!) {
        // 微信支付
        if resp is PayResp {
            payResponseParse(resp as! PayResp)
        }
        // 其他微信的响应, 可以在这里添加...
    }
    
    // 发送微信支付
    func sendWxPay(channel: CGYPayChannel, callBack: CGYPayCompletedBlock) {
        if case .weixin(let partnerId, let prepayid, let nonceStr, let timeStamp, let package, let sign)  = channel {
            guard WXApi.isWXAppInstalled() else {
                callBack(status: .PayErrWxUnInstall)
                return
            }
            let req = PayReq()
            req.partnerId = partnerId
            req.prepayId = prepayid
            req.nonceStr = nonceStr
            req.timeStamp = timeStamp
            req.package = package
            req.sign = sign
            WXApi.sendReq(req)
            payCallBack = callBack
        }
    }
    
    /**
     从微信客户端返回
     
     - parameter url: url
     */
    func handleOpenURL(url: NSURL) {
        WXApi.handleOpenURL(url, delegate: self)
    }
    
    // 处理支付结果
    private func payResponseParse(payResp: PayResp) {
        var payStatus: CGYPayStatusCode
        switch WXErrCode(payResp.errCode) {
        case WXSuccess:
            payStatus = CGYPayStatusCode.PaySuccess(wxPayResult: payResp.returnKey, aliPayResult: nil, upPayResult: nil)
        case WXErrCodeUserCancel:
            payStatus = CGYPayStatusCode.PayErrCodeUserCancel
        case WXErrCodeSentFail:
            payStatus = CGYPayStatusCode.PayErrSentFail
        case WXErrCodeAuthDeny:
            payStatus = CGYPayStatusCode.PayErrAuthDeny
        case WXErrCodeUnsupport:
            payStatus = CGYPayStatusCode.PayErrWxUnsupport
        default:
            payStatus = CGYPayStatusCode.PayErrUnKnown
        }
        payCallBack?(status: payStatus)
    }
}

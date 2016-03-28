//
//  CGYPayConstant.swift
//  CGYPay
//
//  Created by Chakery on 16/3/26.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import Foundation

public enum CGYPayStatusCode {
    /**
     *  支付成功
     *
     *  @param wxPayResult  微信支付结果
     *  @param aliPayResult 支付宝支付结果
     *  @param upPayResult  银联支付结果
     *
     *  @return 返回支付结果
     */
    case PaySuccess(wxPayResult: String?, aliPayResult: String?, upPayResult: [String:AnyObject]?)
    /// 正在处理
    case PayProcessing
    /// 用户取消支付
    case PayErrCodeUserCancel
    /// 发送失败
    case PayErrSentFail
    /// 授权失败
    case PayErrAuthDeny
    /// 支付失败
    case PayErrPayFail
    /// 微信不支持
    case PayErrWxUnsupport
    /// 未安装微信
    case PayErrWxUnInstall
    /// 网络错误
    case PayErrNetWorkFail
    /// 未知错误
    case PayErrUnKnown
}

/// 支付回调
typealias CGYPayCompletedBlock = (status: CGYPayStatusCode) -> Void


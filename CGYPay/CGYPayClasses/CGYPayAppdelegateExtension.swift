//
//  CGYAppdelegateExtension.swift
//  CGYPay
//
//  Created by Chakery on 16/3/25.
//  Copyright © 2016年 Chakery. All rights reserved.
//
import UIKit

extension AppDelegate {
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return WXApi.handleOpenURL(url, delegate: CGYPayWxService.sharedCGYPayWxService)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        // 微信回调
        CGYPayWxService.sharedCGYPayWxService.handleOpenURL(url)
        // 支付宝回调
        CGYPayAliService.sharedCGYPayAliService.handleOpenURL(url)
        return true
    }
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        // 微信回调
        CGYPayWxService.sharedCGYPayWxService.handleOpenURL(url)
        // 支付宝回调
        CGYPayAliService.sharedCGYPayAliService.handleOpenURL(url)
        return true
    }
}
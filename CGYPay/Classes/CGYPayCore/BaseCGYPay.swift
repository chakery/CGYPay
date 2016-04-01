//
//  BaseCGYPay.swift
//  CGYPay
//
//  Created by Chakery on 16/3/31.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import Foundation

public class BaseCGYPay: NSObject {
    private static let _sharedInstance = BaseCGYPay()
    public class var sharedInstance: BaseCGYPay {
        return _sharedInstance
    }
    
    public func handleOpenURL(url: NSURL) { }
    
    public func sendPay(channel: CGYPayChannel, callBack: CGYPayCompletedBlock) { }
    
    public func registerWxAPP(appid: String) { }
}
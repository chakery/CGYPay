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
    class var sharedInstance: BaseCGYPay {
        return _sharedInstance
    }
    
    func handleOpenURL(url: NSURL) { }
    
    func sendPay(channel: CGYPayChannel, callBack: CGYPayCompletedBlock) { }
    
    func registerWxAPP(appid: String) { }
}
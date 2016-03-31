//
//  BaseCGYPay.swift
//  CGYPay
//
//  Created by Chakery on 16/3/31.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import Foundation

class BaseCGYPay: NSObject {
    private static let _sharedInstance = BaseCGYPay()
    class var sharedInstance: BaseCGYPay {
        print("基类初始化")
        return _sharedInstance
    }
    
    func handleOpenURL(url: NSURL) { print("Base handler") }
    
    func sendPay(channel: CGYPayChannel, callBack: CGYPayCompletedBlock) { print("Base sendPay") }
}
//
//  CGYNSObjectExtension.swift
//  CGYPay
//
//  Created by Chakery on 16/3/31.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import Foundation

extension NSObject {
    class func cgy_classFromString(className: String) -> AnyClass? {
        if  let appName: String? = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
            let classStringName = "_TtC\(appName!.characters.count)\(appName!)\(className.characters.count)\(className)"
            let  cls: AnyClass? = NSClassFromString(classStringName)
            return cls
        }
        return nil
    }
}
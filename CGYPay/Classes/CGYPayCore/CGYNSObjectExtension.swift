//
//  CGYNSObjectExtension.swift
//  CGYPay
//
//  Created by Chakery on 16/3/31.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import Foundation

extension NSObject {
    /**
     swift中把字符串转换成Class对象
     
     - parameter className: 需要转换的字符串
     
     - returns: 如果转换成功，返回AnyClass，否则返回nil
     */
    class func cgy_classFromString(className: String) -> AnyClass? {
        //if  let appName: String? = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
            //let classStringName = "_TtC\(appName!.characters.count)\(appName!)\(className.characters.count)\(className)"
            //let  cls: AnyClass? = NSClassFromString(classStringName)
            //return cls
        //}
        
        let appName = "Pods"
        let classStringName = "_TtC\(appName.characters.count)\(appName)\(className.characters.count)\(className)"
        let  cls: AnyClass? = NSClassFromString(classStringName)
        return cls
    }
}
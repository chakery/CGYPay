//
//  ViewController.swift
//  CGYPay
//
//  Created by Chakery on 16/3/25.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 微信支付
    @IBAction func wxPayHandler(sender: AnyObject) {
        // 关于微信请求参数https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=9_12&index=2
        let channel = CGYPayChannel.weixin(
                                     partnerId: "", //商家id
                                     prepayid: "", //预支付订单id
                                     nonceStr: "", //随机字符串
                                     timeStamp: 1459014554, //时间戳
                                     package: "Sign=WXpay", //固定值
                                     sign: "") //签名

        CGYPay.createPayment(channel) { status in
            switch status {
            case .PaySuccess(let wxPayResult, _):
                print("支付成功: \(wxPayResult)")
            default:
                print("支付失败")
            }
        }
    }
    
    // 支付宝支付
    @IBAction func aliPayHandler(sender: AnyObject) {
        // 关于orderStr参数 https://doc.open.alipay.com/doc2/detail?treeId=59&articleId=103663&docType=1
        
        let orderStr = "partner=\"2088101568358171\"&seller_id=\"xxx@alipay.com\"&out_trade_no=\"0819145412-6177\"&subject=\"我是测试数据标题\"&body=\"我时测试数据商品描述\"&total_fee=\"0.01\"&notify_url=\"http://www.xxx.com\"&service=\"mobile.securitypay.pay\"&payment_type=\"1\"&_input_charset=\"utf-8\"&it_b_pay=\"30m\"&show_url=\"m.alipay.com\"&sign=\"lBBK%2F0w5LOajrMrji7DUgEqNjIhQbidR13GovA5r3TgIbNqv231yC1NksLdw%2Ba3JnfHXoXuet6XNNHtn7VE%2BeCoRO1O%2BR1KugLrQEZMtG5jmJIe2pbjm%2F3kb%2FuGkpG%2BwYQYI51%2BhA3YBbvZHVQBYveBqK%2Bh8mUyb7GM1HxWs9k4%3D\"&sign_type=\"RSA\""
        
        let channel = CGYPayChannel.aliPay(orderString: orderStr, appScheme: "com.ccggyy.CGYPay")
        
        CGYPay.createPayment(channel) { status in
            switch status {
            case .PaySuccess(_, let aliPayResult):
                print("支付成功: \(aliPayResult)")
            default:
                print("支付失败")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


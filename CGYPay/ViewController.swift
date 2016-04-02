//
//  ViewController.swift
//  CGYPay
//
//  Created by Chakery on 16/3/25.
//  Copyright © 2016年 Chakery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //************************************ 微信支付 ************************************
    @IBAction func wxPayHandler(sender: AnyObject) {
        // 关于微信请求参数https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=9_12&index=2
        
        let order = CGYPayWxOrder(partnerId: "商家id", prepayid: "预支付订单id", nonceStr: "随机字符串", timeStamp: 111111111, package: "扩展字段", sign: "签名")
        
        CGYPay.createPayment(.weixin(order: order)) { status in
            switch status {
            case .PaySuccess(let wxPayResult, _, _):
                print("支付成功: \(wxPayResult)")
            default:
                print("支付失败")
            }
        }
    }
    
    //************************************ 支付宝支付 ************************************
    @IBAction func aliPayHandler(sender: AnyObject) {
        // 关于orderStr参数 https://doc.open.alipay.com/doc2/detail?treeId=59&articleId=103663&docType=1
        
        let order = CGYPayAliPayOrder(partner: "商家id", seller_id: "商家支付宝账号", out_trade_no: "订单id", subject: "商品标题", body: "商品描述", total_fee: "总价格", notify_url: "url回调", sign: "签名", appScheme: "com.ccggyy.cgypay")
        
        CGYPay.createPayment(.aliPay(order: order)) { status in
            switch status {
            case .PaySuccess(_, let aliPayResult, _):
                print("支付成功: \(aliPayResult)")
            default:
                print("支付失败")
            }
        }
    }
    
    //************************************ 银联支付 ************************************
    @IBAction func upPayHandler(sender: AnyObject) {
        /*
                            测试用例
         
            获取测试订单号  http://101.231.204.84:8091/sim/getacptn
         
             招商银行借记卡：6226090000000048
             手机号：18100000000
             密码：111101
             短信验证码：123456（先点获取验证码之后再输入）
             证件类型：01身份证
             证件号：510265790128303
             姓名：张三
         
             华夏银行贷记卡：6226388000000095
             手机号：18100000000
             CVN2：248
             有效期：1219
             短信验证码：123456（先点获取验证码之后再输入）
             证件类型：01身份证
             证件号：510265790128303
             姓名：张三
         */
        
        let order = CGYPayUpOrder(tn: "201603311049141648338", appScheme: "com.ccggyy.cgypay", mode: "01", viewController: self)
        
        CGYPay.createPayment(.upPay(order: order)) { status in
            switch status {
            case .PaySuccess(_, _, let upPayResult):
                print("银联支付成功: \(upPayResult)")
            default:
                print("银联支付失败")
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


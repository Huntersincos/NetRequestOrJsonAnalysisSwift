//
//  ViewController.swift
//  NetRequestOrJsonAnalysisSwift
//
//  Created by wenze on 2018/10/29.
//  Copyright © 2018年 wenze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SWURLSessionManger.shareSessionManger.swReqeust(method: SWURLRequestMethod.GET, urlString: "https://www.gx.10086.cn/zt-hzg/zt/openapi/getNavJsonHzgYM/7623B57CB225A8EF8455FE4D0563D60C67F958FC8F8AFFF74A7309C28043F5D7/1534210920448", parameters:nil,completed: { (json:AnyObject?, isSuccess:Bool) in
            print("json=\(String(describing: json))")
           
         
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


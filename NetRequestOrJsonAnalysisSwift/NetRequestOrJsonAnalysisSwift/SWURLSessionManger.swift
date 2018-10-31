//
//  SWURLSessionManger.swift
//  NetRequestOrJsonAnalysisSwift
//
//  Created by wenze on 2018/10/30.
//  Copyright © 2018年 wenze. All rights reserved.
//

import UIKit
import AFNetworking
enum SWURLRequestMethod {
    case GET
    case POST
}

class SWURLSessionManger: AFHTTPSessionManager {
    
  static let shareSessionManger:SWURLSessionManger = { () -> SWURLSessionManger in
    let manager = SWURLSessionManger()
    //manager.responseSerializer.acceptableContentTypes?.insert("text/plain")
    manager.responseSerializer = AFHTTPResponseSerializer.init()
    manager.requestSerializer.timeoutInterval = 30
    return manager
     }()
    /**
     * param method:请求方式 默认GET
     * param urlString:请求地址
     * param parameters:参数
     * completed:回调结果
     @author wenze
    **/
    func swReqeust(method:SWURLRequestMethod = .GET ,urlString:String,parameters:[String:AnyObject]?,completed:@escaping((_ json:AnyObject?,_ isSuccess:Bool)->())){
        /** 成功回调闭包 */
        let success = {
            (task:URLSessionTask?,json:Any?)->() in completed(json as AnyObject,true)
        }
        /** 失败回调闭包*/
        let failure = {
            (task:URLSessionTask?,json:Any?)->() in completed(json as AnyObject,false)
        }
        /** 请求*/
        if method == .GET {
          get(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }else{
          post(urlString, parameters: parameters, progress: nil, success: success, failure:failure)
        }
    }
 
    
    
}

//
//  Request.swift
//  POP协议编程
//
//  Created by 刘通超 on 2017/3/3.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

enum HTTPMethod: String {
    case GET
    case POST
}

protocol RequestIF {
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String] { get }
    var param: [String: Any] { get }
    
    associatedtype response: ResponseSerializer
}

extension RequestIF{
    var header: [String:String]{
        return ["Accept":"application/json",
                "Content-Type":"application/json; charset=utf-8"]
    }
    
    var method: HTTPMethod{
        return HTTPMethod.POST
    }
}

protocol ResponseSerializer{
    var Code:Int!{get}
    var Message:String!{get}
    
    static func parse(value:String) -> Self
}

protocol RequestClientIF {
    var host: String { get }
    func send<T:RequestIF>(req:T) -> Observable<T.response>

}

extension RequestClientIF{
    var host: String{
        return ApiHost
    }
}

struct NetClient: RequestClientIF{
    static var shared = NetClient()
    
    func send<T : RequestIF>(req: T) -> Observable<T.response> {
        
        let result = PublishSubject<T.response>()
        
        Alamofire.request(host.appending(req.path), method: .post, parameters: req.param, encoding: JSONEncoding.default, headers: req.header).responseString { (response) in
            DebugPrint("🌎地址:")
            DebugPrint("\(self.host)\(req.path)")
            DebugPrint("📃参数:")
            DebugPrint(req.param)
            DebugPrint("🍎结果:")
            DebugPrint(response)

            if response.result.isSuccess {
                let temp = T.response.parse(value: response.value!)
                guard temp.Code != nil else{
                    let mess = temp.Message == nil ? "API Error" : temp.Message as Any
                    let error = NSError.init(domain: "API Error", code: 502, userInfo: ["Message":mess])
                    result.onError(error)

                    return
                }
                result.onNext(temp)
            }else{
                //网络请求出错提示
                DebugPrint("❗️❗️❗️Request Error❗️")
                result.onError(response.result.error!)
            }
            
        }
        return result.asObservable()
    }
    
}



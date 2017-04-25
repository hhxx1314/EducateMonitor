//
//  LoginModel.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/21.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import Foundation
import HandyJSON
import RxSwift
import RxCocoa
struct LoginModel:ResponseSerializer,HandyJSON {
    var Code: Int!
    var Message: String!
    
    static func parse(value: String) -> LoginModel {
        
        return LoginModel.deserialize(from: value)!
    }
}

struct LoginViewModel {
    static func login(account acc:String, pwd:String) -> Observable<LoginModel> {
        let request = LoginRequest.init(para: ["account":acc,"pwd":pwd])
        return NetClient.shared.send(req: request)
    }
}


//
//  RequestInstance.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/13.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import Foundation

struct PhoneCodeRequest: RequestIF {
    
    var param: [String : Any] = [:]
    var path: String = apiFace("CheckAppVersion")
    
    init(para:[String:Any]) {
        param = para
    }
    
    typealias response = Test
}

struct LoginRequest:RequestIF {
    
    var param: [String : Any] = [:]
    var path: String = apiFace("")
    
    typealias response = LoginModel
    
    init(para:[String:Any]) {
        param = para
    }
}

struct RegisterRequest: RequestIF {
    var path: String = apiFace("")
    var param: [String : Any] = [:]
    typealias response = RegisterModel
    
    init(para:[String:Any]) {
        param = para
    }
}


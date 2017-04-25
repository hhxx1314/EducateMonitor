//
//  UserMessage.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/13.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import Foundation
import HandyJSON

struct Test: HandyJSON, ResponseSerializer{
    var Code: Int!
    var Message: String!
    var IsAutoUpdate: Bool!
    var version_path: String!
    var version_desc: String!
    var version_name: String!
    var version_code: String!

    static func parse(value: String) -> Test {
        return Test.deserialize(from: value)!
    }
}

struct RegisterModel:ResponseSerializer, HandyJSON {
    var Code: Int!
    var Message: String!
    
    static func parse(value: String) -> RegisterModel {
        
        return RegisterModel.deserialize(from: value)!
    }
}

struct CheckUpdateTool {
    static func checkAppVersion(){
    
    }
}


//
//  RequestUrl.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/14.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import Foundation

#if DEBUG //MARK: 测试地址
    
//let ApiHost = "http://172.16.2.80"
let ApiHost = "http://fd.51sprint.com"

#else //MARK: 生产地址
    
let ApiHost = "http://fd.51sprint.com"
    
#endif


func apiFace(_ detail: String) -> String{
    return "/api/AfFace/\(detail)"
}

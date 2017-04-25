//
//  LocalNetClient.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/15.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import Foundation

struct LocalNetClient: RequestClientIF{
    static var shared = LocalNetClient()
    
    func send<T : RequestIF>(r: T, handler: @escaping (T.response?) -> Void) {
        
        switch r.path {
        case "/api/AfFace/CheckAppVersion":
            guard let fileURL = Bundle(for: LocalRequestTests.self).url(forResource: "check_update.json", withExtension: "") else {
                fatalError()
            }
            guard let data = try? Data(contentsOf: fileURL) else {
                fatalError()
            }
            let resStr = String.init(data: data, encoding: .utf8)
            let res = T.response.parse(value: resStr!)
            handler(res)
            
            break
            
        default: break
            
        }
    }
}

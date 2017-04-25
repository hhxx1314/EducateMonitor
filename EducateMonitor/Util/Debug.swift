//
//  Debug.swift
//  LeChongCi
//
//  Created by 刘通超 on 2016/12/27.
//  Copyright © 2016年 刘通超. All rights reserved.
//

import Foundation

func DebugPrint(_ items: Any?){
    #if DEBUG
        if items != nil {
            print(items!)
        }
    #endif
}

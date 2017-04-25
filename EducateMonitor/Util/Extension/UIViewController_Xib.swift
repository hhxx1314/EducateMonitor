//
//  UIViewController_Xib.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/13.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //MARK: 从xib 获取controller 实例
    static func instanceNib() ->Self{
        return self.init(nibName:"\(self)", bundle:nil)
    }
}

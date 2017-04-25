//
//  UIViewController_Activity.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/14.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController{
    
    //MARK: Toast
    func showToast(_ info:String) {
        LCToastView.createToast(info: info, view: self.view).show()
    }
    
    //MARK: Activity
    func showActivityDefaut() {
        let textFont = UIFont.systemFont(ofSize: 14)
        let activityData = ActivityData(messageFont:textFont, type:.ballClipRotateMultiple)
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func hiddenActivity() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
}

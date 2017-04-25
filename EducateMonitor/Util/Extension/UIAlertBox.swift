//
//  UIAlertBox.swift
//  LeChongCi
//
//  Created by 刘通超 on 16/6/6.
//  Copyright © 2016年 刘通超. All rights reserved.
//

import UIKit

extension UIAlertController{
    
    class func alert(title:String, mes:String, btns:[String], showCtr:UIViewController, tapIndex:@escaping (Int) -> Void){
        let alert = alertController(title: title, mes: mes, style: .alert, btns: btns) { (index) in
            tapIndex(index)
        }
        
        showCtr.presentVC(alert)
    }
    
    class func actionSheet(title:String, mes:String?, btns:[String], tapIndex:@escaping (Int) -> Void) -> UIAlertController{
        let alert = alertController(title: title, mes: mes, style: .actionSheet, btns: btns) { (index) in
            tapIndex(index)
        }
        return alert
    }
    

    class func alertController(title:String, mes:String?, style:UIAlertControllerStyle, btns:[String], tapIndex:@escaping (Int) -> Void) -> UIAlertController{
        let alert = UIAlertController.init(title: title, message: mes, preferredStyle: style)
        
        for temp in btns {
            alert.addAction(UIAlertAction.init(title: temp, style: UIAlertActionStyle.default, handler: { (action) in
                let index = btns.index(of: action.title!)
                tapIndex(index!)
            }))

        }
        
        return alert
    }
}

fileprivate extension UIViewController{
    func presentVC(_ vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
}

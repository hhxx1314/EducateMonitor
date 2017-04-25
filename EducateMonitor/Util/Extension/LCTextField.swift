//
//  LCTextField.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/21.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit

class LCTextField: UITextField {
    
    var recordBottom: CGFloat?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.enablesReturnKeyAutomatically = true
        self.returnKeyType = .done
        
        recordBottom = self.bottom
        
        self.delegate = self;
    }
    
    fileprivate func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(LCTextField.keyboardWillShow(notifi:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LCTextField.keyboardWillHidden(notifi:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    fileprivate func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(notifi: Notification) {
        let info = notifi.userInfo
        let keyValue = info?["UIKeyboardFrameEndUserInfoKey"]
        let keyRect = keyValue as! CGRect
        
        transformView(keyRect: keyRect)
    }
    func keyboardWillHidden(notifi: Notification) {
        transFormInitial()
    }
    
    
    private func transformView(keyRect:CGRect) {
        let rootView = self.getTopSuperView()
        let keyRectY = keyRect.origin.y
        
        if self.recordBottom == nil {
            return
        }
        
        if self.recordBottom! > keyRectY {
            let rootY = keyRectY - self.recordBottom!
    
            if rootView.bottom + rootY < keyRectY {
                UIView.animate(withDuration: 0.25, animations: { 
                    rootView.bottom = keyRectY
                })
            }else{
                UIView.animate(withDuration: 0.25, animations: {
                    rootView.y = keyRectY - self.recordBottom!
                })
            }
        }
    }
    
    private func transFormInitial(){
        let rootView = self.getTopSuperView()
        UIView.animate(withDuration: 0.25, animations: {
            rootView.frame = rootView.bounds
        })
    }

}

extension LCTextField:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.recordBottom = self.bottom
        addKeyboardObserver()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        removeKeyboardObserver()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return true
    }
}

fileprivate extension UIView{
    func getTopSuperView() -> UIView {
        var topView = self.superview
        if topView == nil {
            topView = self
        }else{
            while topView?.superview != nil {
                topView = topView?.superview
            }
        }
        
        return topView!
    }
}

//
//  LCToastView.swift
//  TestToast
//
//  Created by 刘通超 on 2017/3/22.
//  Copyright © 2017年 Mifit. All rights reserved.
//
import UIKit

fileprivate let ToastViewHeight = 35
fileprivate var ToastViewWidth = 320
fileprivate let ToastFontSize = 15
fileprivate let ToastCornerRadius = 5
fileprivate let ToastAnimateTime = 0.3
fileprivate let ToastShowTime = 1.5

fileprivate let ToastBackColor = UIColor.black

class LCToastView: UIView {
    //MARK: init
    class func createToast(info: String, view:UIView) -> LCToastView {
        ToastViewWidth = Int(view.frame.size.width)
        let rect = CGRect.init(x: 0, y: 0, width: ToastViewWidth, height: ToastViewHeight)
        
        let toastView = createToastView(frame: rect)
        toastView.center = CGPoint.init(x: view.frame.width/2, y: view.frame.height/2)
        toastView.alpha = 0
        view.addSubview(toastView)
        
        let infoWidth = getInfoWidth(info: info)
        
        let infoBackWidth = infoWidth+20
        let infoBack = createInfoBack(width: infoBackWidth)
        infoBack.center = CGPoint.init(x: ToastViewWidth/2, y: ToastViewHeight/2)
        toastView.addSubview(infoBack)
        
        let infoLabel = createInfoLabel(width: infoWidth)
        infoLabel.text = info
        infoLabel.center = CGPoint.init(x: ToastViewWidth/2, y: ToastViewHeight/2)
        toastView.addSubview(infoLabel)
        
        return toastView
    }
    
    //MARK: show hidden
    
    func show() {
        UIView.animate(withDuration: ToastAnimateTime) {
            self.alpha = 1
        }
        self.perform(#selector(LCToastView.hidden), with: nil, afterDelay: TimeInterval(ToastShowTime))
    }
    
    @objc fileprivate func hidden() {

        UIView.animate(withDuration: ToastAnimateTime) {
            self.alpha = 0
        }
        self.perform(#selector(LCToastView.remove), with: nil, afterDelay: ToastAnimateTime, inModes: [RunLoopMode.defaultRunLoopMode])
    }
    
    @objc fileprivate func remove() {
        self.removeFromSuperview()
    }
    
    //MARK: fileprivate meta======
    fileprivate class func createToastView(frame: CGRect) -> LCToastView{
        let toastView = LCToastView.init(frame: frame)
        
        return toastView
    }
    fileprivate class func createInfoBack(width:Int) -> UIView{
        let rect = CGRect.init(x: 0, y: 0, width: width, height: ToastViewHeight)

        let infoView = UIView.init(frame: rect)
        infoView.backgroundColor = ToastBackColor
        infoView.alpha = 0.75
        infoView.layer.masksToBounds = true
        infoView.layer.cornerRadius = CGFloat(ToastCornerRadius)
        
        return infoView
    }
    
    fileprivate class func createInfoLabel(width:Int) -> UILabel{
        let rect = CGRect.init(x: 0, y: 0, width: width, height: ToastViewHeight)
        
        let infoLable = UILabel.init(frame: rect)
        infoLable.backgroundColor = UIColor.clear
        infoLable.font = UIFont.systemFont(ofSize: CGFloat(ToastFontSize))
        infoLable.textColor = UIColor.white
        infoLable.textAlignment = .center
        
        return infoLable
    }

    
    fileprivate class func getInfoWidth(info:String) -> Int {
        let size = CGSize.init(width: ToastViewWidth, height: ToastViewHeight)
        let rect = info.boundingRect(with: size, options: NSStringDrawingOptions.truncatesLastVisibleLine, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: CGFloat(ToastFontSize))], context: nil);
        return Int(rect.width)+2
    }

}

//
//  ViewController.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/13.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        #if DEBUG
            print("DEBUG")
        #else
            print("release")
        #endif
        
//        var test = Test()
//        test.Code = 1
//        
//        var test2 = test
//        test2.Code = 2
//    
//        test.Code = 3
//        
//        DebugPrint("test\(test.Code)")
//        DebugPrint("test2\(test2.Code)")

        self.view.backgroundColor = RandomColor()
        
//        let req = PhoneCodeRequest(para:["appType":"2"])
//        NetClient.shared.send(r: req) { (test) in
//            
//            guard test != nil else{
//                return
//            }
//            
//            guard test?.Code == 1 else{
//                return
//            }
//            
//            print("code 为 1")
//            
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showActivityDefaut()
        self.perform(#selector(ViewController.hidden), with: nil, afterDelay: 4)
    }
    
    func hidden(){
        hiddenActivity()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  LoginViewController.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/20.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import EZSwiftExtensions

class LoginViewController: BaseViewController {

    let disposeBag = DisposeBag()
    @IBOutlet weak var accField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewReactive()
        
        hideKeyboardWhenTappedAround()
        
        let req = PhoneCodeRequest(para:["appType":"2"])

        NetClient.shared.send(req: req)
            .subscribe(onNext: { (checkResult) in
                let result = checkResult
                guard result.Code == 0 else{
                    DebugPrint("result:\(result.Message)")
                    return
                }
            })
            .disposed(by: disposeBag)
    
        }
    
    //MARK: Actions
    
    
    //MARK: NET
    func login(acc:String, pwd:String) {
        DebugPrint("\(acc):\(pwd)")
    }
    
    //MARK: Reactive
    func configViewReactive() {
        
        let userValid = accField.rx.text.orEmpty
            .map {
                $0.length >= 6
            }
            .shareReplay(1)
        let pwdValid = pwdField.rx.text.orEmpty
            .map { $0.length >= 6 }
       
        let userAndPwdValid = Observable.combineLatest(userValid, pwdValid) { $0 && $1 }
            .shareReplay(1)
        
        userValid
            .bindTo(pwdField.rx.isEnabled)
            .disposed(by: disposeBag)
        
        userAndPwdValid
            .bindTo(loginBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginBtn.rx.tap
            .subscribe(onNext: {[weak self] in self!.login(acc: self!.accField.text!, pwd: self!.pwdField.text!)})
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


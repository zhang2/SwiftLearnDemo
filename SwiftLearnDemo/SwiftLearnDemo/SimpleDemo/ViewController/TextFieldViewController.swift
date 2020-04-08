//
//  ViewController.swift
//  SwiftLearnDemo
//
//  Created by apple on 4/7/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import RxSwift

class TextFieldViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var tipslabel: UILabel!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordTips: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    let MaxLength: Int = 5
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindRx()
    }
}

extension TextFieldViewController {
    
    private func bindRx() {
        let nameVaild = nameText.rx.text.orEmpty.map {
            $0.count >= self.MaxLength
        }.share(replay: 1, scope: .whileConnected)
        
        nameVaild.bind(to: passwordText.rx.isEnabled).disposed(by: disposeBag)
        
        nameVaild.bind(to: tipslabel.rx.isHidden).disposed(by: disposeBag)
        
        let passwordVaild = passwordText.rx.text.orEmpty.map {
            $0.count >= self.MaxLength
        }.share(replay: 1, scope: .forever)
        
        passwordVaild.bind(to: passwordTips.rx.isHidden).disposed(by: disposeBag)
        
        let allthignVaild = Observable.combineLatest(nameVaild, passwordVaild) {
            $0 && $1
        }
        allthignVaild.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        
        loginButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.nameText.resignFirstResponder()
            self?.passwordText.resignFirstResponder()
            self?.showAlert()
        }).disposed(by: disposeBag)
    }
    
    func showAlert() {
        let alertViewVc = UIAlertController(title: "提示", message: "it's ok", preferredStyle: .alert)
        alertViewVc.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        self.navigationController?.present(alertViewVc, animated: true, completion: nil)
    }
}



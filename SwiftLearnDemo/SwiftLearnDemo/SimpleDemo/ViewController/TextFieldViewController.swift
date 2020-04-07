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
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var tipslabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    let MaxLength: Int = 10
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindRx()
    }
}

extension TextFieldViewController {
    private func bindRx() {
        
        self.loginButton.rx.tap.subscribe(onNext: {
            
        }).disposed(by: disposeBag)
    }
}



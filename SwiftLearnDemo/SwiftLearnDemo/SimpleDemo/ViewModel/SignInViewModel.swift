//
//  SignInViewModel.swift
//  SwiftLearnDemo
//
//  Created by apple on 4/7/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import RxSwift

class SignInViewModel {
    
    // MARK: - input
    
    let username: BehaviorRelay<String> = BehaviorRelay(value: "")
    let password: BehaviorRelay<String> = BehaviorRelay(value: "")
    // MARK: - output
    let signInEnabled: Driver<Bool>
    let tipsIsShow: Driver<Bool>
    
    init(username: BehaviorRelay<String>, password: BehaviorRelay<String>) {
        
        signInEnabled = Driver.combineLatest(username.asDriver(), password.asDriver(), resultSelector: { (username, password) in
            return username.isEmpty || password.isEmpty
            }).distinctUntilChanged()
        
        tipsIsShow =  Driver.combineLatest(username.asDriver(), password.asDriver(), resultSelector: { (username, password) in
                   return username.isEmpty || password.isEmpty
            }).distinctUntilChanged()

    }
    
}

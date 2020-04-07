//
//  SignInViewModel.swift
//  SwiftLearnDemo
//
//  Created by apple on 4/7/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

class SignInViewModel {
    
    let username: BehaviorRelay<String>
    let password: BehaviorRelay<String>
    
    let signInEnabled: Driver<Bool>
    let tipsIsShow: Driver<Bool>
}

//
//  ViewModel.swift
//  SwiftLearnDemo
//
//  Created by apple on 4/13/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift

struct CustomData {
    var role: String
    var forceValue: String
}

struct SectionOfCustomData {
    var header: String
    var items: [CustomData]
}

extension SectionOfCustomData: SectionModelType {
    
    typealias Item = CustomData
    
    init(original: SectionOfCustomData, items: [Item]) {
        self = original
        self.items = items
    }
}

let data = Observable.just([
    SectionOfCustomData(header: "Test Header Test",
                        items: [
                            CustomData(role: "Building", forceValue: "Building测试"),
                            CustomData(role: "House", forceValue: "House测试"),
                            CustomData(role: "House", forceValue: "House测试"),
                            CustomData(role: "House", forceValue: "House测试"),
                            CustomData(role: "House", forceValue: "House测试"),
                            CustomData(role: "House", forceValue: "House测试")
        ]
    )])

let refreshdata = Observable.just([
SectionOfCustomData(header: "鬼才",
                    items: [
                        CustomData(role: "Building", forceValue: "Building测试"),
                        CustomData(role: "House", forceValue: "House测试"),
                        CustomData(role: "House", forceValue: "House测试"),
                        CustomData(role: "House", forceValue: "House测试"),
                        CustomData(role: "House", forceValue: "House测试"),
                        CustomData(role: "House", forceValue: "House测试")
    ]
)])


struct Inputs {
    let isRefresh = BehaviorRelay<Bool>(value: false)
}
   
struct Outputs {
    var data: Observable<[SectionOfCustomData]>
}
   
class ViewModel {
    
    var inputs = Inputs()
    
    private(set) var outputs: Outputs!
    
    init() {
        self.outputs = Outputs(data: data)
    }
}
   





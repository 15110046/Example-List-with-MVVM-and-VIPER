//
//  ViewModelViewController2.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation
class ViewModelViewController2 {
    private var model: ModelNumber?
    private var numberUI: Observable<Int>?
    init(number: Int) {
        self.model = ModelNumber(number: number)
        self.numberUI = Observable(number)
    }
    
    func bindingData(completion: @escaping (Int)->()) {
        numberUI?.bind(observer: { (number) in
            completion(number)
        })
    }
    
    
    func clickTang() {
        guard let value = model?.getValue() else {
            return
        }
        model?.setValue(value: value + 1)
        self.numberUI?.value = model?.getValue() ?? 0
    }
    func clickGiam() {
        guard let value = model?.getValue() else {
            return
        }
        model?.setValue(value: value - 1)
        self.numberUI?.value = model?.getValue() ?? 0
    }
    func formatData() {
        model?.setValue(value: 0)
        self.numberUI?.value = model?.getValue() ?? 0
    }
}

//
//  Model.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation

struct ModelNumber {
    private var number: Int = 0
    
    init(number: Int) {
        self.number = number
    }
    func getValue() -> Int {
        return number
    }
    mutating func setValue(value: Int) {
        self.number = value
    }
}

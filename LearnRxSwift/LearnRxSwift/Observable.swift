//
//  Observable.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation

public class Observable<T> {
    public typealias Observer = (_ observable: T) -> Void

    private var observers: [Observer]
    
    public var value: T {
        didSet {
            notifyObservers()
        }
    }

    public init(_ value: T) {
        self.value = value
        observers = []
    }
    
    public func bind(observer: @escaping Observer) {
        self.observers.append(observer)
        notifyObservers()
    }

    private func notifyObservers() {
        self.observers.forEach { [unowned self] (observer) in
            observer(value)
        }
    }
}

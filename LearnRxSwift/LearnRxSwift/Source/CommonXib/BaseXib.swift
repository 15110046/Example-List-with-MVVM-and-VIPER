//
//  BaseXib.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit


public protocol Reusable {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib? {
        return UINib(nibName: reuseIdentifier.self, bundle: nil)
    }
}

// MARK: -

public protocol ReusableView {
    func initialize()
}

open class BaseUIView: UIView, ReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    open func initialize() {
    }
}

class BaseXibView: BaseUIView {
    func commonInit<T>(view: T?) where T: UIView {
        guard let view = view else { return }
        
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
}

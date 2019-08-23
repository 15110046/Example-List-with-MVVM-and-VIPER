//
//  ModelScreen.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit
import IGListKit

class ModelScreenViewController: NSObject {
    let name: String
    let controllerClass: UIViewController.Type
    let controllerIdentifier: String?
    
    init(name: String,
        controllerClass: UIViewController.Type,
        controllerIdentifier: String? = nil) {
        self.name = name
        self.controllerClass = controllerClass
        self.controllerIdentifier = controllerIdentifier
    }
}

extension ModelScreenViewController: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return name as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? ModelScreenViewController else { return false }
        return controllerClass == object.controllerClass && controllerIdentifier == object.controllerIdentifier
    }
    
}

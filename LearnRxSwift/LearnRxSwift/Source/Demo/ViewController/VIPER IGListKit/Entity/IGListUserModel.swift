//
//  IGListUserModel.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation
import IGListKit

class IGListUserModel: NSObject {
    var id: Int = 0
    var users: [UserModel] = []
    init(data: [UserModel]) {
        self.users = data
    }
}

extension IGListUserModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? IGListUserModel else { return false }
        return id == object.id
    }
    
}

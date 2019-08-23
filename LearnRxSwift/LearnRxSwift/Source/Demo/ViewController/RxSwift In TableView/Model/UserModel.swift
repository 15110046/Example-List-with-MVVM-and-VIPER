//
//  UserModel.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation
class UserModel {
    var userName: String? = ""
    var id: Int? = 0
    var avatar_url: String? = ""
    init(data: [String: Any]) {
        self.userName = data["login"] as? String ?? ""
        self.id = data["id"] as? Int ?? 0
        self.avatar_url = data["avatar_url"] as? String ?? ""
    }
}

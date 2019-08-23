//
//  CellInfoUser.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit
import SDWebImage
class CellInfoUser: UICollectionViewCell {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var img: UIImageView!
    func config(object: UserModel) {
        guard let id = object.id,
              let userName = object.userName,
              let url = URL.init(string: object.avatar_url ?? "") else {
                
                self.id.text = "UID: "
                self.userName.text = "User name: "
                self.img.image =  UIImage()
            return
        }
        self.id.text = "UID: \(id)"
        self.userName.text = "User name: " + userName
        self.img.sd_setImage(with: url, completed: .none)

    }
}

//
//  TableViewCell.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit
import SDWebImage
class TableViewCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    func config(object: UserModel) {
       
        
        guard let id =  object.id, let name = object.userName else { return }
        self.id.text = "ID: \(id)"
        self.name.text = "Name: \(name)"
        guard let url = URL.init(string: object.avatar_url ?? "") else {
            return
        }
        self.img.sd_setImage(with: url, completed: .none)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

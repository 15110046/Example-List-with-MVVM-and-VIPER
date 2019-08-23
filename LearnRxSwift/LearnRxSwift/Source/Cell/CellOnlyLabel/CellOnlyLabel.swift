//
//  CellOnlyLabel.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit

class CellOnlyLabel: UICollectionViewCell {
    @IBOutlet private weak var lblName: UILabel!
    func configUI(name: String) {
        lblName.text = name
    }
}

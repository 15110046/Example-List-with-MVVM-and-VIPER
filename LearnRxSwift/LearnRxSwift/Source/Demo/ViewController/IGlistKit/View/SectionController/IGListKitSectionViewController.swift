//
//  IGListKitSectionViewController.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation
import IGListKit

class IGListKitSectionViewController: ListSectionController {
    private var dataCell: IGListUserModel?
    
    override init() {}
    override func didUpdate(to object: Any) {
        guard let feed = object as? IGListUserModel else {
            return
        }
        dataCell = feed
    }
    override func numberOfItems() -> Int {
        return dataCell?.users.count ?? 0
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibCell = String(describing: CellInfoUser.self)
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: nibCell,
                                                 bundle: nil,
                                                 for: self,
                                                 at: index) as? CellInfoUser else { return UICollectionViewCell() }
        cell.config(object: dataCell?.users[index] ?? UserModel(data: [:]))
        return cell
    }
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}

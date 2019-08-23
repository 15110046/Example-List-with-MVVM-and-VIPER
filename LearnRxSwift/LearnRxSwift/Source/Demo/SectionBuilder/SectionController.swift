//
//  SectionController.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class SectionController: ListSectionController {
    private var object: ModelScreenViewController?
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 200)
    }
    override func didUpdate(to object: Any) {
        self.object = object as? ModelScreenViewController
        
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibName = String(describing: CellOnlyLabel.self)
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: nibName,
                                                                bundle: nil,
                                                                for: self,
                                                                at: index) as? CellOnlyLabel else { return UICollectionViewCell() }
        cell.configUI(name: object?.name ?? "")
        return cell
    }
    
    override func didSelectItem(at index: Int) {
        if let identifier = object?.controllerIdentifier {
             let vc = instantiate(IGListKitViewController.self)
            vc.title = object?.name
            viewController?.navigationController?.pushViewController(vc, animated: true)
        } else if let controller = object?.controllerClass.init() {
            controller.title = object?.name
            viewController?.navigationController?.pushViewController(controller, animated: true)
        }


        
    }
    
}


extension NSObject {
    public class var className:String {
        get {
            return NSStringFromClass(self).components(separatedBy: ".").last!
        }
    }
    
}

protocol StoryboardInstatiable {}

func instantiate<T: StoryboardInstatiable>(_: T.Type) -> T where T: NSObject {
    let storyboard = UIStoryboard(name: T.className, bundle: nil)
    return storyboard.instantiateInitialViewController() as! T
}

func instantiate<T: StoryboardInstatiable>(_: T.Type, storyboard: String) -> T where T: NSObject {
    let storyboard = UIStoryboard(name: storyboard, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: T.className) as! T
}

extension UIViewController: StoryboardInstatiable {}



protocol NibInstantiable {}

func instantiateFromNib<T: NibInstantiable, U: Any>(_: T.Type, owner: U) -> T where T: NSObject {
    return UINib(nibName: T.className, bundle: nil).instantiate(withOwner: owner, options: nil)[0] as! T
}

func instantiateFromNib<T: Any>(identifier: String, owner: T) -> UIView {
    return UINib(nibName: identifier, bundle: nil).instantiate(withOwner: owner, options: nil)[0] as! UIView
}
extension UIView: NibInstantiable {}

func delay(sec:Double, handler:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + sec, execute:handler)
}

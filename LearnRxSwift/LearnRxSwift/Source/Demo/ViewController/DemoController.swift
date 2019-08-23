//
//  DemoController.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class DemoViewController: UIViewController {
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let viewControllers: [ModelScreenViewController] =
        [ModelScreenViewController(name: "Demo kiến trúc MVVM với TableView", controllerClass: ListViewController.self),
        ModelScreenViewController(name: "Demo kiến trúc VIPER với IGListKit", controllerClass: IGListKitViewController.self, controllerIdentifier: "IGListKitViewController"),
        ModelScreenViewController(name: "Demo kiến trúc MVVM với IGListKit", controllerClass: IGListKitMVVMController.self, controllerIdentifier: "IGListKitMVVMController")]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo MVVM, MVP, VIPER"
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}
// MARK: ListAdapterDataSource
extension DemoViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewControllers
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return SectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}

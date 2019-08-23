//
//  IGListKitViewController.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit
import IGListKit
protocol IGListKitViewControllerReloadUI {
    func adapterReloadData()
}

class IGListKitViewController: UIViewController {
    
    @IBOutlet weak var viewSearch: SearchView!
    @IBOutlet weak var clsView: ListCollectionView!
    private var presenter: IGListKitPresenter?
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        presenter = IGListKitPresenterImp(router: self, interactor: IGListKitInteractorImp())
        adapter.collectionView = clsView
        adapter.delegate = self
        adapter.dataSource = self
        viewSearch.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

}
//MARK: Config ListAdapterDataSource
extension IGListKitViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return presenter?.listAdapter() ?? [ListDiffable]()
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return IGListKitSectionViewController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
//MARK: Config IGListAdapterDelegate
extension IGListKitViewController: IGListAdapterDelegate {
    func listAdapter(_ listAdapter: ListAdapter, willDisplay object: Any, at index: Int) {
        
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying object: Any, at index: Int) {
        
    }
}

//MARK: View Reload UI
extension IGListKitViewController: IGListKitViewControllerReloadUI {
    func adapterReloadData() {
        adapter.reloadData(completion: nil)
    }
}

//MARK: Delegate TextSearch
extension IGListKitViewController: SearchViewOutPut {
    func textField(_ textFieldString: String, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return presenter?.shouldChangeCharactersIn(range: range, replacementString: string, textFieldString: textFieldString, delegate: self) ?? false
    }
    
    
}

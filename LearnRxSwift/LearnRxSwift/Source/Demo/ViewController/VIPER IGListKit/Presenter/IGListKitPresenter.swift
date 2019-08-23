//
//  IGListKitPresenter.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation

protocol IGListKitPresenter {
    func listAdapter() -> [IGListUserModel]
    func viewIsReady(input: String, delegate: IGListKitViewControllerReloadUI)
    func shouldChangeCharactersIn(range: NSRange,replacementString string: String, textFieldString: String, delegate: IGListKitViewControllerReloadUI) -> Bool
}
class IGListKitPresenterImp {
    private weak var router: IGListKitRouter?
    private var interactor: IGListKitInteractor?
    private var pendingRequestWorkItem: DispatchWorkItem?

    init(router: IGListKitRouter?,
         interactor: IGListKitInteractor?) {
        self.router = router
        self.interactor = interactor
    }
}
extension IGListKitPresenterImp: IGListKitPresenter {
    func shouldChangeCharactersIn(range: NSRange, replacementString string: String, textFieldString: String, delegate: IGListKitViewControllerReloadUI) -> Bool {
        let text = textFieldString
        if let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            
            pendingRequestWorkItem?.cancel()
        
            let requestWorkItem = DispatchWorkItem { [weak self] in
                self?.viewIsReady(input: updatedText, delegate: delegate)
            }
            
            pendingRequestWorkItem = requestWorkItem
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250),
                                          execute: requestWorkItem)
        }
        return true
        
    }
    
    func viewIsReady(input: String, delegate: IGListKitViewControllerReloadUI) {
        interactor?.setUpDataSource(textInput: input, completion: { (isTrue) in
            if isTrue {
                delegate.adapterReloadData()
            }
        })
    }
    
    func listAdapter() -> [IGListUserModel] {
        return interactor?.getArrayDataSource() ?? [IGListUserModel]()
    }

}

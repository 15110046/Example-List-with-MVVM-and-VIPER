//
//  ListViewModel.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ListViewModel: NSObject {
//    var arrData: [UserModel] = []
    var searchInput = BehaviorRelay<String>(value: "")
    var searchResults = BehaviorRelay<[UserModel]>(value: [])
    let disposeBag = DisposeBag()

    override init() {
        super.init()
        bindingData()
    }
    
    func bindingData() {
        self.searchInput.subscribe(onNext: { (text) in
            // khi searchInput thay đổi thì onNext sẽ đc gọi
            if text.isEmpty {
                self.searchResults.accept([])
            }
            else {
                self.requestJson(str: text)
            }
        }, onError: { (error) in
            // khi searchInput có lỗi thì onError sẽ đc gọi
        }, onCompleted: {
            print("Hoan thành search*********************************************")
        }, onDisposed: nil).disposed(by: disposeBag)
        
    }
    
    func requestJson(str: String) {
        guard let url = URL.init(string: "https://api.github.com/search/users?q=\(str)") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { [weak self] (data, res, err) in
            
            guard let strongSelf = self,
                    let data = data else {
                        return }
            do {
                if let dic: [String: Any] = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                    guard let item = dic["items"] as? [[String: Any]] else { return }
                    let arr = item.map{UserModel(data: $0)}
                    strongSelf.searchResults.accept(arr)
                }
                
            }
            catch {
                
            }
        }.resume()
    }
    
}

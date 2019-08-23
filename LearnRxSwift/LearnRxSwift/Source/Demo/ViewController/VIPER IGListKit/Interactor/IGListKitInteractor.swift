//
//  IGListKitInteractor.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import Foundation
protocol IGListKitInteractor {
    func getArrayDataSource() -> [IGListUserModel]
    func setUpDataSource(textInput: String, completion: @escaping (Bool)->())
}
class IGListKitInteractorImp {
    var arrDataSource: [IGListUserModel] = []
    init() {
        
    }
    func requestJson(str: String, completion: @escaping (Bool)->()) {
        guard let url = URL.init(string: "https://api.github.com/search/users?q=\(str)") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { [weak self] (data, res, err) in
            
            guard let strongSelf = self,
                    let data = data else {
                    completion(false)
                    return
            }
            do {
                if let dic: [String: Any] = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                    guard let item = dic["items"] as? [[String: Any]] else { return }
                    let arr = item.map{UserModel(data: $0)}
                    strongSelf.arrDataSource.removeAll()
                    strongSelf.arrDataSource.append(IGListUserModel(data: arr))
                    completion(true)
                }
            }
            catch {
            }
        }.resume()
    }
}
extension IGListKitInteractorImp: IGListKitInteractor {
    func setUpDataSource(textInput: String, completion: @escaping (Bool)->()) {
        requestJson(str: textInput) { (isTrue) in
            DispatchQueue.main.async {
                if isTrue {
                    completion(isTrue)
                }
                else {
                    completion(!isTrue)
                }
            }
            
        }
    }
    func getArrayDataSource() -> [IGListUserModel] {
        return arrDataSource
    }
    
    func numberOfItemInDataSource() -> Int {
        return arrDataSource.count
    }
}

//
//  ListViewController.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ListViewController: UIViewController {
    @IBOutlet weak var searchView: SearchView!
    
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var tbView: UITableView!
    let viewModel = ListViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tbView.rx.setDelegate(self)
        searchView.delegate = self
        bindingUI(textField: searchView.getTextField())


    }
    func bindingUI(textField: UITextField) {
    
        textField.rx.text
            .orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .bind(to: self.viewModel.searchInput)
            .disposed(by: disposeBag)
    
        self.viewModel.searchResults.asObservable()
            .bind(to: tbView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) { (index, item, cell) in
                cell.config(object: item)
        }
            .disposed(by: disposeBag)
        
        self.tbView.rx
            .modelSelected(UserModel.self)
            .subscribe(onNext: { (userModel) in
                print(userModel.userName)
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
    }
}
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
extension ListViewController: SearchViewOutPut {
    func textField(_ textFieldString: String, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
}

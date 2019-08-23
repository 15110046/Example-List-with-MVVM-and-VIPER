//
//  SearchView.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/23/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit
protocol SearchViewOutPut: class {
    func textField(_ textFieldString: String, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}
class SearchView: BaseXibView, Reusable {
    @IBOutlet private weak var textFieldSearch: UITextField!
    @IBOutlet private weak var containerView: UIView!
    weak var delegate: SearchViewOutPut?
    override func initialize() {
        Bundle.main.loadNibNamed(SearchView.reuseIdentifier, owner: self, options: nil)
        commonInit(view: containerView)
        textFieldSearch.delegate = self
    }
    func getTextField() -> UITextField {
        return textFieldSearch
    }
}
extension SearchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldString = textField.text else { return false }
        return delegate?.textField(textFieldString, shouldChangeCharactersIn: range, replacementString: string) ?? false
    }
}

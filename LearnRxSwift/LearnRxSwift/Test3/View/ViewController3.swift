//
//  ViewController3.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    //MARK: Properties UI
    @IBOutlet private weak var number: UILabel!
    
    //MARK: Properties Core
    private var viewModel: ViewModelViewController2?
    
    func inject(viewModel: ViewModelViewController2) {
        self.viewModel = viewModel
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingUI()
    }
    //MARK: Methood
    private func bindingUI() {
        viewModel?.bindingData(completion: { [weak self] (number) in
            guard let strongSelf = self else { return }
            strongSelf.number.text = "\(number)"
        })
    }
    
    
    //MARK: Action
    @IBAction private func clickBack(_ sender: Any) {
        viewModel = nil
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction private func clickFormatData(_ sender: Any) {
        viewModel?.formatData()
    }
}


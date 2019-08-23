//
//  ViewController2.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController2: UIViewController {
    //MARK: Properties UI
    @IBOutlet private weak var btnTang: UIButton!
    @IBOutlet private weak var btnGiamr: UIButton!
    @IBOutlet private weak var lblNumber: UILabel!
    
    //MARK: Properties Core
    private var viewModel: ViewModelViewController2 = ViewModelViewController2(number: 10)
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingUI()
    }
   
    //MARK: Methood
    private func bindingUI() {
        viewModel.bindingData { [weak self] (number) in
            self?.lblNumber.text = "\(number)"
        }
    }
    
    //MARK: Action
    @IBAction private func clickGiam(_ sender: Any) {
        viewModel.clickGiam()
    }
    
    @IBAction private func clickTang(_ sender: Any) {
        viewModel.clickTang()
    }
    
    @IBAction private func clickNext(_ sender: Any) {
        guard let vc = UIStoryboard.init(name: "ViewController3", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController3") as? ViewController3 else { return }
        vc.inject(viewModel: viewModel)
        self.present(vc, animated: true, completion: nil)
    }
    
}

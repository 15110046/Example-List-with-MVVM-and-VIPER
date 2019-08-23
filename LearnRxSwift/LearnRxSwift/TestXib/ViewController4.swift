//
//  ViewController4.swift
//  LearnRxSwift
//
//  Created by Nguyen Hieu on 8/17/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func click(_ sender: Any) {
        let vc = ViewController5(nibName: "ViewController5", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    

}

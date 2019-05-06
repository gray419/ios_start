//
//  ViewController.swift
//  ios_starter
//
//  Created by Robert Gray on 5/5/19.
//  Copyright © 2019 Robert Gray. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "iOS Starter"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
}

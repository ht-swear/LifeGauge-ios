//
//  loginViewController.swift
//  LifeGauge-ios
//
//  Created by Rei Ishikawa on 17/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, loginViewInput {

    var output: loginViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: loginViewInput
    func setupInitialState() {
    }
}

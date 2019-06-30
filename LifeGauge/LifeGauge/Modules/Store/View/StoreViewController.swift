//
//  StoreViewController.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, StoreViewInput {

    var output: StoreViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        view.backgroundColor = UIColor.darkGray
    }


    // MARK: StoreViewInput
    func setupInitialState() {
    }
}

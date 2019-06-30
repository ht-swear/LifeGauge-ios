//
//  CreateGaugeViewController.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class CreateGaugeViewController: UIViewController, CreateGaugeViewInput {

    var output: CreateGaugeViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        view.backgroundColor = UIColor.lightGray
    }


    // MARK: CreateGaugeViewInput
    func setupInitialState() {
    }
}

//
//  loginInitializer.swift
//  LifeGauge-ios
//
//  Created by Rei Ishikawa on 17/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class loginModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var loginViewController: loginViewController!

    override func awakeFromNib() {

        let configurator = loginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: loginViewController)
    }

}

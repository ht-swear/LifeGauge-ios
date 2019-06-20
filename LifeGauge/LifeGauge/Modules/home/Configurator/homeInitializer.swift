//
//  homeInitializer.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class homeModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var homeViewController: homeViewController!

    override func awakeFromNib() {

        let configurator = homeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeViewController)
    }

}

//
//  RootRouter.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/19.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit

class RootRouter
{
    func presentHomeView(in window: UIWindow?)
    {
        guard let window = window else { return }
        window.makeKeyAndVisible()
        window.rootViewController = PageRouter.assembleModule()
    }
}


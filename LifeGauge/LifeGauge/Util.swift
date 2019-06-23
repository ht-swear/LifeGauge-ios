//
//  Util.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/20.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import Foundation

extension Collection
{
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

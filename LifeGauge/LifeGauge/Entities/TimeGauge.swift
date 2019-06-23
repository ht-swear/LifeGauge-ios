//
//  File.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/18.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import Foundation

class TimeGauge
{
    // Property
    var id: String?
    var description: String?
    var start: Date?
    var end: Date?
    
    init(id: String, description: String, start: Date, end: Date) {
        self.id = id
        self.description = description
        self.start = start
        self.end = end
    }
}

//
//  homeInteractorOutput.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import Foundation

protocol homeInteractorOutput: class {
    func fetched(_ timeGauges: [TimeGauge])
}

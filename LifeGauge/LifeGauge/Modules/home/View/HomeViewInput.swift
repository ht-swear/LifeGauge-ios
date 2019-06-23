//
//  homeViewInput.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

protocol HomeViewInput: class {

    /**
        @author 
        Setup initial state of the view
    */

    func setupInitialState()
    
    func show(_ timeGauges: [TimeGauge])
    func showNoting()
}

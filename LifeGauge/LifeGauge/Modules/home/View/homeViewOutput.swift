//
//  homeViewOutput.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

protocol homeViewOutput {

    /**
        @author 
        Notify presenter that view is ready
    */

    func viewIsReady()
    func fetchTimeGauges()
}

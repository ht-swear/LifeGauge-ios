//
//  homePresenterTests.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import XCTest

class homePresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: homeInteractorInput {

    }

    class MockRouter: homeRouterInput {

    }

    class MockViewController: homeViewInput {

        func setupInitialState() {

        }
    }
}

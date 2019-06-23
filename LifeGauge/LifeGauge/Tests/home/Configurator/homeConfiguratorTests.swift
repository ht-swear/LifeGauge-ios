//
//  homeConfiguratorTests.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import XCTest

class homeModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = homeViewControllerMock()
        let configurator = homeModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "homeViewController is nil after configuration")
        XCTAssertTrue(viewController.output is homePresenter, "output is not homePresenter")

        let presenter: homePresenter = viewController.output as! homePresenter
        XCTAssertNotNil(presenter.view, "view in homePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in homePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is homeRouter, "router is not homeRouter")

        let interactor: homeInteractor = presenter.interactor as! homeInteractor
        XCTAssertNotNil(interactor.output, "output in homeInteractor is nil after configuration")
    }

    class homeViewControllerMock: homeViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}

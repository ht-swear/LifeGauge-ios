//
//  homeViewController.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    // Property
    var output: HomeViewOutput!
    
    let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.cyan, UIColor.orange, UIColor.yellow, UIColor.brown, UIColor.magenta]
    
    private var timeGauges: [TimeGauge] = []
    
    // Outlet
    
    //------------------------------------------------------------//
    // MARK: -- View --
    //------------------------------------------------------------//
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Notify to presenter
        output.viewIsReady()
        output.fetchTimeGauges()
        
        let circleView = CircleMenuView(frame: CGRect(x: 0, y: view.frame.height - view.frame.width/2, width: view.frame.width, height: view.frame.width))
        circleView.delegate = self
        circleView.dataSource = self
        view.addSubview(circleView)
    }
    
    //------------------------------------------------------------//
    // MARK: -- Action --
    //------------------------------------------------------------//
    
}

extension HomeViewController: HomeViewInput
{
    //------------------------------------------------------------//
    // MARK: -- homeViewInput --
    //------------------------------------------------------------//
    
    func setupInitialState() {
    }
    
    func show(_ timeGauges: [TimeGauge]) {
        self.timeGauges = timeGauges
    }
    
    func showNoting() {
        // Show custom noting screen
    }
}

extension HomeViewController: CircleMenuViewDataSource
{
    func circleMenuView(_ circleMenuView: CircleMenuView, cellForRowAt index: Int) -> CircleMenuViewCell
    {
        let itemView = circleMenuView.dequeueCircleItemView(for: index)
        itemView.backgroundColor = colors[safe: index]
        return itemView
    }
    
    func numberOfCircles(in circleMenuView: CircleMenuView) -> Int
    {
        return colors.count
    }
}

extension HomeViewController: CircleMenuViewDelegate
{
    //------------------------------------------------------------//
    // MARK: -- CircleMenuViewDelegate --
    //------------------------------------------------------------//
    
    func diameterForTopCircle(in circleMenuView: CircleMenuView) -> CGFloat {
        return 50
    }
    
    func diameterForCell(in circleMenuView: CircleMenuView) -> CGFloat {
        return 40
    }
    
    func update(_ radian: Double) {
        
    }
}

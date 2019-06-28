//
//  CircleView.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/27.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit

protocol CircleViewDelegate: CircleMenuViewDelegate {
    func sizeForCell(in circleView: CircleView) -> CGSize
}

protocol CircleViewDataSource: CircleMenuViewDataSource {
    func circleView(_ circlView: CircleView, cellForRowAt index: Int) -> CircleViewCell
    func numberOfCircles(in circleView: CircleView) -> Int
}

class CircleView: UIView
{
    // Property
    var delegate: CircleViewDelegate? {
        didSet {
            guard let size = delegate?.sizeForCell(in: self) else { return }
            self.cellSize = size
            
            // Set menu view delegate
            menuView.delegate = delegate
        }
    }
    
    var dataSource: CircleViewDataSource? {
        didSet {
            // Set num of circles
            guard let numOfCircles = dataSource?.numberOfCircles(in: self) else { return }
            self.numOfCircles = numOfCircles
            menuView.numOfCircles = numOfCircles
            
            // Set menu view data source
            menuView.dataSource = dataSource
            
            // Create cells
            createCells()
        }
    }
    
    var cells: [CircleViewCell] = []
    var menuView: CircleMenuView!
    
    var cellSize: CGSize! = CGSize(width: 100, height: 100)
    
    var numOfCircles: Int! = 0
    
    //------------------------------------------------------------//
    // MARK: -- Public methods --
    //------------------------------------------------------------//
    
    override init(frame: CGRect)
    {
        // Invoke super
        super.init(frame: frame)
        
        // Create menu view
        let width = frame.width
        let height = frame.height
        
        let menuFrame = CGRect(x: 0, y: height - width/2, width: width, height: width)
        menuView = CircleMenuView(frame: menuFrame)
        menuView.layoutDelegate = self
        self.addSubview(menuView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCells()
    {
        guard let numOfCircles = dataSource?.numberOfCircles(in: self) else { return }
        self.numOfCircles = numOfCircles
        
        // Create circle view cells
        for index in 0..<numOfCircles {
            guard let cell = dataSource?.circleView(self, cellForRowAt: index) else { return }
            self.addSubview(cell)
            
            cells.append(cell)
        }
    }
    
    
    //------------------------------------------------------------//
    // MARK: -- Public methods --
    //------------------------------------------------------------//
    
    public func dequeueCircleViewCell(for index: Int) -> CircleViewCell
    {
        // Calculate position with index
        let radian = Double.pi*2 / Double(numOfCircles) * Double(index)
        let pos = calculatePos(radian: radian)
        
        let x = pos.x - cellSize.width/2
        let y = pos.y - cellSize.height/2
        let frame = CGRect(x: x, y: y, width: cellSize.width, height: cellSize.height)
        
        let cell = CircleViewCell(frame: frame)
        cell.radian = radian
        return cell
    }
    
    //------------------------------------------------------------//
    // MARK: -- Update Postion --
    //------------------------------------------------------------//
    
    private func updateCircleItemsPos(with diffRadian: Double, duration: TimeInterval)
    {
        for cell in cells {
            // Calcurate new postion by diff radian
            guard let radian = cell.radian else { return }
            let newRadian = radian + diffRadian
            
            // For update with animation
            if duration > 0.0 {
                UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: [], animations: {
                    // Separate update into 10 animations
                    for i in 1..<11 {
                        // Calculate diff radian
                        let pos = self.calculatePos(radian: radian + diffRadian/10*Double(i))
                        
                        // Add animation key frame
                        UIView.addKeyframe(withRelativeStartTime: Double(i)*0.1, relativeDuration: duration/10, animations: {
                            cell.center = CGPoint(x: pos.x, y: pos.y)
                        })
                    }
                })
            }
                // For update with drag
            else {
                let pos = calculatePos(radian: newRadian)
                cell.center = CGPoint(x: pos.x, y: pos.y)
            }
            // Update item view radian
            cell.radian = newRadian
        }
    }
    
    //------------------------------------------------------------//
    // MARK: -- Public methods --
    //------------------------------------------------------------//
    
    private func calculatePos(radian: Double) -> (x: CGFloat, y: CGFloat)
    {
        // Calculate circle center and radius
        let center = CGPoint(x: frame.width/2, y: frame.height)
        let r = frame.height - cellSize.height/2 - 64
        
        // Calculate position with radian
        let x = center.x + (r * CGFloat(cos(radian)))
        let y = center.y - (r * CGFloat(sin(radian)))
        return (x, y)
    }
}

extension CircleView: CircleMenuViewLayoutDelegate
{
    func didUpdate(radian: Double)
    {
        updateCircleItemsPos(with: radian, duration: 0.0)
    }
}

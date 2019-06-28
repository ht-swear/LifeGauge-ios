//
//  CircleMenueView.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/23.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit
import AudioToolbox

protocol CircleMenuViewDelegate {
    func diameterForTopCircle(in circleMenuView: CircleMenuView) -> CGFloat
    func diameterForCell(in circleMenuView: CircleMenuView) -> CGFloat
}

protocol CircleMenuViewDataSource {
    func circleMenuView(_ circleMenuView: CircleMenuView, cellForRowAt index: Int) -> CircleMenuViewCell
}

protocol CircleMenuViewLayoutDelegate {
    func didUpdate(radian: Double)
}

class CircleMenuView: UIView
{
    enum systemSound: SystemSoundID {
        case strongTwice = 1011
        case shortTwice = 1102
        case weakShort = 1519
        case strongShort = 1520
    }
    
    // Property
    var innerView: UIView!
    var topCircleView: UIView!
    
    var cells: [CircleMenuViewCell] = []
    
    var delegate: CircleMenuViewDelegate? {
        didSet {
            makeTopCircleView()
        }
    }
    
    var dataSource: CircleMenuViewDataSource? {
        didSet {
            createCells()
        }
    }
    
    var layoutDelegate: CircleMenuViewLayoutDelegate?
    
    var startPos: CGPoint?
    var endPos: CGPoint?
    
    var diameterForTopCircle: CGFloat! = 30
    var diameterForCell: CGFloat! = 20
    
    var numOfCircles: Int! = 0
    
    
    //------------------------------------------------------------//
    // MARK: -- View --
    //------------------------------------------------------------//
    
    override init(frame: CGRect)
    {
        // Invoke super
        super.init(frame: frame)
        
        // Create innerView
        innerView = UIView(frame: CGRect(x: 16, y: 16, width: frame.width - 32, height: frame.width - 32))
        addSubview(innerView)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCells()
    {
        // Create cells
        for i in 0..<numOfCircles {
            guard let cell = dataSource?.circleMenuView(self, cellForRowAt: i) else { return }
            innerView.addSubview(cell)
            
            // Append cells
            cells.append(cell)
        }
        
        innerView.bringSubviewToFront(topCircleView)
    }
    
    //------------------------------------------------------------//
    // MARK: -- Touches --
    //------------------------------------------------------------//
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        // Invoke super
        super.touchesBegan(touches, with: event)
        
        // Set start postion
        guard let touch = touches.first else { return }
        startPos = touch.location(in: innerView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        // Invoke super
        super.touchesMoved(touches, with: event)
        
        // Set end position
        guard let touch = touches.first else { return }
        endPos = touch.location(in: innerView)
        
        // Calcualate radian
        guard let diffRadian = calculateDiffRadian(from: startPos, to: endPos) else { return }
        updateCircleItemsPos(with: diffRadian, duration: 0.0)
        
        // Update location
        startPos = endPos
        endPos = nil
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        // Invoke super
        super.touchesEnded(touches, with: event)
        
        // Set end postion
        guard let touch = touches.first else { return }
        endPos = touch.location(in: innerView)
        
        // Calcualate radoam
        guard let diffRadian = calculateDiffRadian(from: startPos, to: endPos) else { return }
        updateCircleItemsPos(with: diffRadian, duration: 0.0)
        
        // Reset positions
        startPos = nil
        endPos = nil
        
        // Update circle item position to nearest point
        guard let radian = calculateRadianFromNearestPoint() else { return }
        updateCircleItemsPos(with: radian, duration: 0.1)
    }
    
    //------------------------------------------------------------//
    // MARK: -- Public methods --
    //------------------------------------------------------------//
    
    public func dequeueCircleItemView(for index: Int) -> CircleMenuViewCell
    {
        // Calculate position with index
        let radian = Double.pi*2 / Double(numOfCircles) * Double(index)
        let pos = calculatePos(radian: radian)
        
        // Calculate frame
        let x = pos.x - diameterForCell/2
        let y = pos.y - diameterForCell/2
        let frame = CGRect(x: x, y: y, width: diameterForCell, height: diameterForCell)
        
        // Create circle item view
        let circleItemView = CircleMenuViewCell(frame: frame)
        circleItemView.radian = radian
        circleItemView.delegate = self
        circleItemView.layer.cornerRadius = diameterForCell/2
        circleItemView.layer.masksToBounds = true
        return circleItemView
    }
    
    public func reloadData()
    {
        cells.forEach({ $0.removeFromSuperview() })
        cells = []
        
        // Make top circle view
        makeTopCircleView()
        
        // Create cells
        createCells()
    }
    
    public func cellForRow(at index: Int) -> CircleMenuViewCell?
    {
        return cells[safe: index]
    }
    
    public func numberOfCircles() -> Int
    {
        return numOfCircles
    }
    
    //------------------------------------------------------------//
    // MARK: -- Circle make --
    //------------------------------------------------------------//
    
    private func makeTopCircleView()
    {
        // For error
        guard let diameterForTopCircle = delegate?.diameterForTopCircle(in: self) else { return }
        guard let diameterForCell = delegate?.diameterForCell(in: self) else { return }
        
        // Set properties
        self.diameterForTopCircle = diameterForTopCircle
        self.diameterForCell = diameterForCell
        
        // Set circle center and radius
        let center = CGPoint(x: innerView.frame.width/2, y: innerView.frame.height/2)
        let r = innerView.frame.width/2 - 64
        
        // Create top circle view
        let frame = CGRect(x: center.x - diameterForTopCircle/2, y: center.y - diameterForTopCircle/2 - r, width: diameterForTopCircle, height: diameterForTopCircle)
        topCircleView = UIView(frame: frame)
        topCircleView.layer.cornerRadius = diameterForTopCircle/2
        topCircleView.layer.masksToBounds = true
        topCircleView.layer.borderColor = UIColor.black.cgColor
        topCircleView.layer.borderWidth = (diameterForTopCircle - diameterForCell)/2
        innerView.addSubview(topCircleView)
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
                // Play sound
                playSound()
            }
            // For update with drag
            else {
                let pos = calculatePos(radian: newRadian)
                cell.center = CGPoint(x: pos.x, y: pos.y)
            }
            // Update item view radian
            cell.radian = newRadian
        }
        
        // Notifiy to delegate
        layoutDelegate?.didUpdate(radian: diffRadian)
    }
    
    
    //------------------------------------------------------------//
    // MARK: -- Radian --
    //------------------------------------------------------------//
    
    private func calculateRadianFromNearestPoint() -> Double?
    {
        // Search nearest circle item from top center
        guard let nearestCircle = cells.sorted(by: {( _distance(from: $0.center, to: topCircleView.center) < _distance(from: $1.center, to: topCircleView.center) )}).first else { return nil }
        
        // Calculate diff radian
        guard let radian = calculateDiffRadian(from: nearestCircle.center, to: topCircleView.center) else { return nil }
        return radian
    }
    
    private func _distance(from: CGPoint, to: CGPoint) -> Double
    {
        // Calculate distance between 2 points
        let dx = Double(from.x - to.x)
        let dy = Double(from.y - to.y)
        return sqrt(dx*dx + dy*dy)
    }
    
    private func calculateDiffRadian(from: CGPoint?, to: CGPoint?) -> Double?
    {
        // Calculate circle center
        guard let a = from, let b = to else { return nil }
        let center = CGPoint(x: innerView.frame.width/2, y: innerView.frame.height/2)
        
        // Calculate radians by arc tangent
        let startRadian = atan2(Double(a.y - center.y), Double(a.x - center.x))
        let endRadian = atan2(Double(b.y - center.y), Double(b.x - center.x))
        
        // Calculate diff radian
        let diffRadian = endRadian - startRadian
        return diffRadian != 0 ? diffRadian * -1 : nil
    }
    
    private func calculateRadian(p: CGPoint) -> Double
    {
        let center = CGPoint(x: innerView.frame.width/2, y: innerView.frame.height/2)
        return atan2(Double(p.y - center.y), Double(p.x - center.x))
    }
    
    //------------------------------------------------------------//
    // MARK: -- Position --
    //------------------------------------------------------------//
    
    private func calculatePos(radian: Double) -> (x: CGFloat, y: CGFloat)
    {
        // Calculate circle center and radius
        let center = CGPoint(x: innerView.frame.width/2, y: innerView.frame.height/2)
        let r = innerView.frame.width/2 - 64
        
        // Calculate position with radian
        let x = center.x + (r * CGFloat(cos(radian)))
        let y = center.y - (r * CGFloat(sin(radian)))
        return (x, y)
    }
    
    //------------------------------------------------------------//
    // MARK: -- Sound --
    //------------------------------------------------------------//
    
    private func playSound()
    {
        // Play short sound
        AudioServicesPlaySystemSound(systemSound.strongShort.rawValue)
    }
}

extension CircleMenuView: CircleMenuViewCellDelegate
{
    //------------------------------------------------------------//
    // MARK: -- CircleItemViewDelegate --
    //------------------------------------------------------------//
    
    func didSelect(cell: CircleMenuViewCell)
    {
        // Calculate diff from tapped view to top circle
        guard let diffRadian = calculateDiffRadian(from: cell.center, to: topCircleView.center) else { return }
        
        // Update circle items position with radian
        updateCircleItemsPos(with: diffRadian, duration: 0.2)
    }
}

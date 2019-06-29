//
//  CircleGaugeView.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/29.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit

enum CirclePosition: CGFloat {
    case top = -90
    case right = 0
    case bottom = 90
    case left = 180
}

class CircleGaugeView: UIView
{
    // Property
    private var pos: CirclePosition! = .top
    private var angleAmount: Int! = 0
    private var thickness: CGFloat! = 12
    private var gaugeBackgroundColor: UIColor! = UIColor.black
    
    private var progressLabel: UILabel!
    
    //------------------------------------------------------------//
    // MARK: -- View --
    //------------------------------------------------------------//
    
    init(frame: CGRect, from pos: CirclePosition, angleAmount: Int, thickenss: CGFloat, backgoundColor: UIColor)
    {
        // Invoke super
        super.init(frame: frame)
        
        // Draw gauge
        drawGauge(from: pos, angleAmount: angleAmount, thickenss: thickenss, backgoundColor: backgoundColor)
        
        // Create progress label
        progressLabel = UILabel()
        progressLabel?.font = UIFont.boldSystemFont(ofSize: 32.0)
        progressLabel.textColor = UIColor.black
        progressLabel.textAlignment = .center
        progressLabel.text = "\(Int(angleAmount*100/360)) %"
        
        // Calculate label size
        let rect = progressLabel.sizeThatFits(CGSize(width: frame.width/2, height: frame.height/2))
        let x = frame.width/2 - rect.width/2
        let y = frame.height/2 - rect.height/2
        progressLabel.frame = CGRect(x: x, y: y, width: rect.width, height: rect.height)
        addSubview(progressLabel)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //------------------------------------------------------------//
    // MARK: -- View --
    //------------------------------------------------------------//
    
    public func drawGauge(from pos: CirclePosition, angleAmount: Int, thickenss: CGFloat, backgoundColor: UIColor)
    {
        self.pos = pos
        self.angleAmount = angleAmount
        self.thickness = thickenss
        self.gaugeBackgroundColor = backgoundColor
        
        setNeedsDisplay()
    }
    
    //------------------------------------------------------------//
    // MARK: -- Draw --
    //------------------------------------------------------------//
    
    override func draw(_ rect: CGRect)
    {
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        let radius = min(frame.width/2, frame.height/2) - 64
        var startAngle = pos.rawValue
        
        // Draw background gauge
        let arc = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 360, clockwise: true)
        arc.lineWidth = thickness
        gaugeBackgroundColor.set()
        arc.stroke()
        
        // Draw main gauge
        for angle in 0..<360 {
            if angle < angleAmount {
                let startRadian = startAngle / 180 * CGFloat.pi
                let endRadian = (startAngle + 1) / 180 * CGFloat.pi
                
                let arc = UIBezierPath(arcCenter: center, radius: radius, startAngle: startRadian, endAngle: endRadian, clockwise: true)
                arc.lineWidth = thickness
                startAngle += 1
                
                UIColor(hue: CGFloat(angle) / 360, saturation: 1, brightness: 1, alpha: 1).set()
                arc.stroke()
            }
            
        }
    }
}

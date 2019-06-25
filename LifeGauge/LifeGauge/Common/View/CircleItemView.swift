//
//  CircleItemView.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/23.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit

protocol CircleItemViewDelegate {
    func tap(view: CircleItemView)
}

class CircleItemView: UIView
{
    var color: UIColor?
    var radian: Double?
    
    var delegate: CircleItemViewDelegate?
    
    override init(frame: CGRect)
    {
        // Invoke super
        super.init(frame: frame)
        
        // Add tap gesture recognizer
        self.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(recognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(color: UIColor?, radian: Double?)
    {
        self.color = color
        self.radian = radian
        backgroundColor = color
    }
    
    @objc private func tapAction()
    {
        // Notify to delegate
        delegate?.tap(view: self)
    }
}

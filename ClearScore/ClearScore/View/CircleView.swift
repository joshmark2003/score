//
//  CircleView.swift
//  ClearScore
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import UIKit

class CircleView: UIView {
    // MARK: Properties
    let progressShape = CAShapeLayer()
    let backgroundShape = CAShapeLayer()

    func updateIndicator(with percent: Double, isAnimated: Bool = false) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = progressShape.strokeEnd
        animation.toValue = percent / 100.0
        animation.duration = 2.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        backgroundShape.frame = frame
        backgroundShape.path = UIBezierPath(ovalIn: frame).cgPath
        backgroundShape.strokeColor = UIColor.black.cgColor
        backgroundShape.lineWidth = 2.0
        backgroundShape.fillColor = UIColor.clear.cgColor
        
        let progressShapeFrame = CGRect(x: 0, y: 0, width: frame.size.width-20, height: frame.size.height-20)

        progressShape.frame = progressShapeFrame
        progressShape.path = UIBezierPath(ovalIn: progressShapeFrame).cgPath
        progressShape.position = backgroundShape.position
        progressShape.strokeColor = UIColor.orange.cgColor
        progressShape.lineWidth = 5.0
        progressShape.fillColor = UIColor.clear.cgColor
        progressShape.strokeEnd = CGFloat(percent/100.0)
        progressShape.lineCap = "round"
        layer.addSublayer(backgroundShape)
        layer.addSublayer(progressShape)
        if isAnimated {
            progressShape.add(animation, forKey: nil)
        }
    }
}

//
//  CirclePulseView.swift
//  animations
//
//  Created by Karthik Kumar on 07/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class CirclePulseView: UIView {
    
    let alphaAnimation: CAAnimation = {
        
        let animation = CAKeyframeAnimation(keyPath: "opacity")
        animation.keyTimes = [0.0, 0.5, 0.5, 1.0]
        animation.values = [0.0, 1.0, 1.0, 0.0]
        
        
        let group = CAAnimationGroup()
        group.animations = [animation]
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        group.duration = 3.0
        group.repeatCount = Float.infinity

        return group
    }()
    
    let scaleAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = UIBezierPath(arcCenter: CGPoint.zero,
                                           radius: 10,
                                           startAngle: 0.0,
                                           endAngle: CGFloat.pi * 2,
                                           clockwise: true).cgPath
        animation.toValue = UIBezierPath(arcCenter: CGPoint.zero,
                                         radius: 300,
                                         startAngle: 0.0,
                                         endAngle: CGFloat.pi * 2,
                                         clockwise: true).cgPath
        animation.fillMode = kCAFillModeForwards
        animation.beginTime = 0.5
        
        let group = CAAnimationGroup()
        group.animations = [animation]
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        group.duration = 3.0
        group.repeatCount = Float.infinity
        
        return group
    }()
    
    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCirclePath()
        animate()
    }
    
    private func animate() {
        shapeLayer.add(alphaAnimation, forKey: "animateAlpha")
        shapeLayer.add(scaleAnimation, forKey: "scaleAnimation")
    }
    
    private func setupViews() {
        shapeLayer.lineWidth = 5.0
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        layer.addSublayer(shapeLayer)
    }
    
    private func setupCirclePath() {
        shapeLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let radius: CGFloat = min(bounds.width, bounds.height) / 2 - shapeLayer.lineWidth / 2
        let bezierPath = UIBezierPath(arcCenter: CGPoint.zero,
                                      radius: radius,
                                      startAngle: 0.0,
                                      endAngle: CGFloat.pi * 2,
                                      clockwise: true)
        
        shapeLayer.path = bezierPath.cgPath
    }
    
    func removeAnimations() {
        shapeLayer.removeAllAnimations()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

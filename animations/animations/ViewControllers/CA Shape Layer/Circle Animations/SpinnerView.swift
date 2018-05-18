//
//  SpinnerView.swift
//  animations
//
//  Created by Karthik Kumar on 06/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

@IBDesignable
class SpinnerView: UIView {
    
    let shapeLayer = CAShapeLayer()
    
    let strokeEndAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
//        animation.duration = 2.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = Float.infinity
//        group.autoreverses = true
        group.animations = [animation]
        
        return group
    }()
    
    let strokeStartAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.fromValue = 0.0
        animation.toValue = 1.09
//        animation.duration = 2.0
        animation.beginTime = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = Float.infinity
//        group.autoreverses = true
        group.animations = [animation]
        
        return group
    }()
    
    let rotateAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0.0
        animation.toValue = -CGFloat.pi * 2
        animation.duration = 10
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        return animation
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        shapeLayer.lineWidth = 5.0
        shapeLayer.strokeColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        shapeLayer.lineCap = kCALineCapRound
        layer.addSublayer(shapeLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupCirclePath()
        
        animate()
    }
    
    private func setupCirclePath() {
        let startAngle = -CGFloat.pi / 2
        
        let radius: CGFloat = min(bounds.width, bounds.height) / 2 - shapeLayer.lineWidth / 2
        let bezierPath = UIBezierPath(arcCenter: CGPoint.zero,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle: startAngle + CGFloat.pi * 2,
                                      clockwise: true)
        
        shapeLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        shapeLayer.path =  bezierPath.cgPath
    }
    
    func removeAnimations() {
        shapeLayer.removeAllAnimations()
    }
    
    private func animate() {
        shapeLayer.add(strokeEndAnimation, forKey: "strokeEndAnimation")
        shapeLayer.add(strokeStartAnimation, forKey: "strokeStartAnimation")
        shapeLayer.add(rotateAnimation, forKey: "rotateAnimation")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

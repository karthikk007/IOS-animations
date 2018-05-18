//
//  LineView.swift
//  animations
//
//  Created by Karthik Kumar on 07/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class LineView: UIView {
    
    let strokeEndAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = -0.01
        animation.toValue = 1.0
        animation.duration = 2.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fillMode = kCAFillModeForwards
        
        let group = CAAnimationGroup()
        group.animations = [animation]
        group.duration = 2.5
        
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
    
    private func setupViews() {
        
        shapeLayer.strokeColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineWidth = 10
        layer.addSublayer(shapeLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLine()
        animate()
    }
    
    private func setupLine() {
        shapeLayer.position = CGPoint(x: bounds.origin.x, y: bounds.midY)
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: bounds.midY), CGPoint(x: bounds.size.width, y: bounds.midY)])

        shapeLayer.path = path
    }
    
    private func animate() {
        shapeLayer.strokeEnd = 0.0
        shapeLayer.add(strokeEndAnimation, forKey: "strokeEndAnimation")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

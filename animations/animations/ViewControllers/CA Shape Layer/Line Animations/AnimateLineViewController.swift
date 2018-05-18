//
//  AnimateLineViewController.swift
//  animations
//
//  Created by Karthik Kumar on 05/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class AnimateLineViewController: UIViewController {
    
    var shapeLayer = CAShapeLayer()
    
    let strokeEndAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
//        animation.duration = 2.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = Float.infinity
        group.autoreverses = true
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
        group.autoreverses = true
        group.animations = [animation]
        
        return group
    }()
    
    var layer: CALayer {
        return view.layer
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSubviews()
    }
    
    private func addSubviews() {
        layer.addSublayer(shapeLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        drawLine()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animate()
    }
    
    private func animate() {
        shapeLayer.add(strokeStartAnimation, forKey: "strokeStartAnimation")
        shapeLayer.add(strokeEndAnimation, forKey: "strokeEndAnimation")
    }
    
    private func drawLine() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: view.bounds.width - 20, y: 0))
        
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        shapeLayer.lineWidth = 10.0
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 0.1
        
        shapeLayer.position = CGPoint(x: 10, y: view.bounds.midY)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        shapeLayer.removeAllAnimations()
        shapeLayer.removeFromSuperlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

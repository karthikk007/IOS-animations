//
//  AnimatePositionViewController.swift
//  animations
//
//  Created by Karthik Kumar on 31/01/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class AnimatePositionViewController: UIViewController {
    
    var childView = UIView()
    
    var layer: CALayer {
        return childView.layer
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addSubviews()
        setupLayer()
    }
    
    private func addSubviews() {
        view.addSubview(childView)
        childView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.isUserInteractionEnabled = false
        view.isUserInteractionEnabled = false
        
        view.addConstraint(NSLayoutConstraint(item: childView, attribute: .bottom, relatedBy: .equal,
                                              toItem: view, attribute: .bottom, multiplier: 1, constant: -10))
        view.addConstraint(NSLayoutConstraint(item: childView, attribute: .centerX, relatedBy: .equal,
                                              toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: childView, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200))
        view.addConstraint(NSLayoutConstraint(item: childView, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200))
    }
    
    private func setupLayer() {
        layer.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        layer.borderWidth = 50
        layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10.0
        layer.cornerRadius = 10
        layer.contents = UIImage(named: "star")?.cgImage
        layer.contentsGravity = kCAGravityCenter
    }
    
    private func animate() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = [childView.frame.midX, childView.frame.midY]
        animation.toValue = [view.frame.midX, view.layoutMargins.top + childView.bounds.height/2 + 10]
        animation.duration = 5
        animation.repeatCount = Float.infinity
        animation.autoreverses = true

        layer.position = CGPoint(x: view.frame.midX, y: view.layoutMargins.top + childView.bounds.height/2 + 10)
        layer.add(animation, forKey: "animatePosition")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        layer.removeAllAnimations()
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

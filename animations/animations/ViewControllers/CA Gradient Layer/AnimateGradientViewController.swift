//
//  AnimateGradientViewController.swift
//  animations
//
//  Created by Karthik Kumar on 01/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class AnimateGradientViewController: UIViewController {

    var gradientLayer = CAGradientLayer()
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    private func animate() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.0, 0.2]
        animation.toValue = [0.8, 1.0, 1.0]
        animation.duration = 2
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        
        gradientLayer.add(animation, forKey: "locations")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
    }
    
    func setupViews() {
        let color1: UIColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        let color2: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let color3: UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor, color1.cgColor]
        gradientLayer.locations = [0.0, 0.0, 0.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.transform = CATransform3DRotate(gradientLayer.transform, CGFloat.pi / 2, 0, 0, 1)
        gradientLayer.frame = view.frame

        layer.insertSublayer(gradientLayer, below: layer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        gradientLayer.removeFromSuperlayer()
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

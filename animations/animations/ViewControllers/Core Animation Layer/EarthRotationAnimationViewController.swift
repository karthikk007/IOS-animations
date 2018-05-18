//
//  EarthRotationAnimationViewController.swift
//  animations
//
//  Created by Karthik Kumar on 01/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class EarthRotationAnimationViewController: UIViewController {
    
    var earthImageView = UIImageView()

    var childView = UIView()
    
    var earthLayer: CALayer {
        return earthImageView.layer
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
        earthImageView.contentMode = .scaleAspectFit
        earthImageView.clipsToBounds = true
        earthImageView.image = #imageLiteral(resourceName: "PNGPIX-COM-Earth-PNG-Transparent-Image")
                
        view.addSubview(earthImageView)
        
        earthImageView.translatesAutoresizingMaskIntoConstraints = false

        view.addConstraint(NSLayoutConstraint(item: earthImageView, attribute: .top, relatedBy: .equal,
                                              toItem: view, attribute: .bottom, multiplier: 1, constant: -150))
        view.addConstraint(NSLayoutConstraint(item: earthImageView, attribute: .centerX, relatedBy: .equal,
                                              toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: earthImageView, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 600))
        view.addConstraint(NSLayoutConstraint(item: earthImageView, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 600))
    }
    
    private func animate() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = Float.pi * 2
        animation.duration = 300
        animation.repeatCount = Float.infinity
//        animation.autoreverses = true
        
        earthLayer.add(animation, forKey: "rotation")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        earthLayer.removeAllAnimations()
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

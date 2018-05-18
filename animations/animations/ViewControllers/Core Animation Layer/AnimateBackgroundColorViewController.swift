//
//  AnimateBackgroundColorViewController.swift
//  animations
//
//  Created by Karthik Kumar on 31/01/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class AnimateBackgroundColorViewController: UIViewController {
    
    var layer: CALayer {
        return view.layer
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        layer.removeAllAnimations()
    }
    
    private func animate() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.fromValue = view.backgroundColor
        animation.toValue = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor
        animation.duration = 2
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        
        layer.add(animation, forKey: "backgroundColor")
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

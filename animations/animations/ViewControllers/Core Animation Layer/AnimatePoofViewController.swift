//
//  AnimatePoofViewController.swift
//  animations
//
//  Created by Karthik Kumar on 02/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class AnimatePoofViewController: UIViewController {
    
    var imageView = UIImageView()

    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSubview()
    }
    
    func addSubview() {
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal,
                                              toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal,
                                              toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    func animate() {
        imageView.animationImages = [#imageLiteral(resourceName: "poof1"),#imageLiteral(resourceName: "poof2"),#imageLiteral(resourceName: "poof3"),#imageLiteral(resourceName: "poof4"),#imageLiteral(resourceName: "poof5")]
        imageView.animationDuration = 0.6
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        imageView.stopAnimating()
        imageView.removeFromSuperview()
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

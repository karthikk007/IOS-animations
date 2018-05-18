//
//  PinchRotateGestureTransfromViewController.swift
//  animations
//
//  Created by Karthik Kumar on 01/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class PinchRotateGestureTransfromViewController: UIViewController {

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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinchView))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(didRotateView))
        childView.addGestureRecognizer(tapGesture)
        childView.addGestureRecognizer(pinchGesture)
        childView.addGestureRecognizer(rotateGesture)
    }
    
    @objc
    func didRotateView(_ sender: UIRotationGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
        sender.rotation = 0
    }
    
    @objc
    func didTapView(_ sender: UITapGestureRecognizer) {
        layer.shadowOpacity = layer.shadowOpacity == 0.7 ? 0.3 : 0.7
    }
    
    @objc
    func didPinchView(_ gestureRecognizer: UIPinchGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let borderWidth: CGFloat = layer.borderWidth * gestureRecognizer.scale
            
            gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale,
                                                                                            y: gestureRecognizer.scale))!
            if layer.frame.width > 300 {
                layer.borderWidth = 100
            } else {
                layer.borderWidth = borderWidth
            }
            
            layer.cornerRadius = layer.frame.width / 2
            
            gestureRecognizer.scale = 1.0

        }
    }
    
    private func addSubviews() {
        view.addSubview(childView)
        childView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(NSLayoutConstraint(item: childView, attribute: .centerY, relatedBy: .equal,
                                              toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: childView, attribute: .centerX, relatedBy: .equal,
                                              toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: childView, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300))
        view.addConstraint(NSLayoutConstraint(item: childView, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300))
        
    }
    
    private func setupLayer() {
        layer.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        layer.borderWidth = 100
        layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10.0
        layer.cornerRadius = 0
        layer.contents = UIImage(named: "star")?.cgImage
        layer.contentsGravity = kCAGravityCenter
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

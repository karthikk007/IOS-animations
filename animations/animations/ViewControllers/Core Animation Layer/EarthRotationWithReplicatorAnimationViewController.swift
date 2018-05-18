//
//  EarthRotationWithReplicatorAnimationViewControllerr.swift
//  animations
//
//  Created by Karthik Kumar on 01/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class EarthRotationWithReplicatorAnimationViewController: UIViewController {
    
    var earthImageView = UIImageView()
    var emitterLayer = CAEmitterLayer()

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
    
    private func setupEmitterLayer() {
        
        emitterLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        emitterLayer.emitterShape = kCAEmitterLayerSphere
        emitterLayer.emitterSize = CGSize(width: view.frame.height, height: view.frame.height)
        emitterLayer.zPosition = -1
        
        var cells = [CAEmitterCell]()
        cells = getStarEmitterCells()
            + getStarClusterEmitterCells()
            + getWhiteStarEmitterCells()
            + getStarCluster1EmitterCells()
        
        emitterLayer.emitterCells = cells
        
        
        
        
//        emitterLayer.emitterCells = [cell]
        
        view.layer.addSublayer(emitterLayer)
    }
    
    private func getStarEmitterCells() -> [CAEmitterCell] {
        return (0..<1).map { _ in
            let cell = CAEmitterCell()
            cell.birthRate = 1
            
            cell.lifetime = 25
            cell.lifetimeRange = 100
            
            cell.velocity = 10
            cell.velocityRange = 50
            
            cell.scale = 0.1
            cell.scaleRange = 0.2
            
            cell.emissionRange = CGFloat.pi * 2
            
            cell.spin = 0.0
            cell.spinRange = CGFloat.pi / 4
            
            cell.zAcceleration = 500
            //            cell.redRange = 1.0
            //            cell.greenRange = 1.0
            //            cell.blueRange = 1.0
            //
            //            cell.redSpeed = 0.0
            //            cell.greenSpeed = 0.0
            //            cell.blueSpeed = 0.0
            
            cell.alphaSpeed = -0.01
            cell.alphaRange = -0.1
            
            cell.contents = #imageLiteral(resourceName: "Stars-Free-Download-PNG (1)").cgImage //UIImage(named: "RadialGradient.png")!.cgImage
            return cell
        }
    }
    
    private func getWhiteStarEmitterCells() -> [CAEmitterCell] {
        return (0..<1).map { _ in
            let cell = CAEmitterCell()
            cell.birthRate = 0.5
            
            cell.lifetime = 25
            cell.lifetimeRange = 100
            
            cell.velocity = 10
            cell.velocityRange = 50
            
            cell.scale = 0.005
            cell.scaleRange = 0.01
            
            cell.emissionRange = CGFloat.pi * 2
            
            cell.spin = 0.0
            cell.spinRange = CGFloat.pi / 4
            
            cell.zAcceleration = 500
            //            cell.redRange = 1.0
            //            cell.greenRange = 1.0
            //            cell.blueRange = 1.0
            //
            //            cell.redSpeed = 0.0
            //            cell.greenSpeed = 0.0
            //            cell.blueSpeed = 0.0
            
            cell.contents = #imageLiteral(resourceName: "Star_empty").cgImage //UIImage(named: "RadialGradient.png")!.cgImage
            return cell
        }
    }
    
    private func getStarClusterEmitterCells() -> [CAEmitterCell] {
        return (0..<1).map { _ in
            let cell = CAEmitterCell()
            cell.birthRate = 1
            
            cell.lifetime = 25
            cell.lifetimeRange = 100
            
            cell.velocity = 10
            cell.velocityRange = 50
            
            cell.scale = 0.20
            cell.scaleRange = 0.40
            
            cell.emissionRange = CGFloat.pi * 2
            
            cell.spin = 0.0
            cell.spinRange = CGFloat.pi / 4
            
            cell.zAcceleration = 500
            //            cell.redRange = 1.0
            //            cell.greenRange = 1.0
            //            cell.blueRange = 1.0
            //
            //            cell.redSpeed = 0.0
            //            cell.greenSpeed = 0.0
            //            cell.blueSpeed = 0.0
            
            cell.contents = #imageLiteral(resourceName: "star-bg.png").cgImage //UIImage(named: "RadialGradient.png")!.cgImage
            return cell
        }
    }
    
    private func getStarCluster1EmitterCells() -> [CAEmitterCell] {
        return (0..<1).map { _ in
            let cell = CAEmitterCell()
            cell.birthRate = 1
            
            cell.lifetime = 25
            cell.lifetimeRange = 100
            
            cell.velocity = 10
            cell.velocityRange = 50
            
            cell.scale = 0.10
            cell.scaleRange = 0.20
            
            cell.emissionRange = CGFloat.pi * 2
            
            cell.spin = 0.0
            cell.spinRange = CGFloat.pi / 4
            
            cell.zAcceleration = 500
            //            cell.redRange = 1.0
            //            cell.greenRange = 1.0
            //            cell.blueRange = 1.0
            //
            //            cell.redSpeed = 0.0
            //            cell.greenSpeed = 0.0
            //            cell.blueSpeed = 0.0
            cell.alphaRange = 1.0
            cell.alphaSpeed = 0.1
            
            cell.contents = #imageLiteral(resourceName: "star").cgImage //UIImage(named: "RadialGradient.png")!.cgImage
            return cell
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
        setupEmitterLayer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        earthLayer.removeAllAnimations()
        emitterLayer.removeFromSuperlayer()
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

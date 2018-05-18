//
//  LineModel.swift
//  animations
//
//  Created by Karthik Kumar on 09/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import Foundation
import UIKit

struct LineModel {
    var startPoint: CGPoint
    var endPoint: CGPoint
    var lineColor: UIColor
    var shapeLayer: CAShapeLayer
    
    func drawLine() {
        let path = CGMutablePath()
        path.addLines(between: [startPoint, endPoint])

        shapeLayer.path = path
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineWidth = 5.0
        
    }
}

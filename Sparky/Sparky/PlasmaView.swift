//
//  PlasmaView.swift
//  Sparky
//
//  Created by Mike Laursen on 11/22/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit
//import CoreGraphics

class PlasmaView: UIView {
    static let colors = [UIColor.blue, UIColor.cyan, UIColor.green, UIColor.magenta, UIColor.purple, UIColor.red, UIColor.white]
    
    var color: UIColor = UIColor.white
    var touch: UITouch? = nil
    var touchPoint: CGPoint? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        assert(touches.count == 1)
        if touches.count == 1 {
            color = PlasmaView.colors.randomElement() ?? UIColor.white
            touch = touches.first
            touchPoint = touch?.location(in: self)
            self.setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchToTrack = touch {
            if touches.contains(touchToTrack) {
                print("----- Touch moved. -----")
            }
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        if let mostRecentTouchPoint = touchPoint {
            color.set()
            let path = UIBezierPath()
            path.lineWidth = 3.0
            path.move(to: self.center)
            path.addLine(to: mostRecentTouchPoint)
            path.stroke()
        }
    }
}

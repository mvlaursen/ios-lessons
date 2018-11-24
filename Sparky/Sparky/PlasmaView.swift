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
    
    var color: UIColor = UIColor.black
    var touch: UITouch? = nil
    var touchPoint: CGPoint? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        assert(touches.count == 1)
        if touches.count == 1 {
            color = PlasmaView.colors.randomElement() ?? UIColor.white
            touch = touches.first
            touchPoint = touch?.location(in: self)
            self.setNeedsDisplay()
        } else {
            super.touchesBegan(touches, with: event)
        }
    }
    
    func stopTrackingTouch() {
        color = UIColor.black
        touch = nil
        touchPoint = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        var didHandleCancel = false
        
        if let touch = self.touch {
            if touches.contains(touch) {
                stopTrackingTouch()
                didHandleCancel = true
            }
        }
        
        if !didHandleCancel {
            super.touchesCancelled(touches, with: event)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var didHandleEnd = false
        
        if let touch = self.touch {
            if touches.contains(touch) {
                stopTrackingTouch()
                didHandleEnd = true
            }
        }

        if !didHandleEnd {
            super.touchesEnded(touches, with: event)
        }
    }

    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        var didHandleUpdate = false
        
        if let touch = self.touch {
            if touches.contains(touch) {
                touchPoint = touch.location(in: self)
                didHandleUpdate = true
            }
        }
        
        if !didHandleUpdate {
            super.touchesEstimatedPropertiesUpdated(touches)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var didHandleMove = false
        
        if let touch = self.touch {
            if touches.contains(touch) {
                touchPoint = touch.location(in: self)
                self.setNeedsDisplay()
                didHandleMove = true
            }
        }
        
        if !didHandleMove {
            super.touchesMoved(touches, with: event)
        }
    }
}

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
    
    struct TouchMemory {
        let color: UIColor
        let touch: UITouch
        var touchPoint: CGPoint
        
        init(color: UIColor, touch: UITouch, touchPoint: CGPoint) {
            self.color = color
            self.touch = touch
            self.touchPoint = touchPoint
        }
    }
    
    var touchMemories: [TouchMemory] = []
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        if touchMemories.count > 0 {
            touchMemories[0].color.set()
            let path = UIBezierPath()
            path.lineWidth = 3.0
            path.move(to: self.center)
            path.addLine(to: touchMemories[0].touchPoint)
            path.stroke()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        assert(touches.count == 1)
        if touches.count == 1 {
            if let touch = touches.first {
                let touchMemory = TouchMemory(color: PlasmaView.colors.randomElement() ?? UIColor.white, touch: touch, touchPoint: touch.location(in: self))
                touchMemories = [touchMemory]
                self.setNeedsDisplay()
            }
        } else {
            super.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        var didHandleCancel = false
        
        if touchMemories.count > 0 {
            if touches.contains(touchMemories[0].touch) {
                touchMemories = []
                didHandleCancel = true
            }
        }
        
        if !didHandleCancel {
            super.touchesCancelled(touches, with: event)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var didHandleEnd = false
        
        if touchMemories.count > 0 {
            if touches.contains(touchMemories[0].touch) {
                touchMemories = []
                didHandleEnd = true
            }
        }

        if !didHandleEnd {
            super.touchesEnded(touches, with: event)
        }
    }

    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        var didHandleUpdate = false
        
        if touchMemories.count > 0 {
            if touches.contains(touchMemories[0].touch) {
                touchMemories[0].touchPoint = touchMemories[0].touch.location(in: self)
                didHandleUpdate = true
            }
        }
        
        if !didHandleUpdate {
            super.touchesEstimatedPropertiesUpdated(touches)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var didHandleMove = false
        
        if touchMemories.count > 0 {
            if touches.contains(touchMemories[0].touch) {
                touchMemories[0].touchPoint = touchMemories[0].touch.location(in: self)
                self.setNeedsDisplay()
                didHandleMove = true
            }
        }
        
        if !didHandleMove {
            super.touchesMoved(touches, with: event)
        }
    }
}

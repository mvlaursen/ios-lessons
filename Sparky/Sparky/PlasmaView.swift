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
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        for touchMemory in touchMemories {
            touchMemory.color.set()
            let path = UIBezierPath()
            path.lineWidth = 3.0
            path.move(to: self.center)
            path.addLine(to: touchMemory.touchPoint)
            print("-----> \(touchMemory.touchPoint)")
            path.stroke()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        assert(touches.count == 1)
        if touches.count == 1 {
            if let touch = touches.first {
                let touchMemory = TouchMemory(color: PlasmaView.colors.randomElement() ?? UIColor.white, touch: touch, touchPoint: touch.location(in: self))
                touchMemories.append(touchMemory)
                self.setNeedsDisplay()
            }
        } else {
            super.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        super.touchesEstimatedPropertiesUpdated(touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var hadAtLeastOneMove = false
        
        for i in 0..<touchMemories.count {
            if touches.contains(touchMemories[i].touch) {
                touchMemories[i].touchPoint = touchMemories[i].touch.location(in: self)
                hadAtLeastOneMove = true
            }
        }
        
        if hadAtLeastOneMove {
            self.setNeedsDisplay()
        }
    }
}

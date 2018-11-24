//
//  PlasmaView.swift
//  Sparky
//
//  Created by Mike Laursen on 11/22/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit

class PlasmaView: UIView {
    static let colors = [UIColor.blue, UIColor.cyan, UIColor.green, UIColor.magenta, UIColor.purple, UIColor.red, UIColor.white]
    
    struct TouchMemory: Hashable {
        let color: UIColor
        let isActive: Bool
        let time: TimeInterval
        let touch: UITouch
        let touchPoint: CGPoint
        
        init(color: UIColor, isActive: Bool, touch: UITouch, touchPoint: CGPoint) {
            self.color = color
            self.isActive = isActive
            self.time = NSDate().timeIntervalSince1970
            self.touch = touch
            self.touchPoint = touchPoint
        }
        
        func copy(newTouchPoint: CGPoint) -> TouchMemory {
            return TouchMemory(color: color, isActive: isActive, touch: touch, touchPoint: newTouchPoint)
        }
        
        func inactiveCopy() -> TouchMemory {
            return TouchMemory(color: color, isActive: false, touch: touch, touchPoint: touchPoint)
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(time)
        }
    }
    
    var timer: Timer? = nil
    var touchMemories = Set<TouchMemory>()
    
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

    func updateOnTimer(timer: Timer) {
        for touchMemory in self.touchMemories {
            if !touchMemory.isActive && NSDate().timeIntervalSince1970 - touchMemory.time > 2.0 {
                self.touchMemories.remove(touchMemory)
            }
        }
        
        if touchMemories.count > 0 {
            self.setNeedsDisplay()
        } else {
            self.timer?.invalidate()
            self.timer = nil
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        assert(touches.count == 1)
        if touches.count == 1 {
            if let touch = touches.first {
                let touchMemory = TouchMemory(color: PlasmaView.colors.randomElement() ?? UIColor.white, isActive: true, touch: touch, touchPoint: touch.location(in: self))
                touchMemories.insert(touchMemory)

                if timer == nil {
                    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateOnTimer)
                }
            }
        } else {
            super.touchesBegan(touches, with: event)
        }
    }
    
    func endTouches(_ touches: Set<UITouch>) {
        for touchMemory in touchMemories {
            if touches.contains(touchMemory.touch) {
                touchMemories.remove(touchMemory)
                touchMemories.insert(touchMemory.inactiveCopy())
            }
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        endTouches(touches)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        endTouches(touches)
    }

    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        super.touchesEstimatedPropertiesUpdated(touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touchMemory in touchMemories {
            if touches.contains(touchMemory.touch) {
                touchMemories.remove(touchMemory)
                touchMemories.insert(touchMemory.copy(newTouchPoint: touchMemory.touch.location(in: self)))
            }
        }
    }
}

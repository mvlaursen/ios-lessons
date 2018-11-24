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
    
    static let fadeTime = 2.0

    var maxLightningOffset: CGFloat? = nil
    var timer: Timer? = nil
    var touchMemories = Set<TouchMemory>()
    
    func lightningifyLine(start: CGPoint, end: CGPoint) -> [CGPoint] {
        if maxLightningOffset == nil {
            maxLightningOffset = self.frame.width / CGFloat(10.0)
        }
        
        let xLength: CGFloat = end.x - start.x
        let yLength: CGFloat = end.y - start.y
        
        let numPoints = 10
        var points: [CGPoint] = []

        for i in 1..<numPoints{
            var xOffset = CGFloat(i) * xLength / CGFloat(numPoints)
            xOffset = xOffset + CGFloat.random(in: -0.2...0.2) * (maxLightningOffset ?? 0.0)
            var yOffset = CGFloat(i) * yLength / CGFloat(numPoints)
            yOffset = yOffset + CGFloat.random(in: -0.2...0.2) * (maxLightningOffset ?? 0.0)
            points.append(CGPoint(x: start.x + xOffset, y: start.y + yOffset))
        }
        
        points.append(end)
        return points
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        for touchMemory in touchMemories {
            touchMemory.color.set()
            let path = UIBezierPath()
            path.lineWidth = 3.0
            
            var alpha = 1.0
            if !touchMemory.isActive {
                alpha = max(0.0, (PlasmaView.fadeTime - (NSDate().timeIntervalSince1970 - touchMemory.time)) / PlasmaView.fadeTime)
            }

            let points = lightningifyLine(start: self.center, end: touchMemory.touchPoint)
            path.move(to: self.center)
            
            for point in points {
                path.addLine(to: point)
            }
            
            path.stroke(with: .normal, alpha: CGFloat(alpha))
        }
    }

    func updateOnTimer(timer: Timer) {
        for touchMemory in self.touchMemories {
            if !touchMemory.isActive && NSDate().timeIntervalSince1970 - touchMemory.time > PlasmaView.fadeTime {
                self.touchMemories.remove(touchMemory)
            }
        }
        
        if touchMemories.count > 0 {
            self.setNeedsDisplay()
        } else {
            self.timer?.invalidate()
            self.timer = nil
            self.setNeedsDisplay()
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

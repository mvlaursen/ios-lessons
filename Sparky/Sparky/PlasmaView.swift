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
    
    var mostRecentTap: CGPoint? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
    }
    
    @objc func onTap(tapGestureRecognizer: UITapGestureRecognizer) {
        if tapGestureRecognizer.state == .recognized {
            mostRecentTap = tapGestureRecognizer.location(in: self)
            self.setNeedsDisplay()
        }
    }

        // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        if let tap = mostRecentTap {
            PlasmaView.colors.randomElement()?.set()
            
            let path = UIBezierPath()
            path.lineWidth = 3.0
            path.move(to: self.center)
            path.addLine(to: tap)
            path.stroke()
        }
    }
}

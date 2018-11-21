//
//  ViewController.swift
//  Sparky
//
//  Created by Mike Laursen on 11/21/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onTap(tapGestureRecognizer: UITapGestureRecognizer) {
        if tapGestureRecognizer.state == .recognized {
            let location = tapGestureRecognizer.location(in: self.view)
            print("tap at: \(location)")
        }
    }
}


//
//  ViewController.swift
//  SimpleTwo
//
//  Created by Mike Laursen on 2/7/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func enter(_ sender: Any) {
        label.text = textField.text
        self.resignFirstResponder()
    }

    @IBAction func hide(_ sender: Any) {
        imageView.isHidden = true
    }
    
    @IBAction func show(_ sender: Any) {
        imageView.isHidden = false
    }
}


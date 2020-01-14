//
//  ViewController.swift
//  OnDemandResourcesTest
//
//  Created by Mike Laursen on 1/13/20.
//  Copyright © 2020 Appamajigger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundleResourceRequest = NSBundleResourceRequest(tags: ["Onboarding"])
        bundleResourceRequest.beginAccessingResources { (error: Error?) in
            if error != nil {
                abort()
            }

            let image = UIImage(named: "Onboarding0")
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
     }

    @IBAction func next(_ sender: UIButton) {
        let bundleResourceReqeust = NSBundleResourceRequest(tags: ["Level1"])
        bundleResourceReqeust.beginAccessingResources { (error: Error?) in
            if error != nil {
                abort()
            }

            let image = UIImage(named: "Level10")
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
}


//
//  ViewController.swift
//  cheesuschrist
//
//  Created by Marisa Gomez on 9/9/16.
//  Copyright © 2016 Marisa Gomez. All rights reserved.
//

import UIKit

class BeginTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Force the device in portrait mode when the view controller gets loaded
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKey: "orientation")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        // Lock autorotate
        return false
    }
    
//    func supportedInterfaceOrientations() -> Int {
//        // Only allow Portrait
//        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
//    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        // Only allow Portrait
        return UIInterfaceOrientation.Portrait
    }
}


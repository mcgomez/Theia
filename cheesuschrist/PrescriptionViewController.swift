//
//  PrescriptionViewController.swift
//  cheesuschrist
//
//  Created by Marisa Gomez on 9/10/16.
//  Copyright © 2016 Marisa Gomez. All rights reserved.
//

import Foundation
import UIKit

class PrescriptionViewController: UIViewController {
    @IBOutlet weak var odprescription: UILabel!
    @IBOutlet weak var osprescription: UILabel!
    @IBOutlet weak var prescriptionDescription: UILabel!
    var prescription: [String: String] = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Force the device in portrait mode when the view controller gets loaded
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeLeft.rawValue, forKey: "orientation")
        
        odprescription.text = Array(prescription.keys)[0]
        osprescription.text = Array(prescription.values)[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        // Lock autorotate
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        // Only allow Landscape
        return [.LandscapeLeft, .LandscapeRight]
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        // Only allow Landscape
        return UIInterfaceOrientation.LandscapeLeft
    }
}

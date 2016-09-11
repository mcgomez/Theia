//
//  ExplanationViewController.swift
//  cheesuschrist
//
//  Created by Marisa Gomez on 9/10/16.
//  Copyright © 2016 Marisa Gomez. All rights reserved.
//

import Foundation
import UIKit

class InstructionViewController: UIViewController {
    @IBOutlet weak var lowerLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var begin: UIButton!
    @IBOutlet weak var boxImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Force the device in portrait mode when the view controller gets loaded
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeLeft.rawValue, forKey: "orientation")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func beginTest(sender: AnyObject) {
        begin.hidden = true
        middleLabel.hidden = true
        lowerLabel.hidden = true
        boxImage.hidden = true
        cTest()
    }
    
    func cTest() {
        
//        print("\(imageName)\(imageScales[index])-S.png")
        
        // Start Algorithm
//        imageView.image = UIImage(named: "\(imageName)\(imageScales[index])-S.png")
//        imageView.frame = CGRectMake(self.view.center.x, self.view.center.y, 700, 700)
//        self.view.addSubview(imageView)
    }
    
    func finishTest() {
        self.performSegueWithIdentifier("showPrescription", sender: nil)
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
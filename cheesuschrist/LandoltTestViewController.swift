//
//  LandoltTestViewController.swift
//  cheesuschrist
//
//  Created by Marisa Gomez on 9/11/16.
//  Copyright © 2016 Marisa Gomez. All rights reserved.
//

import Foundation
import UIKit

class LandoltTestViewController: UIViewController {
    
    var imageView: UIImageView!
    
    var imageName: String = "Landolt_"
    var imageScales: [String] = ["300", "240", "200", "180", "140", "120", "100", "90", "80", "70", "60", "50", "40", "30", "25", "20"]
    var index: Int = 0
    var wrongAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Force the device in landscape mode when the view controller gets loaded
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeLeft.rawValue, forKey: "orientation")
        cTest()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func cTest() {
        
        // Start Algorithm
        imageView = UIImageView(image: UIImage(named: "\(imageName)\(imageScales[index])-S.png"))
        imageView.frame = CGRectMake(self.view.center.x - 376/2, self.view.center.y - 376/2, 376, 376)
        self.view.addSubview(imageView)
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
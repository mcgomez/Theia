//
//  EyeCoverInstructionsViewController.swift
//  cheesuschrist
//
//  Created by Marisa Gomez on 9/11/16.
//  Copyright © 2016 Marisa Gomez. All rights reserved.
//

import Foundation
import UIKit

class EyeCoverInstructionsViewController: UIViewController {
    
    var eyeCoverGif: UIImageView?
    var rightEye: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightEye = true
        let gif: UIImage = UIImage.gifWithName("RotateLeft")!
        eyeCoverGif = UIImageView(image: gif)
        eyeCoverGif?.frame = CGRectMake(self.view.center.x - 100, self.view.center.y - 100, 200, 200)
        self.view.addSubview(eyeCoverGif!)
        
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeLeft.rawValue, forKey: "orientation")
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

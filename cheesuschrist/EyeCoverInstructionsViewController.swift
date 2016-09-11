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
    var leftEye: Bool = false
    var prescription: [String: String] = [String: String]()
    
    @IBOutlet weak var upperLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (rightEye) {
            upperLabel.text = "Please cover your left eye with the attached eye cover."
            leftEye = true
            
            let gif: UIImage = UIImage.gifWithName("RotateLeft")!
            eyeCoverGif = UIImageView(image: gif)
            eyeCoverGif?.frame = CGRectMake(self.view.center.x - 100, self.view.center.y - 100, 200, 200)
            self.view.addSubview(eyeCoverGif!)
        } else {
            rightEye = true
            
            let gif: UIImage = UIImage.gifWithName("RotateRight")!
            eyeCoverGif = UIImageView(image: gif)
            eyeCoverGif?.frame = CGRectMake(self.view.center.x - 100, self.view.center.y - 100, 200, 200)
            self.view.addSubview(eyeCoverGif!)
        }
        
        
        
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeLeft.rawValue, forKey: "orientation")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showTest") {
            let nextController: LandoltTestViewController = segue.destinationViewController as! LandoltTestViewController
            if (leftEye) {
                nextController.leftDone = true
            } else {
                nextController.rightDone = true
            }
            nextController.prescription = prescription
        }
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

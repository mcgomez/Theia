//
//  QuestionaireViewController.swift
//  cheesuschrist
//
//  Created by Marisa Gomez on 9/10/16.
//  Copyright © 2016 Marisa Gomez. All rights reserved.
//

import Foundation
import UIKit

class QuestionaireViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    var questions: [String] = [String]()
    var response: [String: String] = [String: String]()
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add questions
        questions.append("Are you pregnant or nursing?")
        questions.append("Do you have any of the following chronic health conditions: diabetes, heart disease, high blood pressure or migraines with visual distortions?")
        questions.append("Are you currently experiencing any pain, discomfort or sudden loss of vision with your eyes?")
        questions.append("Are you currently experiencing any type of eye disease or had eye surgery within the past 12 months?")
        
        questionLabel.text = questions[index]
        
        // Force the device in portrait mode when the view controller gets loaded
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKey: "orientation")
    }
    
    @IBAction func answer(sender: AnyObject) {
        // Increment index
        index += 1
        
        if (index == questions.count) {
            let alert = UIAlertController(title: "Begin Test", message: "Place your phone into the headset to complete the test.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                self.performSegueWithIdentifier("finishedQuestions", sender: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            // Update question and save response
            questionLabel.text = questions[index]
            
            if (sender as! UIButton == yesButton) {
                response.updateValue("yes", forKey: questions[index])
                let alert = UIAlertController(title: "Sorry", message: "We cannot provide you with an accurate prescription", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                    self.dismissViewControllerAnimated(false, completion: nil)
                    
                    let mainViewController: BeginTestViewController = BeginTestViewController()
                    
                    self.presentViewController(mainViewController, animated: true, completion: nil)
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                response.updateValue("no", forKey: questions[index])
            }
        }
    }
    
    override func shouldAutorotate() -> Bool {
        // Lock autorotate
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        // Only allow Portrait
        return [.Portrait]
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        // Only allow Portrait
        return UIInterfaceOrientation.Portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
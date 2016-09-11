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
    var rightDone: Bool?
    var leftDone: Bool?
    var imageView: UIImageView!
    var prescription: [String: String] = [String: String]()
    var prescriptionToSend: [String: String] = [String: String]()
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var imageName: String = "Landolt_"
    var imageScales: [String] = ["300", "240", "200", "180", "140", "120", "100", "90", "80", "70", "60", "50", "40", "30", "25", "20"]
    var prescriptionConversion: [String: String] = [
        "300": "-4.00",
        "240": "-3.75",
        "200": "-3.50'",
        "180": "-3.25",
        "140": "-3.00",
        "120": "-2.75",
        "100": "-2.50",
        "90": "-2.25",
        "80": "-2.00",
        "70": "-1.75",
        "60": "-1.50",
        "50": "-1.25",
        "40": "-1.00",
        "30": "-0.75",
        "25": "-.50",
        "20": "0.00"
    ]
    var index: Int = 10
    var wrongAnswers: Int = 0
    var rightAnswers: Int = 0
    var correctAnswer: Int?
    var increasingSharp : Bool?
    
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

    @IBAction func topPressed(sender: AnyObject) {
        let userAnswer = 2
        checkUserAnswer(userAnswer)
    }
    @IBAction func rightPressed(sender: AnyObject) {
        let userAnswer = 3
        checkUserAnswer(userAnswer)
    }
    @IBAction func bottomPressed(sender: AnyObject) {
        let userAnswer = 0
        checkUserAnswer(userAnswer)
    }
    @IBAction func leftPressed(sender: AnyObject) {
        let userAnswer = 1
        checkUserAnswer(userAnswer)
    }
    
    func checkUserAnswer(userAnswer: Int){
        print("UserAnswer: \(userAnswer)")
        print(increasingSharp)
        if(increasingSharp != nil){
            if(increasingSharp!){
                if(userAnswer != correctAnswer){
                    wrongAnswers += 1
                    if(wrongAnswers >= 2){
                        index -= 1
                        calculatePrescription()
                    }
                } else {
                    index += 1
                    wrongAnswers = 0
                }
            } else {
                if(userAnswer != correctAnswer){
                    index -= 1
                    rightAnswers = 0
                } else {
                    rightAnswers += 1
                    if(rightAnswers > 2){
                        index += 1
                        calculatePrescription()
                    }
                }
            }
        }
        
        if(index == 10){
            if(userAnswer != correctAnswer){
                wrongAnswers += 1
                increasingSharp = false;
            } else {
                increasingSharp = true;
                index += 1;
            }
        }
        cTest()
    }
    
    func calculatePrescription(){
        print("Prescription: \(index)")
        
        if ((leftDone) != nil) {
            let value: String = imageScales[index - 1]
//            prescriptionToSend = [Array(prescriptionConversion.values)[value]: Array(prescription.values)[0]]
            prescriptionToSend = [prescriptionConversion[value]!: Array(prescription.values)[0]]
            self.performSegueWithIdentifier("showPrescription", sender: self)
        } else {
            // Test done, switch eyes if needed
            self.performSegueWithIdentifier("changeEyes", sender: self)
        }
        
        index = 10
    }
    
    func cTest() {
        
        // Start Algorithm
        if(index < 0 || index >= imageScales.count){
            calculatePrescription()
        }
        imageView.removeFromSuperview()
        
        imageView = UIImageView(image: UIImage(named: "\(imageName)\(imageScales[index])-S.png"))
        imageView.frame = CGRectMake(self.view.center.x - 376/2, self.view.center.y - 376/2, 376, 376)
        self.view.addSubview(imageView)
        var rotateScale = Int(arc4random_uniform(3))
        while (correctAnswer != nil && rotateScale == correctAnswer){
            rotateScale = Int(arc4random_uniform(3))
        }
        
        print(rotateScale)
        imageView.transform = CGAffineTransformMakeRotation(CGFloat(rotateScale)*CGFloat(M_PI)/2.0)
        correctAnswer = rotateScale

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "changeEyes") {
            let nextController: EyeCoverInstructionsViewController = segue.destinationViewController as! EyeCoverInstructionsViewController
            nextController.rightEye = true
            let value: String = imageScales[index - 1]
            nextController.prescription = ["": "\(prescriptionConversion[value]!)"]
        } else if (segue.identifier == "showPrescription") {
            let nextController: PrescriptionViewController = segue.destinationViewController as! PrescriptionViewController
            nextController.prescription = prescriptionToSend
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
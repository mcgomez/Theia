//
//  ExplanationViewController.swift
//  cheesuschrist
//
//  Created by Marisa Gomez on 9/10/16.
//  Copyright © 2016 Marisa Gomez. All rights reserved.
//

import Foundation
import UIKit

class TestsViewController: UIViewController {
    @IBOutlet weak var lowerLabel: UILabel!
    @IBOutlet weak var upperLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var upLabel: UILabel!
    @IBOutlet weak var leftlabel: UILabel!
    @IBOutlet weak var downLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var begin: UIButton!
   
    var imageName: String = "Landolt_"
    var imageScales: [String] = ["300", "240", "200", "180", "140", "120", "100", "90", "80", "70", "60", "50", "40", "30", "25", "20"]
    var index: Int = 0
    var wrongAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func beginTest(sender: AnyObject) {
        begin.hidden = true
        upperLabel.hidden = true
        lowerLabel.hidden = true
        cTest()
    }
    
    func cTest() {
        rightLabel.hidden = false
        leftlabel.hidden = false
        downLabel.hidden = false
        upLabel.hidden = false
        
        // Start Algorithm
        imageView.image = UIImage(named: "\(imageName)\(imageScales[index])-S.png")
        imageView.frame = CGRectMake(self.view.center.x, self.view.center.y, 700, 700)
        self.view.addSubview(imageView)
//        xoTest()
    }
    
//    func xoTest() {
//        rightLabel.hidden = true
//        leftlabel.hidden = true
//        downLabel.hidden = true
//        upLabel.hidden = true
//        
//        oneLabel.hidden = false
//        twoLabel.hidden = false
//        threeLabel.hidden = false
//        fourLabel.hidden = false
//        
//        linesTest()
//    }
//    
//    func linesTest() {
//        oneLabel.hidden = true
//        twoLabel.hidden = true
//        threeLabel.hidden = true
//        fourLabel.hidden = true
//        
//        finishTest()
//    }
    
    func finishTest() {
        self.performSegueWithIdentifier("showPrescription", sender: nil)
    }
}
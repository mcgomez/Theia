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
    var tests: [String] = ["c", "xo", "lines"]
    
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var upLabel: UILabel!
    @IBOutlet weak var leftlabel: UILabel!
    @IBOutlet weak var downLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func beginTest(sender: AnyObject) {
        cTest()
    }
    
    func cTest() {
        rightLabel.hidden = false
        leftlabel.hidden = false
        downLabel.hidden = false
        upLabel.hidden = false
        
        xoTest()
    }
    
    func xoTest() {
        rightLabel.hidden = true
        leftlabel.hidden = true
        downLabel.hidden = true
        upLabel.hidden = true
        
        oneLabel.hidden = false
        twoLabel.hidden = false
        threeLabel.hidden = false
        fourLabel.hidden = false
        
        linesTest()
    }
    
    func linesTest() {
        oneLabel.hidden = true
        twoLabel.hidden = true
        threeLabel.hidden = true
        fourLabel.hidden = true
        
        finishTest()
    }
    
    func finishTest() {
        self.performSegueWithIdentifier("showPrescription", sender: nil)
    }
}
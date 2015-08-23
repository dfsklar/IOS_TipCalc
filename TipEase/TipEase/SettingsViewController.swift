//
//  SettingsViewController.swift
//  TipEase
//
//  Created by David Sklar on 8/22/15.
//  Copyright (c) 2015 David Sklar. All rights reserved.
//

import UIKit

public struct GlobalConstants {
    static let keyname = "default_tip_perc"
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var returnToMain: UIButton!
    @IBOutlet weak var defaultTipDisplay: UILabel!
    @IBOutlet weak var sliderDefaultPerc: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        var val = defaults.integerForKey(GlobalConstants.keyname)
        if (val < 15) {
            val = 15;
        }
        defaultTipDisplay.text = String(val) + "%";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doReturnToMain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func didChangeTipPercentage(sender: AnyObject) {
        let enteredTipPerc = Int(sliderDefaultPerc.value * 100.0);
        println(enteredTipPerc)
        // Persist!
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(enteredTipPerc, forKey: GlobalConstants.keyname)
        defaults.synchronize()
        // Feedback
        defaultTipDisplay.text = String(enteredTipPerc) + "%";
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

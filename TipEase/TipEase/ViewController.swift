//
//  ViewController.swift
//  TipEase
//
//  Created by David Sklar on 8/21/15.
//  Copyright (c) 2015 David Sklar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputTable: UITableView!
    @IBOutlet weak var progressDisplayer: UIProgressView!
    @IBOutlet weak var happinessSlider: UISlider!
    @IBOutlet weak var amountEntryBox: UITextField!
    @IBOutlet weak var outputTotalDisplay: UILabel!
    @IBOutlet weak var outputTipDisplay: UILabel!
    @IBOutlet weak var feedbackTipPercentage: UILabel!

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    var enteredAmountInDollars : Float = 0.00;
    var enteredTipPerc : Int = 15;
    var numberFormatter = NSNumberFormatter();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberFormatter.positiveFormat = "0.00";
    }
    
    func recompute() {
        // Now obtain the tip amount and do the final calculation
        let tip = Float(enteredTipPerc) * enteredAmountInDollars / 100.0;
        outputTipDisplay.text = numberFormatter.stringFromNumber(tip);
        outputTotalDisplay.text = numberFormatter.stringFromNumber(enteredAmountInDollars + tip);
    }

    @IBAction func onBillAmountChanged(sender: UITextField) {
        // Update the "smart text field" by automatically converting the entered
        // stream of digits into a DDDD.CC floating-point representation.
        let textStrippedOfDots = amountEntryBox.text.stringByReplacingOccurrencesOfString(
            ".",
            withString: "",
            options: NSStringCompareOptions.LiteralSearch, range: nil);
        if let enteredAmountInCents = textStrippedOfDots.toInt() {
            enteredAmountInDollars = Float(enteredAmountInCents) / 100.0;
        }
        amountEntryBox.text = numberFormatter.stringFromNumber(enteredAmountInDollars);

        recompute();
    }
    
    @IBAction func onHappySliderChanged(sender: UISlider) {
        enteredTipPerc = Int(happinessSlider.value * 100.0);
        feedbackTipPercentage.text = String(enteredTipPerc) + "%";
        recompute();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func recompute() {
        let xyz : Float = Float(334) / 10.0;
        let textStrippedOfDots = amountEntryBox.text.stringByReplacingOccurrencesOfString(
            ".",
            withString: "",
            options: NSStringCompareOptions.LiteralSearch, range: nil);

        if let enteredAmountInCents = textStrippedOfDots.toInt() {
            let enteredAmountInDollars = (Float(enteredAmountInCents) / 100.0);
            let nf = NSNumberFormatter()
            nf.numberStyle = .DecimalStyle
            // Configure the number formatter to your liking
            let s2 = nf.stringFromNumber(enteredAmountInDollars);
            amountEntryBox.text = s2;
            println(enteredAmountInDollars);
        }
    }

    @IBAction func onBillAmountChanged(sender: UITextField) {
        println("HERE");
        self.recompute();
    }
    
    
    @IBAction func onHappySliderChanged(sender: UISlider) {
        let valFloat = happinessSlider.value;
        print(valFloat);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


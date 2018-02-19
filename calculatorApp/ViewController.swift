//
//  ViewController.swift
//  calculatorApp
//
//  Created by Chris Zhu on 2018-02-19.
//  Copyright © 2018 Chris Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var numberOnScreen: Double = 0;
    var previousNum: Double = 0;
    var operation = 0;
    var performingMath = false;
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if (performingMath) {
        
                label.text = "."
                numberOnScreen = Double(label.text!)!;
                performingMath = false;
            
        } else {
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!;
 
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if (label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17) {
            
            previousNum = Double(label.text!)!;
            switch sender.tag {
            case 15: label.text = "+";
            case 14: label.text = "-";
            case 13: label.text = "x";
            case 12: label.text = "/";
                
                
            default:label.text = label.text;
            }
            operation = sender.tag;
            performingMath = true;
        } else if (sender.tag == 16) {
            switch operation{
            case 15: label.text = String(previousNum + numberOnScreen);
            case 14: label.text = String(previousNum - numberOnScreen);
            case 13: label.text = String(previousNum * numberOnScreen);
            case 12: label.text = String(previousNum / numberOnScreen);
            default:label.text = label.text;
            }
        } else if (sender.tag == 11) {
            label.text = "0";
            previousNum = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


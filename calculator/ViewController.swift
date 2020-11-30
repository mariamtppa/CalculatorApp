//
//  ViewController.swift
//  calculator
//
//  Created by Decagon on 31/08/2020.
//  Copyright © 2020 Decagon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayResult: UILabel!
    
    
    var result: Double = 0
    var holdPreviousDigit: Double = 0
    var performOperation = false
    var operatorInUse = 0
    
    
    @IBAction func digits(_ sender: UIButton) {
        if performOperation == true {
            displayResult.text = String(sender.tag - 2)
            result = Double(displayResult.text!)!
            performOperation = false
        } else {
            displayResult.text = displayResult.text! + String(sender.tag - 2)
            result = Double(displayResult.text!)!
        }
        
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if displayResult.text != "" && sender.tag != 12 && sender.tag != 19
            {
                holdPreviousDigit = Double(displayResult.text!)!
                
                if sender.tag == 13 {
                    displayResult.text = String(-(Int(holdPreviousDigit)))
                }
                if sender.tag == 14 {
                    displayResult.text = "%"
                }
                else if sender.tag == 15 {
                    displayResult.text = "÷"
                }
                else if sender.tag == 16 {
                    displayResult.text = "x"
                }
                else if sender.tag == 17 {
                    displayResult.text = "-"
                    
                }
                else if sender.tag == 18 {
                    displayResult.text = "+"
                }
                else if sender.tag == 20 {
                    displayResult.text = String(Int(holdPreviousDigit)) + "."
                }
                operatorInUse = sender.tag
                performOperation = true
            }
                
            else if sender.tag == 19
            {
                if operatorInUse == 14 {
                    displayResult.text = String(Int(holdPreviousDigit) % Int(result))
                }
                else if operatorInUse == 15 {
                    displayResult.text = String(holdPreviousDigit / result)
                }
                else if operatorInUse == 16 {
                    displayResult.text = String(holdPreviousDigit * result)
                }
                else if operatorInUse == 17 {
                    displayResult.text = String(holdPreviousDigit - result)
                }
                else if operatorInUse == 18 {
                    displayResult.text = String(holdPreviousDigit + result)
                }
                else if operatorInUse == 13 {
                    displayResult.text = String(-(Int(holdPreviousDigit)))
                }
                
            }
            
            else if sender.tag == 12 {
                displayResult.text = ""
                holdPreviousDigit = 0
                result = 0
               operatorInUse = 0
            }
        }

        override func viewDidLoad() {
            super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
    
        override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        }

}


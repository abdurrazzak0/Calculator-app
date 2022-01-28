//
//  ViewController.swift
//  CalcApps
//
//  Created by Newgen Brl on 13/1/20.
//  Copyright © 2020 Newgen Brl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var onScreenValue : Double = 0
    var previousValue : Double = 0
    var performAction = false
    var operation = 0
    
    
    @IBOutlet weak var Label: UILabel!
    @IBAction func DigitAction(_ sender: UIButton) {
        if performAction == true{
            Label.text = String(sender.tag - 1)
            onScreenValue = Double(Label.text!)!
            performAction = false
        }else{
            Label.text = Label.text! + String(sender.tag - 1)
            onScreenValue = Double(Label.text!)!
        }
        
    }
    
    
    @IBAction func ActionView(_ sender: UIButton) {
        if Label.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousValue = Double(Label.text!)!
            
            if sender.tag == 12{
                Label.text = "/"
            }else if sender.tag == 13{
                Label.text = "*"
            }else if sender.tag == 14{
                Label.text = "-"
            }else if sender.tag == 15{
                Label.text = "+"
            }
            
            operation = sender.tag
            performAction = true
            
            
        }else if sender.tag == 16{
            if operation == 12{
                Label.text = String(previousValue / onScreenValue)
            }else if operation == 13{
                Label.text = String(previousValue * onScreenValue)
            }else if operation == 14{
                Label.text = String(previousValue - onScreenValue)
            }else if operation == 15{
                Label.text = String(previousValue + onScreenValue)
            }
        }else if sender.tag == 11{
            Label.text = ""
            performAction = false
            onScreenValue = 0
            previousValue = 0
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


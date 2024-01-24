//
//  ViewController.swift
//  Odev5_Hesap_Makinesi
//
//  Created by Furkan Eren on 27.11.2023.
//

import UIKit

class ViewController: UIViewController {
 
//    First  num ,second num operator, haveResult
    var firstNum: String = ""
    var operation:String = ""
    var secondNum: String = ""
    var haveResult: Bool = false
    var resultnumber : String = ""
    var numAfterResult: String = ""
    
    @IBOutlet var calcButtons: [UIButton]!
    @IBOutlet weak var numOnScreen: UILabel!
    
    
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == ""{
            firstNum = firstNum + String(sender.tag)
            numOnScreen.text = firstNum
        }
        else if operation != "" && !haveResult{
            secondNum = String(sender.tag)
            numOnScreen.text = secondNum
        }
        else if operation != "" && haveResult{
            numAfterResult = numAfterResult + String(sender.tag)
            numOnScreen.text = numAfterResult
        }
    }
    
    @IBAction func addFunc(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func minusFunc(_ sender: Any) {
        operation = "-"
    }
    
    @IBAction func multiplyFunc(_ sender: Any) {
        operation = "X"
    }
    
    @IBAction func divideFunc(_ sender: Any) {
        operation = "/"
    }
    
    
    @IBAction func resultFunc(_ sender: Any) {
        resultnumber = String(doOperation())
        numOnScreen.text = resultnumber
        numAfterResult = ""
    }
    
    func doOperation() -> Int{
        if operation == "+"{
            if !haveResult{
                haveResult = true
                return Int(firstNum)! + Int(secondNum)!
            }
            else {
                return Int(resultnumber)! + Int(numAfterResult)!
            }
        }
        else if operation == "-"{
            if !haveResult{
                haveResult = true
                return Int(firstNum)! - Int(secondNum)!
            }
            else {
                return Int(resultnumber)! - Int(numAfterResult)!
            }
        }
        else if operation == "X"{
            if !haveResult{
                haveResult = true
                return Int(firstNum)! * Int(secondNum)!
            }
            else {
                return Int(resultnumber)! * Int(numAfterResult)!
            }
        }
        else if operation == "/"{
            if !haveResult{
                haveResult = true
                return Int(firstNum)! / Int(secondNum)!
            }
            else {
                return Int(resultnumber)! / Int(numAfterResult)!
            }
        }
        
        return 0
    }
    
    
    @IBAction func clear(_ sender: Any) {
         firstNum = ""
         operation = ""
         secondNum = ""
         haveResult = false
         resultnumber  = ""
         numAfterResult = ""
        numOnScreen.text = "0"
    }
    
    @IBAction func funcSum(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in calcButtons{
            button.titleLabel?.font = UIFont(name: "System", size: 24)
        }
        
    }


}


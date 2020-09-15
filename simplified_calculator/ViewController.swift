//
//  ViewController.swift
//  simplified_calculator
//
//  Created by Pincheng Huang on 2020/9/15.
//

import UIKit

class ViewController: UIViewController {
    
    var first: Double? = 0
    var second: Double? = 0
    var sum: Double? = 0
    
    @IBOutlet weak var Result: UITextField!
    
    
    @IBOutlet weak var firstNumber: UITextField!
    
    
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var calculator: UISegmentedControl!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    // 點擊鍵盤外的區域，即可收起鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
 
    }
    
    // 宣告 加減乘除 的功能，搭配 元件 UI Segmented Controller
    func calculation() {
            if calculator.selectedSegmentIndex == 0 {
                sum! = first! + second!
                
                } else if calculator.selectedSegmentIndex == 1 {
                    sum! = first! - second!
                    
                } else if calculator.selectedSegmentIndex == 2 {
                    sum! = first! * second!
                    
                } else if calculator.selectedSegmentIndex == 3 {
                    sum! = first! / second!
                    
                }
        
        }
        

    @IBAction func calculate(_ sender: UISegmentedControl) {
        
        first = Double(firstNumber.text!)!
        second = Double(secondNumber.text!)!
        
        if firstNumber.text != nil && secondNumber.text != nil {

            
            calculation()
            
            Result.text = String(format: "%.2f", sum!)
        }
    }
    
    
}


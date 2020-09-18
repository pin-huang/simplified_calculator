//
//  ViewController.swift
//  simplified_calculator
//
//  Created by Pincheng Huang on 2020/9/15.
//

import UIKit

class ViewController: UIViewController {
    
    var first: Double? = 0 // 宣告變數，型別為 Double 的 optional ，預設值為 0
    var second: Double? = 0
    var sum: Double? = 0
    
    // 顯示計算結果
    @IBOutlet weak var Result: UITextField!
    
    // 輸入欄位一
    @IBOutlet weak var firstNumber: UITextField!
    
    // 輸入欄位二
    @IBOutlet weak var secondNumber: UITextField!
    
    // 加減乘除 的計算功能選擇器 (搭配 元件 UI Segmented Controller)
    @IBOutlet weak var calculator: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    // 點擊鍵盤外的區域，即可收起鍵盤，並執行計算
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
        
        first = Double(firstNumber.text!) // Double("") 生成的東西有可能是 nil，所以下面要加 if... 判斷式，確保不會閃退
        second = Double(secondNumber.text!)
        
        if first != nil && second != nil {
            calculation() // 在呼叫計算功能之前，必須先判斷 first、second 欄位是否有值，才可避免閃退
        }
    }
    
    // 宣告 加減乘除 的計算功能，搭配 元件 UI Segmented Controller
    func calculation() {
            if calculator.selectedSegmentIndex == 0 {
                sum = first! + second!
                
                } else if calculator.selectedSegmentIndex == 1 {
                    sum = first! - second!
                    
                } else if calculator.selectedSegmentIndex == 2 {
                    sum = first! * second!
                    
                } else if calculator.selectedSegmentIndex == 3 {
                    sum = first! / second!
                    
                }
                Result.text = String(format: "%.2f", sum!)
        
            }
        

    @IBAction func calculate(_ sender: UISegmentedControl) {
        first = Double(firstNumber.text!) // Double("") 生成的東西有可能是 nil，所以下面要加 if... 判斷式，確保不會閃退
        second = Double(secondNumber.text!)
        
        if first != nil && second != nil {
            calculation()
        }
    }
    
    @IBAction func firstText(_ sender: UITextField) {
        firstNumber.text = sender.text
    }
    
    @IBAction func secondText(_ sender: UITextField) {
        secondNumber.text = sender.text
    }
    
    
}


//
//  ViewController.swift
//  CalculatorExample
//
//  Created by 김시훈 on 2023/02/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var operatorTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNumberTextField.delegate = self
        secondNumberTextField.delegate = self
        operatorTextField.delegate = self
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        
        let firstNum = Double(firstNumberTextField.text!)
        let secondNum = Double(secondNumberTextField.text!)
        
        if sender.currentTitle == "Reset" {
            
            firstNumberTextField.text = ""
            secondNumberTextField.text = ""
            operatorTextField.text = ""
            resultLabel.text = "Result"
            sender.setTitle("Calculate", for: .normal)
            
        } else if let x = firstNum ,let y = secondNum ,
                 let z = operatorTextField.text{
            switch z {
                case "+":
                    resultLabel.text = String(x + y)
                sender.setTitle("Reset", for: .normal)
                case "-":
                    resultLabel.text = String(x - y)
                sender.setTitle("Reset", for: .normal)
                case "*":
                    resultLabel.text = String(x * y)
                sender.setTitle("Reset", for: .normal)
                case "/":
                    resultLabel.text = String(x / y)
                sender.setTitle("Reset", for: .normal)
                default:
                    break
                }
            }
        }
    //버튼 한번 = 계산 버튼 두번 =리셋
    //사칙연산 좌 중 우 (1 + 1)
    //계산값 Label에 표시
    // + 계산 히스토리
    // 2/14
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if firstNumberTextField.text != ""
            && operatorTextField.text == "" {
            firstNumberTextField.resignFirstResponder()
            operatorTextField.becomeFirstResponder()
        }
        else if firstNumberTextField.text != ""
                    && operatorTextField.text != ""{
            firstNumberTextField.resignFirstResponder()
            secondNumberTextField.becomeFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstNumberTextField.resignFirstResponder()
        operatorTextField.resignFirstResponder()
        secondNumberTextField.resignFirstResponder()
    }
}

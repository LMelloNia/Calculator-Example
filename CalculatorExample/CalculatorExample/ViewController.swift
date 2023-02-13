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
//    var btnCount: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        var firstNum = Double(firstNumberTextField.text!)!
        var secondNum = Double(secondNumberTextField.text!)!
//        if btnCount % 2 == 0{
            switch operatorTextField.text {
            case .none:
                break
            case .some(let x):
                switch x {
                case "+":
                    resultLabel.text = String(firstNum + secondNum)
                case "-":
                    resultLabel.text = String(firstNum - secondNum)
                case "*":
                    resultLabel.text = String(firstNum * secondNum)
                case "/":
                    resultLabel.text = String(firstNum / secondNum)
                default:
                    break
                }
            }
//        }
    }
    //버튼 한번 = 계산 버튼 두번 =리셋
    //사칙연산 좌 중 우 (1 + 1)
    //계산값 Label에 표시
    // + 계산 히스토리
    // 2/14

}


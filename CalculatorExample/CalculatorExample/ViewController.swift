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
    @IBOutlet weak var calculatorHistoryTableView: UITableView!
    
    var calculatorHistorys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorHistoryTableView.delegate = self
        calculatorHistoryTableView.dataSource = self
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        
        let firstNum = Double(firstNumberTextField.text ?? "")
        let secondNum = Double(secondNumberTextField.text ?? "")
        
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
                calculatorHistorys.append("\(x) \(z) \(y) = \(x+y)")
            case "-":
                resultLabel.text = String(x - y)
                sender.setTitle("Reset", for: .normal)
                calculatorHistorys.append("\(x) \(z) \(y) = \(x-y)")
            case "*":
                resultLabel.text = String(x * y)
                sender.setTitle("Reset", for: .normal)
                calculatorHistorys.append("\(x) \(z) \(y) = \(x*y)")
            case "/":
                resultLabel.text = String(x / y)
                sender.setTitle("Reset", for: .normal)
                calculatorHistorys.append("\(x) \(z) \(y) = \(x/y)")
            default:
                break
            }
        }
        
        calculatorHistoryTableView.reloadData()
    }
    
    @IBAction func calculatorHistoryReset(_ sender: UIButton) {
        calculatorHistorys = []
        calculatorHistoryTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return calculatorHistorys.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.calculatorHistoryLabel.text = calculatorHistorys[indexPath.row]
        return cell
    }
    
}

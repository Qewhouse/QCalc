//
//  CaclManager.swift
//  QCalc
//
//  Created by Alexander Altman on 16.03.2023.
//

import UIKit

class CalcManager {
    
    //MARK: Properties
    var isRunning = true
    var firstNumber = 0.0
    var secondNumber = 0.0
    var currentNumber = "0"
    var result = ""
    var currentOperation = Operation.noAction
    var displayView: ViewController
    
    init(displayView: ViewController) {
        self.displayView = displayView
    }
    
    //MARK: Methods
    
    func makeCalculation(operation: Operation) {
        if currentOperation != .noAction {
            if currentNumber != "" {
                secondNumber = Double(currentNumber) ?? 0.0
                switch operation {
                case .addition:
                    result = String(firstNumber + secondNumber)
                case .substraction:
                    result = String(firstNumber - secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                case .multiplication:
                    result = String(firstNumber * secondNumber)
                default:
                    break
                }
                
                firstNumber = Double(result)!
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(Double(result)!))
                }
                currentNumber = result
                displayView.updateDisplay(text: currentNumber)
                currentOperation = .noAction
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            displayView.updateDisplay(text: currentNumber)
            currentOperation = operation
        }
    }
    
    func numberAction(number: Int) {
        if currentNumber != "0" {
            currentNumber.append(String(number))
            displayView.updateDisplay(text: currentNumber)
        } else {
            currentNumber = String(number)
            displayView.updateDisplay(text: currentNumber)
        }
    }
    
    func addition() {
        makeCalculation(operation: .addition)
    }
    
    func substraction() {
        makeCalculation(operation: .substraction)
    }
    
    func division() {
        makeCalculation(operation: .division)
    }
    
    func multiplication() {
        makeCalculation(operation: .multiplication)
    }
    
    func makeResult() {
        makeCalculation(operation: currentOperation)
    }
    
    func acAction() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        result = ""
        currentOperation = Operation.noAction
        displayView.updateDisplay(text: currentNumber)
    }
    
    func changeSign() {
        var temp = currentNumber
        if temp.contains("-") {
            let sign = ["-"]
            temp = String(temp.filter { !sign.contains(String($0)) })
            displayView.updateDisplay(text: temp)
            currentNumber = temp
        } else {
            temp = "-" + currentNumber
            displayView.updateDisplay(text: temp)
            currentNumber = temp
        }
    }
    
    func percent() {
        currentNumber = String(Double(currentNumber)! / 100)
        displayView.updateDisplay(text: currentNumber)
        result = currentNumber
        firstNumber = Double(result)!
    }
    
    func dot() {
        if currentNumber.contains(".") {
            return
        } else {
            currentNumber += "."
            displayView.updateDisplay(text: currentNumber)
        }
    }
}

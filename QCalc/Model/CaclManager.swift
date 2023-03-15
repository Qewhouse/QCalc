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
    func updateDisplay(text: String) {
        print(text)
    }
    
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
                    result = ""
                }
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            updateDisplay(text: currentNumber)
            currentOperation = operation
        }
        print(
    """
    \n
    -----------------------------------
    current number = \(currentNumber)
    first = \(firstNumber)
    second = \(secondNumber)
    result = \(result)
    -----------------------------------
    """
        )
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
        updateDisplay(text: currentNumber)
    }
}

//
//  ViewController.swift
//  QCalc
//
//  Created by Alexander Altman on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Views
    private let display = UITextField()
    private let mainVStack = UIStackView()
    private let displayView = UIView()
    
    //MARK: Properties
    var service: CalcManager?

    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = .black
        service = CalcManager(displayView: self)
        view.backgroundColor = Appcolor.background
      
        configureAppearance()
    }
    


    //MARK: Methods
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
    
    @objc func buttonPrssed(_ sender: UIButton) {
        switch sender.tag {
        case 0...9:
            service?.numberAction(number: sender.tag)
        case 10:
            service?.dot()
        case 11:
            service?.makeResult()
        case 12:
            service?.addition()
        case 13:
            service?.substraction()
        case 14:
            service?.multiplication()
        case 15:
            service?.acAction()
        case 16:
            service?.changeSign()
        case 17:
            service?.percent()
        case 18:
            service?.division()
        default:
            break
        }
    }
}

//MARK: View Controller private Methods
private extension ViewController {
    func configureAppearance() {
        setupDisplayView()
        setupButtons()
        setupMainVStack()
    }
    
    func setupMainVStack() {
        mainVStack.axis = .vertical
        mainVStack.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth, height: Constants.screenHeight - 60)
        mainVStack.backgroundColor = .clear
        self.view.addSubview(mainVStack)
    }
    
    func setupDisplayView() {
        displayView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: Constants.screenWidth,
                                   height: Constants.screenHeight - (82 * 5) - 60 - 30)
        displayView.backgroundColor = .clear
        
        display.frame = CGRect(x: 15,
                               y: 15,
                               width: displayView.frame.width - 30,
                               height: displayView.frame.height - 15)
        display.textAlignment = .right
        display.contentVerticalAlignment = .bottom
        display.text = "0"
        display.textColor = .white
        display.font = UIFont.boldSystemFont(ofSize: 80)
        display.isEnabled = false
        display.adjustsFontSizeToFitWidth = true
        display.minimumFontSize = 30
        display.backgroundColor = .clear
        
        displayView.addSubview(display)
        mainVStack.addSubview(displayView)
    }
    func setupLine1() {
        let line1 = createHStack(yPosition: Int(displayView.frame.height) + 0)
       
        let acButton = createButton(order: 0, title: "AC", tag: 15)
        acButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        acButton.backgroundColor = Appcolor.topButtons
        acButton.setTitleColor(.black, for: .normal)
        line1.addSubview(acButton)
       
        let changeSignButton = createButton(order: 1, title: "+/-", tag: 16)
        changeSignButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        changeSignButton.backgroundColor = Appcolor.topButtons
        changeSignButton.setTitleColor(.black, for: .normal)
        line1.addSubview(changeSignButton)
        
        let percentButton = createButton(order: 2, title: "%", tag: 17)
        percentButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        percentButton.backgroundColor = Appcolor.topButtons
        percentButton.setTitleColor(.black, for: .normal)
        line1.addSubview(percentButton)
        
        let divideButton = createButton(order: 3, title: "/", tag: 18)
        divideButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        divideButton.backgroundColor = Appcolor.actions
        divideButton.setTitleColor(.black, for: .normal)
        line1.addSubview(divideButton)
        
        mainVStack.addSubview(line1)
    }
    
    func setupLine2() {
        let line2 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 2)
        
        let sevenButton = createButton(order: 0, title: "7", tag: 7)
        sevenButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line2.addSubview(sevenButton)
        
        let eightButton = createButton(order: 1, title: "8", tag: 8)
        eightButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line2.addSubview(eightButton)
        
        let nineButton = createButton(order: 2, title: "9", tag: 9)
        nineButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line2.addSubview(nineButton)
        
        let multiplyButton = createButton(order: 3, title: "*", tag: 14)
        multiplyButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        multiplyButton.backgroundColor = Appcolor.actions
        multiplyButton.setTitleColor(.black, for: .normal)
        line2.addSubview(multiplyButton)
        
        mainVStack.addSubview(line2)
    }
    
    
    func setupLine3() {
        let line3 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 4)
        
        let fourButton = createButton(order: 0, title: "4", tag: 4)
        fourButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line3.addSubview(fourButton)
        
        let fiveButton = createButton(order: 1, title: "5", tag: 5)
        fiveButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line3.addSubview(fiveButton)
        
        let sixButton = createButton(order: 2, title: "6", tag: 6)
        sixButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line3.addSubview(sixButton)
        
        let substractButton = createButton(order: 3, title: "-", tag: 13)
        substractButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        substractButton.backgroundColor = Appcolor.actions
        substractButton.setTitleColor(.black, for: .normal)
        line3.addSubview(substractButton)
        
        mainVStack.addSubview(line3)
    }
    
    func setupLine4() {
        let line4 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 80 + 6)
        
        let oneButton = createButton(order: 0, title: "1", tag: 1)
        oneButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line4.addSubview(oneButton)
        
        let twoButton = createButton(order: 1, title: "2", tag: 2)
        twoButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line4.addSubview(twoButton)
        
        let threeButton = createButton(order: 2, title: "3", tag: 3)
        threeButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line4.addSubview(threeButton)
        
        let addButton = createButton(order: 3, title: "+", tag: 12)
        addButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        addButton.backgroundColor = Appcolor.actions
        addButton.setTitleColor(.black, for: .normal)
        line4.addSubview(addButton)
        
        mainVStack.addSubview(line4)
    }
    
    func setupLine5() {
        let line5 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 80 + 80 + 8)
        
        let zeroButton = createButton(order: 0, title: "0", tag: 0)
        zeroButton.frame = CGRect(x: 2, y: 0, width: Int(Constants.screenWidth / 4) * 2 - 2, height: 80)
        zeroButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line5.addSubview(zeroButton)
        
        let dotButton = createButton(order: 2, title: ".", tag: 10)
        dotButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line5.addSubview(dotButton)
        
        let equalButton = createButton(order: 3, title: "=", tag: 11)
        equalButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        equalButton.backgroundColor = Appcolor.actions
        equalButton.setTitleColor(.black, for: .normal)
        line5.addSubview(equalButton)
        
        mainVStack.addSubview(line5)
    }
    
    func setupButtons() {
setupLine1()
        setupLine2()
        setupLine3()
        setupLine4()
        setupLine5()
    }
    
    func createButton(order: Int, title: String, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: (0 + Int(Constants.screenWidth / 4) * order + 1), // #warning ("in tutorial + 2")
                                            y: 0,
                                            width: Int(Constants.screenWidth) / 4 - 2,
                                            height: 80))
        button.setTitle(title, for: .normal)
        button.backgroundColor = Appcolor.buttons
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.tag = tag
        return button
    }
    
    func createHStack(yPosition: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: yPosition, width: Int(Constants.screenWidth), height: 80)
        return stack
    }
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 12 Pro Max")
            .previewDisplayName("iPhone 12 Pro Max")
        
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = ViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> ViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}


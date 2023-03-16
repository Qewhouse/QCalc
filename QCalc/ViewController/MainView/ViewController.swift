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
        
        service = CalcManager(displayView: self)
        view.backgroundColor = .systemOrange
      
        configureAppearance()
    }

    //MARK: Methods
    private func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
    
    @objc func buttonPrssed(_ sender: UIButton) {
        print(sender.tag)
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
        mainVStack.backgroundColor = .cyan
        self.view.addSubview(mainVStack)
    }
    
    func setupDisplayView() {
        displayView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: Constants.screenWidth,
                                   height: Constants.screenHeight - (82 * 5) - 60 - 30)
        displayView.backgroundColor = .darkGray
        
        display.frame = CGRect(x: 15,
                               y: 15,
                               width: displayView.frame.width - 30,
                               height: displayView.frame.height - 15)
        display.textAlignment = .right
        display.contentVerticalAlignment = .bottom
        display.text = "0"
        display.textColor = .white
        display.font = UIFont.boldSystemFont(ofSize: 80)
        display.backgroundColor = .green
        
        displayView.addSubview(display)
        mainVStack.addSubview(displayView)
    }
    func setupLine1() {
        let line1 = createHStack(yPosition: Int(displayView.frame.height) + 0)
        let acButton = createButton(order: 0, title: "AC", tag: 15)
        acButton.addTarget(self, action: #selector(buttonPrssed(_:)), for: .touchUpInside)
        line1.addSubview(acButton)
        line1.addSubview(createButton(order: 1, title: "+/-", tag: 16))
        line1.addSubview(createButton(order: 2, title: "%", tag: 17))
        line1.addSubview(createButton(order: 3, title: "/", tag: 18))
        mainVStack.addSubview(line1)
    }
    
    func setupLine2() {
        let line2 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 2)
        line2.addSubview(createButton(order: 0, title: "7", tag: 4))
        line2.addSubview(createButton(order: 1, title: "8", tag: 5))
        line2.addSubview(createButton(order: 2, title: "9", tag: 6))
        line2.addSubview(createButton(order: 3, title: "*", tag: 7))
        mainVStack.addSubview(line2)
    }
    
    
    func setupLine3() {
        let line3 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 4)
        line3.addSubview(createButton(order: 0, title: "4", tag: 8))
        line3.addSubview(createButton(order: 1, title: "5", tag: 9))
        line3.addSubview(createButton(order: 2, title: "6", tag: 10))
        line3.addSubview(createButton(order: 3, title: "-", tag: 11))
        mainVStack.addSubview(line3)
    }
    
    func setupLine4() {
        let line4 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 80 + 6)
        line4.addSubview(createButton(order: 0, title: "1", tag: 12))
        line4.addSubview(createButton(order: 1, title: "2", tag: 13))
        line4.addSubview(createButton(order: 2, title: "3", tag: 14))
        line4.addSubview(createButton(order: 3, title: "+", tag: 15))
        mainVStack.addSubview(line4)
    }
    
    func setupLine5() {
        let line5 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 80 + 80 + 8)
        let zeroButton = createButton(order: 0, title: "0", tag: 16)
        zeroButton.frame = CGRect(x: 2, y: 0, width: Int(Constants.screenWidth / 4) * 2 - 2, height: 80)
        line5.addSubview(zeroButton)
        
        line5.addSubview(createButton(order: 2, title: ".", tag: 18))
        line5.addSubview(createButton(order: 3, title: "=", tag: 19))
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
        button.backgroundColor = .brown
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


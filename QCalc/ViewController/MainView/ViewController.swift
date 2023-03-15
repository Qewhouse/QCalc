//
//  ViewController.swift
//  QCalc
//
//  Created by Alexander Altman on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    var service: CalcManager?

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = CalcManager(displayView: self)
        view.backgroundColor = .systemOrange
      
    }

    //MARK: Methods
    private func updateDisplay(text: String) {
        print(text)
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


//
//  ViewController.swift
//  GenerateRandomNumberBetweenTwoValues
//
//  Created by Salman Biljeek on 3/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    let startNum: Int = 1
    let endNum: Int = 10
    lazy var label1: UILabel = {
        let label = UILabel()
        label.text = "\(self.startNum) to \(self.endNum)"
        label.font = .monospacedSystemFont(ofSize: 30, weight: .regular)
        label.textColor = .label
        return label
    }()
    lazy var label2: UILabel = {
        let label = UILabel()
        label.text = "->"
        label.font = .monospacedSystemFont(ofSize: 30, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    let randomNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedSystemFont(ofSize: 30, weight: .heavy)
        label.textColor = .systemPink
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        let titleLabel1: UILabel = {
            let label = UILabel()
            label.text = "Generate Random Number"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 25, weight: .bold)
            label.textColor = .systemPink
            return label
        }()
        let titleLabel2: UILabel = {
            let label = UILabel()
            label.text = "between two values"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 22)
            label.textColor = .secondaryLabel
            return label
        }()
        
        let randomInt = getRandomIntBetween(startNum: self.startNum, endNum: self.endNum)
        let randomDouble = getRandomDoubleBetween(startNum: Double(self.startNum), endNum: Double(self.endNum))
        
        randomNumberLabel.text = String(randomInt)
        
        let stack1 = UIStackView(arrangedSubviews: [
            titleLabel1,
            titleLabel2
        ])
        stack1.axis = .vertical
        stack1.spacing = 0
        stack1.alignment = .center
        stack1.isLayoutMarginsRelativeArrangement = true
        stack1.layoutMargins = .init(top: 0, left: 0, bottom: 15, right: 0)
        
        let stack2 = UIStackView(arrangedSubviews: [
            label1,
            label2,
            randomNumberLabel
        ])
        stack2.axis = .horizontal
        stack2.spacing = 30
        stack2.alignment = .center
        
        let mainStack = UIStackView(arrangedSubviews: [
            stack1,
            stack2
        ])
        mainStack.axis = .vertical
        mainStack.spacing = 10
        mainStack.alignment = .center
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(mainStack)
        mainStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
    }
    
    func getRandomIntBetween(startNum: Int, endNum: Int) -> Int {
        guard startNum < endNum else { return startNum }
        let randomInt = Int.random(in: startNum..<endNum)
        return randomInt
    }
    
    func getRandomDoubleBetween(startNum: Double, endNum: Double) -> Double {
        guard startNum < endNum else { return startNum }
        let randomDouble = Double.random(in: startNum..<endNum)
        return randomDouble
    }
}

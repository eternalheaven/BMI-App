//
//  ViewController.swift
//  PracticeApp
//
//  Created by Alexandr Khrutskiy on 25/01/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private func configureNavBar() {
        navigationItem.title = "Расчет индекса массы тела"
    }
//    private var ageText: UITextField?
//    private var heightText: UITextField?
//    private var weightText: UITextField?
//    private var genderText: UITextField?
    private var ageText, heightText, weightText, genderText, trainText: UITextField?
    private var ageInput, heightInput, weightInput, trainInput: UITextView?
    private var genderSC, trainSC: UISegmentedControl?
    private var resultButton: UIButton?
    private var resultLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        
    }
}


extension ViewController {
    private func commonInit() {
        ageField()
        heightField()
        weightField()
        genderField()
        trainField()
        ageFieldInput()
        heightFieldInput()
        weightFieldInput()
        genderSCInput()
        trainSCInput()
        addResultButton()
        addResultLabel()
    }
    private func ageField() {
        var ageText: UITextField = UITextField(frame: CGRect(x: 40, y: 80, width: 100, height: 50))
        ageText.text? = "Возраст"
        view.addSubview(ageText)
        self.ageText = ageText
    }
    
    private func heightField() {
        var heightText: UITextField = UITextField(frame: CGRect (x: 40, y: 150, width: 100, height: 50))
        heightText.text? = "Рост"
        view.addSubview(heightText)
        self.heightText = heightText
    }
    
    private func weightField() {
        var weightText: UITextField = UITextField(frame: CGRect (x: 40, y: 220, width: 100, height: 50))
        weightText.text? = "Вес"
        view.addSubview(weightText)
        self.weightText = weightText
    }
    
    private func genderField() {
        var genderText: UITextField = UITextField(frame: CGRect (x: 40, y: 290, width: 100, height: 50))
        genderText.text? = "Пол"
        view.addSubview(genderText)
        self.genderText = genderText
    }
    
    private func trainField() {
        var trainText: UITextField = UITextField(frame: CGRect (x: 40, y: 360, width: 250, height: 50))
        trainText.text? = "Тренировки"
        view.addSubview(trainText)
        self.trainText = trainText
    }
}

extension ViewController {
    private func ageFieldInput() {
        var ageInput = UITextView(frame: CGRect(x: 150, y: 80, width: 200, height: 50))
        ageInput.textAlignment = NSTextAlignment.justified
        ageInput.textColor = UIColor.blue
        ageInput.layer.borderWidth = 1
        ageInput.layer.borderColor = UIColor.gray.cgColor
//        ageInput.font = UIFont(name: self.font.fontName, size: 22)
        view.addSubview(ageInput)
        self.ageInput = ageInput
    }

    private func heightFieldInput() {
            var heightInput = UITextView(frame: CGRect(x: 150, y: 150, width: 200, height: 50))
            heightInput.textAlignment = NSTextAlignment.justified
            heightInput.textColor = UIColor.blue
            heightInput.layer.borderWidth = 1
            heightInput.layer.borderColor = UIColor.gray.cgColor
    //        ageInput.font = UIFont(name: self.font.fontName, size: 22)
            view.addSubview(heightInput)
            self.heightInput = heightInput
        }

    private func weightFieldInput() {
            var weightInput = UITextView(frame: CGRect(x: 150, y: 220, width: 200, height: 50))
            weightInput.textAlignment = NSTextAlignment.justified
            weightInput.textColor = UIColor.blue
            weightInput.layer.borderWidth = 1
            weightInput.layer.borderColor = UIColor.gray.cgColor
    //        ageInput.font = UIFont(name: self.font.fontName, size: 22)
            view.addSubview(weightInput)
            self.weightInput = weightInput
        }
    
    private func genderSCInput() {
        var genderSC = UISegmentedControl(items: ["муж","жен"])
        genderSC.frame = CGRect(x: 150, y: 290, width: 200, height: 50)
        genderSC.selectedSegmentIndex = 0
        view.addSubview(genderSC)
        self.genderSC = genderSC
        }
    
    private func trainSCInput() {
        var trainSC = UISegmentedControl(items: ["0","1-3", "3-5", "5-7"])
        trainSC.frame = CGRect(x: 150, y: 360, width: 200, height: 50)
        trainSC.selectedSegmentIndex = 0
        view.addSubview(trainSC)
        self.trainSC = trainSC
    }
    
    private func addResultButton() {
        let resultButton = UIButton(type: .system)
        resultButton.frame = CGRect(x: 160, y: 500, width: 200, height: 50)
        resultButton.center.x = self.view.center.x
        resultButton.setTitle("Рассчитать", for: .normal)
        resultButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
//        resultButton.frame.size = CGSize(width: 200, height: 44)
//        resultButton.center.x = self.view.center.x
        resultButton.layer.cornerRadius = 12.0
        resultButton.tintColor = .white
        resultButton.addTarget(self, action: #selector(didTapResultButton),
                                for: .touchDragInside)
        view.addSubview(resultButton)
        self.resultButton = resultButton
    }
    private func addResultLabel() {
        let resultLabel = UILabel()
        resultLabel.frame = CGRect(x: 160, y: 550, width: 300, height: 300)
        resultLabel.center.x = self.view.center.x
        resultLabel.text = "Test"
        resultLabel.lineBreakMode = .byWordWrapping
        resultLabel.numberOfLines = 3
        view.addSubview(resultLabel)
        self.resultLabel = resultLabel
    }
    
    
    
//    @objc
    @IBAction func didTapResultButton(sender: ViewController) {
        var bmr: Double = 0
        var bmi: Double = 0
        
        if let age: Int = Int(ageInput!.text) {
            if let height: Int = Int(heightInput!.text) {
                if let weight: Int = Int(weightInput!.text) {
                    switch genderSC?.selectedSegmentIndex {
                    case 0:
                        bmr = 88.362 + 13.397 * Double(weight) + 4.799 * Double(height) - 5.677 * Double(age)
                    case 1:
                        bmr = 447.593 + 9.247 * Double(weight) + 3.098 * Double(height) - 4.330 * Double(age)
                    default:
                        bmr = 0
                    }
                    bmi = Double(weight) / pow(Double(height) / 100, 2)
                }
            }
        }
        
        let factor = [1.375, 1.55, 1.725, 1.9]
        let selectedFactor = factor[trainSC!.selectedSegmentIndex]
        bmr *= selectedFactor
        resultLabel!.text = "Вы должны потреблять \(Int(bmr)) килокалорий для поддержания веса.\nИндекс массы тела \(Int(bmi))."

}





}

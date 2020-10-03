//
//  ViewController.swift
//  alcoholic
//
//  Created by kymblc on 25.08.2020.
//  Copyright © 2020 traceback. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var sexSegment: UISegmentedControl!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var drinkOneSize: UITextField!
    @IBOutlet weak var drinkOneAlcohol: UITextField!
    @IBOutlet weak var drinkTwoSize: UITextField!
    @IBOutlet weak var drinkTwoAlcohol: UITextField!
    @IBOutlet weak var drinkThreeSize: UITextField!
    @IBOutlet weak var drinkThreeAlcohol: UITextField!
    @IBOutlet weak var drinkFourSize: UITextField!
    @IBOutlet weak var drinkFourAlcohol: UITextField!
    
    var correct = true
    
    
    
    var calc = AlcoholCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    
    @IBAction func onButtonClick(_ sender: Any) {
        guard let height = Int(heightField.text!) else {
            heightField.backgroundColor = UIColor.red
            return
        }
        if height <= 0 {
            heightField.backgroundColor = UIColor.red
            return
        }
        
        guard let weight = Int(weightField.text!) else {
            weightField.backgroundColor = UIColor.red
            return
        }
        if weight <= 0 {
            weightField.backgroundColor = UIColor.red
            return
        }
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        correct = false
        let vc = segue.destination as! resultViewController
        guard let weight = Int(weightField.text!) else { return  }
        guard let height = Int(heightField.text!) else { return  }
        if weight <= 0 || height <= 0 { return }
        var sex = "??"
        switch sexSegment.selectedSegmentIndex
        {
        case 0:
            sex = "male"
        case 1:
            sex = "female"
        default:
            return
        }
        self.calc = AlcoholCalculator(weight: weight, sex: sex, height: height)
        calc.addDrink(drinkSize: drinkOneSize.text, drinkAlcohol: drinkOneAlcohol.text)
        calc.addDrink(drinkSize: drinkTwoSize.text, drinkAlcohol: drinkTwoAlcohol.text)
        calc.addDrink(drinkSize: drinkThreeSize.text, drinkAlcohol: drinkThreeAlcohol.text)
        calc.addDrink(drinkSize: drinkFourSize.text, drinkAlcohol: drinkFourAlcohol.text)
        vc.minTime = calc.timeCalculation(rezorb: 0.20)
        vc.avgTime = calc.timeCalculation(rezorb: 0.15)
        vc.maxTime = calc.timeCalculation(rezorb: 0.10)
        correct = true
    }
    
    @IBAction func tapOnHeightField(_ sender: Any) {
        heightField.backgroundColor = UIColor.systemBackground
    }
    
    @IBAction func tapOnWeightField(_ sender: Any) {
        weightField.backgroundColor = UIColor.systemBackground
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


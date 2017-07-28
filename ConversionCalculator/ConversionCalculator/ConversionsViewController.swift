//
//  ConversionsViewController.swift
//  ConversionCalculator
//
//  Created by Alyssa Nielsen on 7/25/17.
//  Copyright © 2017 Alyssa Nielsen. All rights reserved.
//

import UIKit


class ConversionsViewController: UIViewController {
    
    @IBOutlet weak var resultField: UITextField!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var toggleNegativeButton: UIButton!
    
    var conversions = Conversions()
    
    var inputFieldUnit = ""
    var resultFieldUnit = ""
    var toggleNegative = false
    var plusMinus = ""
    var currentInputText = ""
    var currentResultText = ""
    var f2c = false
    var c2f = false
    var m2k = false
    var k2m = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultField.text = ""
        inputField.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleNegative(_ sender: UIButton) {
        if toggleNegative == true {
            plusMinus = ""
            currentInputText.remove(at: currentInputText.startIndex)
            currentInputText = plusMinus + currentInputText
            inputField.text = currentInputText + inputFieldUnit
            if currentInputText != ""{
                conversionMapperForResultField()
            }
            else {
                resultField.text =  currentResultText + resultFieldUnit
            }
            toggleNegative = false
        }
        else if toggleNegative == false {
            if (!m2k && !k2m){
                plusMinus = "-"
                toggleNegative = true
            }
            else {
                plusMinus = ""
            }
            currentInputText = plusMinus + currentInputText
            inputField.text = currentInputText + inputFieldUnit
            if currentInputText != ""{
                conversionMapperForResultField()
            }
            else {
                resultField.text = currentResultText + resultFieldUnit
            }
        }
    }
    
    @IBAction func numPress(_ sender: UIButton) {
        currentInputText = currentInputText + sender.currentTitle!
        inputField.text = currentInputText + inputFieldUnit
        conversionMapperForResultField()
    }
    
    
    @IBAction func converterOptions(_ sender: UIButton ) {
        let alert = UIAlertController(title: "Conversion Calculator", message: "Choose a conversion", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Fahernheit to Celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.clear()
            self.resultFieldUnit = " °C"
            self.inputFieldUnit = " °F"
            self.setTextFields()
            self.f2c = true
            self.c2f = false
            self.m2k = false
            self.k2m = false
            self.inputField.text = self.currentInputText + self.inputFieldUnit
            self.conversionMapperForResultField()
            
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.clear()
            self.resultFieldUnit = " °F"
            self.inputFieldUnit = " °C"
            self.setTextFields()
            self.f2c = false
            self.c2f = true
            self.m2k = false
            self.k2m = false
            self.inputField.text = self.currentInputText + self.inputFieldUnit
            self.conversionMapperForResultField()
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.clear()
            self.resultFieldUnit = " km"
            self.inputFieldUnit = " mi"
            self.setTextFields()
            self.f2c = false
            self.c2f = false
            self.m2k = true
            self.k2m = false
            if (self.toggleNegative){
                self.currentInputText.remove(at: self.currentInputText.startIndex)
                self.toggleNegative = false
            }
            self.inputField.text = self.currentInputText + self.inputFieldUnit
            self.conversionMapperForResultField()
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.clear()
            self.resultFieldUnit = " mi"
            self.inputFieldUnit = " km"
            self.setTextFields()
            self.f2c = false
            self.c2f = false
            self.m2k = false
            self.k2m = true
            if (self.toggleNegative){
                self.currentInputText.remove(at: self.currentInputText.startIndex)
                self.toggleNegative = false
            }
            self.inputField.text = self.currentInputText + self.inputFieldUnit
            self.conversionMapperForResultField()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearAll(_ sender: Any) {
        clearAll()
    }
    
    func conversionMapperForResultField() {
        if (f2c){
            if (currentInputText != "" && currentInputText != "-") {
                currentResultText = String(format: "%.2f", conversions.convertFahrenheitToCelcius(Double(currentInputText)!))
                resultField.text =  currentResultText + resultFieldUnit
            }
        }
        if (c2f){
            if (currentInputText != "" && currentInputText != "-") {
                currentResultText = String(format: "%.2f", conversions.convertCelciusToFahrenheit(Double(currentInputText)!))
                resultField.text =  currentResultText + resultFieldUnit
            }
        }
        if (m2k){
            if (currentInputText != "" && currentInputText != "-") {
                currentResultText = String(format: "%.2f", conversions.convertMilesToKilometers(Double(currentInputText)!))
                resultField.text = currentResultText + resultFieldUnit
            }
        }
        if (k2m){
            if (currentInputText != "" && currentInputText != "-") {
                currentResultText = String(format: "%.2f", conversions.convertKilometersToMiles(Double(currentInputText)!))
                resultField.text = currentResultText + resultFieldUnit
            }
        }
    }
    
    func setTextFields()
    {
        self.resultField.text = self.resultFieldUnit
        self.inputField.text = self.inputFieldUnit
    }
    
    func clearAll () {
        resultField.text = ""
        inputField.text = ""
        toggleNegative = false
        
        plusMinus = ""
        currentInputText = ""
        currentResultText = ""
        
        resultField.text = resultFieldUnit
        inputField.text = inputFieldUnit
    }
    
    func clear() {
        resultField.text = resultFieldUnit
        inputField.text = inputFieldUnit
    }
}

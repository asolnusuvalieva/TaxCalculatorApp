//
//  ViewController.swift
//  TaxCalculator
//
//  Created by Asol on 1/21/21.
//  Copyright © 2021 Asol. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: - Properties
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var priceDouble: Double = 0
    var taxRateDouble: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPriceLabel.text = nil
        price.delegate = self
        taxRate.delegate = self
        
        price.inputAccessoryView = toolBar()
        taxRate.inputAccessoryView = toolBar()
    }

    //MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let priceText = price.text{
            priceDouble = Double(priceText) ?? 0
        }
        
        if let taxRateText = taxRate.text{
            taxRateDouble = Double(taxRateText) ?? 0
        }
    }
    
    
    //MARK: - Actions
    @IBAction func calculate(_ sender: UIButton) {
        price.resignFirstResponder()
        taxRate.resignFirstResponder()
        
        let totalPriceDouble = priceDouble + (priceDouble * taxRateDouble/100)
        totalPriceLabel.text = String(format: "$%.2f", totalPriceDouble)
    }
    
}

extension UIViewController{
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 1)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonTitle = "Done"
        let doneButton = UIBarButtonItem(title: buttonTitle, style: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = .black
        toolBar.setItems([space, doneButton, space], animated: false)
               toolBar.isUserInteractionEnabled = true
               toolBar.sizeToFit()
        return toolBar
    }
    
    @objc func doneButtonTapped(){
        view.endEditing(true)
    }
}




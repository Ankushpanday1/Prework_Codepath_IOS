//
//  ViewController.swift
//  Prework
//
//  Created by mihir suvarna on 6/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Required Variables
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    // Self-created Variables for Theme
    @IBOutlet weak var billAmountLeftLabel: UILabel!
    @IBOutlet weak var tipLeftLabel: UILabel!
    @IBOutlet weak var totalLeftLabel: UILabel!
    @IBOutlet weak var tipAmountSlider: UISlider!
    @IBOutlet weak var tipAmountPercentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets title for this app
        self.title = "What's The Tip?"
        
        // Add an observer and setup the darkMode function
        let darkMode = Notification.Name("darkMode enabled")
        NotificationCenter.default.addObserver(self, selector: #selector(enableDarkMode), name: darkMode, object: nil)
        enableDarkMode()
        
        // Add an observer and setup the tipSlider function
        let slider = Notification.Name("tipSlider enabled")
        NotificationCenter.default.addObserver(self, selector: #selector(tipSliderOn), name: slider, object: nil)
        tipSliderOn()
    }
    
    @objc func tipSliderOn() {
        // Basic function to check if tipSlider is on/off
        let isTipSliderHidden = UserDefaults.standard.bool(forKey: "tipSliderOn")
        tipAmountSlider.isHidden = !isTipSliderHidden
        tipAmountPercentLabel.isHidden = !isTipSliderHidden
        print("hidden")
    }

    @objc func enableDarkMode() {
        // Basic function to check if darkMode is on/off
        let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        let theme = isDarkMode ? ThemeType.black : ThemeType.white
        
        // Update the navbar colors
        navigationController?.navigationBar.barTintColor = theme.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : theme.textColor]
        navigationController?.navigationBar.barStyle = isDarkMode ? .black : .default
        
        // Assign theme to UI elements
        view.backgroundColor = theme.backgroundColor
        
        // Set labels to correct theme
        billAmountLeftLabel.textColor = theme.textColor
        tipLeftLabel.textColor = theme.textColor
        totalLeftLabel.textColor = theme.textColor
        tipAmountPercentLabel.textColor = theme.textColor
        totalLabel.textColor = theme.textColor
        tipAmountLabel.textColor = theme.textColor
        
        // Update the text field and keyboard
        billAmountTextField.textColor = theme.accentColor
        billAmountTextField.tintColor = theme.accentColor
        billAmountTextField.backgroundColor = theme.secondAccentColor
        billAmountTextField.keyboardAppearance = isDarkMode ? UIKeyboardAppearance.dark : UIKeyboardAppearance.light
        tipControl.backgroundColor = theme.secondAccentColor
        
        // Update the segmented control
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.accentColor]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Grab the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Calculate tip and total using an array
        let tipPercentages = [0.15, 0.18, 0.2]
        let tipIndex = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * tipIndex
        let total = bill + tip;
        
        // Format the total
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        // Update tip and total amount labels
//        tipAmountLabel.text = String(format: "$%.2f", total)
//        totalLabel.text = String(format: "$%.2f", total)
        tipAmountLabel.text = numberFormatter.string(for: tip)
        totalLabel.text = numberFormatter.string(for: total)
        
        // Update the tipSlider with selected segment value
        if (UserDefaults.standard.object(forKey: "tipSliderOn") != nil) {
            if UserDefaults.standard.bool(forKey: "tipSliderOn") {
                tipAmountSlider.setValue(Float(tipIndex), animated: true)
                tipAmountPercentLabel.text = String(format: "%.2f%%", 100 * tipAmountSlider.value)
            }
        }
        
    }
    
    @IBAction func calculateTipSlider(_ sender: Any) {
        tipAmountPercentLabel.text = String(format: "%.2f%%", 100 * tipAmountSlider.value)
        let bill = Float(billAmountTextField.text!) ?? 0
        
        // Calculate tip and total using an array
        let tip = bill * tipAmountSlider.value
        let total = bill + tip;
        
        // Format the total
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        // Update tip and total amount labels
//        tipAmountLabel.text = String(format: "$%.2f", total)
//        totalLabel.text = String(format: "$%.2f", total)
        tipAmountLabel.text = numberFormatter.string(for: tip)
        totalLabel.text = numberFormatter.string(for: total)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.becomeFirstResponder()
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
}


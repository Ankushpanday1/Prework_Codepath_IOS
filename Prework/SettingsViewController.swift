//
//  SettingsViewController.swift
//  Prework
//
//  Created by mihir suvarna on 6/3/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBOutlet weak var tipSliderSwitch: UISwitch!
    @IBOutlet weak var tipSliderLabel: UILabel!
    
    @IBAction func darkMode(_ sender: Any) {
        darkModeToggle(darkModeSwitch)
    }
    
    @IBAction func tipSlider(_ sender: Any) {
        tipSliderOn(tipSliderSwitch)
    }
    
    @objc func tipSliderOn(_ toggle: UISwitch) {
        // Send a notification that tipSlider is enabled
        let name = Notification.Name("tipSlider enabled")
        UserDefaults.standard.set(toggle.isOn, forKey: "tipSliderOn")
        NotificationCenter.default.post(name: name, object: nil)
    }
    
    @objc func darkModeToggle(_ toggle: UISwitch) {
        // Send a notification that darkMode is enabled
        let name = Notification.Name("darkMode enabled")
        UserDefaults.standard.set(toggle.isOn, forKey: "isDarkMode")
        NotificationCenter.default.post(name: name, object: nil)
        
        // Use a theme style based on the switch toggled on or off
        let currTheme = toggle.isOn ? ThemeType.black : ThemeType.white
        
        // Set all UI elements to the theme
        self.view.backgroundColor = currTheme.backgroundColor
        navigationController?.navigationBar.barTintColor = currTheme.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : currTheme.textColor]
        navigationController?.navigationBar.barStyle = toggle.isOn ? .black : .default
        darkModeLabel.textColor = currTheme.textColor
        tipSliderLabel.textColor = currTheme.textColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Check switch state from previous app runs
        if (UserDefaults.standard.object(forKey: "isDarkMode") != nil) {
            darkModeSwitch.isOn = UserDefaults.standard.bool(forKey: "isDarkMode")
        }
        darkModeToggle(darkModeSwitch)
        if (UserDefaults.standard.object(forKey: "tipSliderOn") != nil) {
            tipSliderSwitch.isOn = UserDefaults.standard.bool(forKey: "tipSliderOn")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct ThemeType {
    let textColor: UIColor
    let backgroundColor: UIColor
    let accentColor: UIColor
    let secondAccentColor: UIColor
    
    static let black = ThemeType(textColor: .white, backgroundColor: .black, accentColor: .white, secondAccentColor: .systemGray2)
    static let white = ThemeType(textColor: .black, backgroundColor: .white, accentColor: .black, secondAccentColor: .systemBackground)
}

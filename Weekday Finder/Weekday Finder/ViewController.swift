//
//  ViewController.swift
//  Weekday Finder
//
//  Created by Valentinas Kovalenkinas on 2022-07-08.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var monthTextField: UITextField!
    @IBOutlet private weak var yearTextField: UITextField!
    @IBOutlet private weak var weekdayResultLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func findDayButtonTapped(_ sender: UIButton) {
        
        guard let day = dateTextField.text,
              let month = monthTextField.text,
              let year = yearTextField.text
        else {
            return
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "lt_LT")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        let weekday = dateFormatter.string(from: date)
        let capitalizeWeekday = weekday.capitalized
        
        weekdayResultLabel.text = capitalizeWeekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


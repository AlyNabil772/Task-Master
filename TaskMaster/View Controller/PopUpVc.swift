//
//  PopUpVc.swift
//  TaskMaster
//
//  Created by ALY NABIL on 30/08/2024.
//

import UIKit

class PopUpVc: UIViewController {
    
    //MARK: - Properties
    let datePicker = UIDatePicker()
    
    //MARK: - Outlets
    @IBOutlet weak var dateAndTimeTexField: UITextField!
    @IBOutlet weak var toDoTextField: UITextField!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
       setDateAndTime()

    }
    //MARK: - Private Methods
    private func setDateAndTime() {
        self.datePicker.datePickerMode = .dateAndTime
        self.datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        self.datePicker.frame.size = CGSize(width: 0, height: 300)
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.minimumDate = Date()
        dateAndTimeTexField.inputView = datePicker
        dateAndTimeTexField.text = formatDate(date: datePicker.date)
    }
    
    //MARK: - Methods
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter.string(from:date)
    }

    //MARK: - Actions
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        dateAndTimeTexField.text = formatDate(date: datePicker.date)
    }
    
}

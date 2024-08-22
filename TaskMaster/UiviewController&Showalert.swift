//
//  UiviewController&Showalert.swift
//  TaskMaster
//
//  Created by ALY NABIL on 21/08/2024.
//

import UIKit

extension UIViewController {
     func showaAlert(title: String, massage: String) { // alert func
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

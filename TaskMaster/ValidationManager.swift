//
//  ValidationManager.swift
//  TaskMaster
//
//  Created by ALY NABIL on 21/08/2024.
//

import Foundation

class ValidationManager {
    
    private static let sharedInstance = ValidationManager()
    
    static func shared() -> ValidationManager {
        return sharedInstance
    }
    
    private init() {}
    
    private let format: String = "SELF MATCHES %@"
    
    func validationOn(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: format, regex)
        return predicate.evaluate(with: email)
    }
    func validationOn(password: String) -> Bool {
        let regex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: format, regex)
        return predicate.evaluate(with: password)
    }
    
}




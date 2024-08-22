//
//  SignUpVC.swift
//  TaskMaster
//
//  Created by ALY NABIL on 21/08/2024.
//

import UIKit

class SignUpVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Actions
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        if isUserDataValid() {
            self.showaAlert(title: "Created succeeded", massage: "Please Go To Sign In")
        }
    }
    
    @IBAction func goToSignInBtnTapped(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "SignInVC")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension SignUpVC {
    
    private func isUserDataValid() -> Bool {
        guard let name = userNameTextField.text, !name.isEmpty, name.count >= 3 else {
            self.showaAlert(title: "error", massage: "Please Enter a Valid Name")
            return false
        }
        guard let email = emailTextField.text, !email.isEmpty else {
            self.showaAlert(title: "error", massage: "Please Enter a valid Email")
            return false
        }
        guard let password = passwordTextField.text, !password.isEmpty else{
            self.showaAlert(title: "error", massage: "Please Enter a Valid Passord")
            return false
        }
        guard ValidationManager.shared().validationOn(email: email) else {
            self.showaAlert(title: "error", massage: "Pleae enter your email. Example: TaskMaster@example.com")
            return false
        }
        guard ValidationManager.shared().validationOn(password: password) else {
            self.showaAlert(title: "Error", massage: "Pleae enter your password. Example: Abc@1234")
            return false
        }
        return true
    }
}

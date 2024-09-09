//
//  SignInVC.swift
//  TaskMaster
//
//  Created by ALY NABIL on 21/08/2024.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func logInBtnTapped(_ sender: UIButton) {
        isUservalid()
        
    }
    
    @IBAction func goToSignUpBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


//MARK: - Private Methods
extension SignInVC {
    
    private func isUservalid() -> Bool {
        guard let email = emailTextField.text, !email.isEmpty else {
            self.showaAlert(title: "error", massage: "Please Enter a valid Email")
            return false
        }
        guard let password = passwordTextField.text, !password.isEmpty else{
            self.showaAlert(title: "error", massage: "Please Enter a Valid Passord")
            return false
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("there is error: \(error)")
                self.showaAlert(title: "error", massage: "User Not Existing")
            } else {
                self.gotoToDoVc()
            }
        }
        return false
    }
    
    private func gotoToDoVc() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "ToDoListVC")
        navigationController?.pushViewController(viewController, animated: true)
    }
}


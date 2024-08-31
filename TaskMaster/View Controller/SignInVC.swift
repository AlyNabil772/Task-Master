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
//        isUservalid()
        gotoToDoVc()
    }
    
    
    @IBAction func goToSignUpBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


//MARK: - Private Func
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
        isUserExisting(email: email, password: password)
        return false
    }
    
    func isUserExisting(email: String, password: String) {
        if emailTextField.text == email && passwordTextField.text == password {
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] result, error in
                guard let strongSelf = self else {
                 
                    return
                }
                guard error == nil else {
                    print("wrong data")
                    self?.showaAlert(title: "error", massage: "User Not Existing")
                    return
                }

                print("you have signed in")
            })
        }
        
    }
    
    private func gotoToDoVc() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "ToDoListVC")
        navigationController?.pushViewController(viewController, animated: true)
    }
}


//
//  SignInVC.swift
//  TaskMaster
//
//  Created by ALY NABIL on 21/08/2024.
//

import UIKit

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
    }
    
    
    @IBAction func goToSignUpBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

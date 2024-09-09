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
            goToTodoList()
        }
    }
    
    @IBAction func goToSignInBtnTapped(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: SignInVC = storyboard.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Private Methods
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
        
        UserDataFromFirebase.shared.saveUserDataToDatabase(email: email, password: password)
        
        return true
    }
    
    private func goToTodoList() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ToDoListVC")
        navigationController?.pushViewController(viewController, animated: true)
    }
}


   
 













    

//extension SignUpVC {
//
//    private func isUserDataValid() -> Bool {
//        guard let name = userNameTextField.text, !name.isEmpty, name.count >= 3 else {
//            self.showaAlert(title: "error", massage: "Please Enter a Valid Name")
//            return false
//        }
//        guard let email = emailTextField.text, !email.isEmpty else {
//            self.showaAlert(title: "error", massage: "Please Enter a valid Email")
//            return false
//        }
//        guard let password = passwordTextField.text, !password.isEmpty else{
//            self.showaAlert(title: "error", massage: "Please Enter a Valid Passord")
//            return false
//        }
//        guard ValidationManager.shared().validationOn(email: email) else {
//            self.showaAlert(title: "error", massage: "Pleae enter your email. Example: TaskMaster@example.com")
//            return false
//        }
//        guard ValidationManager.shared().validationOn(password: password) else {
//            self.showaAlert(title: "Error", massage: "Pleae enter your password. Example: Abc@1234")
//            return false
//        }
//
//        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
//            if let error = error {
//                print("Error creating user: \(error.localizedDescription)")
//                return
//            }
//
//            // User created successfully, save additional data to Realtime Database or Firestore
//            self?.saveUserDataToDatabase(name: name, email: email)
//        }
//        return true
//    }
//
//    func saveUserDataToDatabase(name: String, email: String) {
//        // Realtime Database example
//        let ref = Database.database().reference()
//        ref.child("users").child(Auth.auth().currentUser!.uid).setValue(["name": name, "email": email])
//
//        // Firestore example
//        let db = Firestore.firestore()
//        db.collection("users").document(Auth.auth().currentUser!.uid).setData(["name": name, "email": email])
//    }
//}

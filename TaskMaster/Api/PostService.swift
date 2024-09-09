//
//  PostService.swift
//  TaskMaster
//
//  Created by ALY NABIL on 02/09/2024.
//

import UIKit
import Firebase
import FirebaseDatabase



class UserDataFromFirebase {
    
    static let shared = UserDataFromFirebase()
    private let database = Database.database().reference()
    var uid: String = ""
    
    
    
    
    let userEmail = Auth.auth().currentUser?.email?.replacingOccurrences(of: ".", with: "_")
    
    
    private init() {}
    
    
    func saveUserDataToDatabase(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("no user saved\(error)")
            } else {
                let ref = Database.database().reference()
                let userData = ["email": email, "password": password ]
                ref.child("Users").child((email.replacingOccurrences(of: ".", with: "_"))).setValue(userData) { error, _ in
                    if let error = error {
                        print("error saving user \(error)")
                    }
                }
            }
        }
    }
    
    func userAlreadyExisting(email: String, password: String) -> Bool  {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("there is error to signin\(error)")
            } else {
                print("Signin success")
                
            }
        }
        return false
    }
    
     func addTodoToDatabase(content: String, dateTime: Date) {
        guard let userEmail = userEmail else {return}
        let ref = Database.database().reference().child("Todos").child(userEmail)
        let todoId = ref.childByAutoId().key ?? UUID().uuidString
        let todoData: [String: Any] = [
            "id": todoId,
            "content": content,
            "dateTime": dateTime.timeIntervalSince1970
        ]
        ref.child(todoId).setValue(todoData)
    }
    
    func deleteTodoFromDtatbase(todoId: String) {
       
       guard let userEmail = userEmail else {return}
       
       let ref = Database.database().reference().child("Todos").child(userEmail).child(todoId)
       
       ref.removeValue { error, _ in
           if let error = error {
               print("Error deleting todo: \(error)")
           }
       }
   }
}















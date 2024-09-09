//
//  ToDoListVC.swift
//  TaskMaster
//
//  Created by ALY NABIL on 25/08/2024.
//

import UIKit
import FirebaseDatabase
import Firebase

class ToDoListVC: UIViewController {
    
    
    //MARK: - Properties
    var popUp: CustomPopUp!
    var todos: [ToDoListItem] = []
    let userEmail = Auth.auth().currentUser?.email?.replacingOccurrences(of: ".", with: "_")
    
    
    //MARK: - outlet
    @IBOutlet weak var toDoTableView: UITableView!
    
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        toDoTableView.register(UINib(nibName: "ToDoCell", bundle: nil), forCellReuseIdentifier: "ToDoCell")
        toDoTableView.separatorColor = .purple
        self.title = "New Tester"
        plusBtn()
        fetchTodos()
    }
    
    //MARK: - Actions
    @objc func plusTapped() {
        //        self.popUp = CustomPopUp(frame: self.view.frame, inView: self)
        //        popUp.SaveBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
        //        self.view.addSubview(popUp)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let  PopUpVc = storyboard.instantiateViewController(withIdentifier: "PopUpVc") as? PopUpVc {
            PopUpVc.delegate = self
            present(PopUpVc, animated: true)
        }
    }
    
//    @objc func saveBtnTapped() {
//        self.popUp.removeFromSuperview()
//    }
}

//MARK: - FetchDataFormDatabase
extension ToDoListVC {
    //    private func fetchUserData() {
    //        if let user = Auth.auth().currentUser {
    //
    //        }
    //    }
    
    private func fetchTodos() {
        guard let userEmail = userEmail else {return}
        let ref = Database.database().reference().child("Todos").child(userEmail)
        
        ref.observe(.value) { snapshot in
            self.todos = []
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot, let todoData = childSnapshot.value as? [String: Any] {
                    let todo = ToDoListItem(dictionary: todoData)
                    self.todos.append(todo)
                }
            }
            self.toDoTableView.reloadData()
        }
    }
}


//MARK: - plusBtn
extension ToDoListVC {
    private func plusBtn() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(plusTapped))
    }
}


//MARK: - UITableViewDelegate
extension ToDoListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // animation
    }
}


//MARK: - UITableViewDataSource
extension ToDoListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoCell else {return UITableViewCell()}

        let todo = todos[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: todo.dateTime)
        if let dateLabel = cell.dateAndTimeLabel {
            dateLabel.text = dateString
            dateLabel.textColor = UIColor.purple
        }
        cell.toDoNameLabel.text = todo.content
        cell.toDoNameLabel.textColor = UIColor.purple
        
        cell.delegate = self
        cell.todoID = todo.id

        return cell
    }
}

//MARK: - PopupDelegate
extension ToDoListVC: PopupDelegate {
    func didAddTodo(contant: String, date: Date) {
        UserDataFromFirebase.shared.addTodoToDatabase(content: contant, dateTime: date)
        fetchTodos()
    }
}

//MARK: - TodoCellDelegate
extension ToDoListVC: TodoCellDelegate {
    func didTapDeleteButton(todoId: String) {
        UserDataFromFirebase.shared.deleteTodoFromDtatbase(todoId: todoId)
        
        if let index = todos.firstIndex(where: { $0.id == todoId }) {
            
            todos.remove(at: index)
            toDoTableView.reloadData()
        }
    }
}





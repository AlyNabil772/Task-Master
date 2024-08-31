//
//  ToDoListVC.swift
//  TaskMaster
//
//  Created by ALY NABIL on 25/08/2024.
//

import UIKit
import FirebaseDatabase

class ToDoListItem {
    
    var item: String = ""
    var date: Date = Date()
}


class ToDoListVC: UIViewController {
    
    var popUp: CustomPopUp!
    
    
    var todos: [ToDoListItem] = []
    
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
        
    }
    
    //MARK: - Actions
    @objc func plusTapped() {
//        self.popUp = CustomPopUp(frame: self.view.frame, inView: self)
//        popUp.SaveBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
//        self.view.addSubview(popUp)
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: PopUpVc = storyboard.instantiateViewController(withIdentifier: "PopUpVc") as! PopUpVc
        
        present(vc, animated: true)
        
    }
    
    @objc func saveBtnTapped() {
        self.popUp.removeFromSuperview()
    }
}


//MARK: - Private func
extension ToDoListVC {
    private func plusBtn() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(plusTapped))
    }
}


//MARK: - UITableViewDelegate
extension ToDoListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
//MARK: - UITableViewDataSource
extension ToDoListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoCell else {return UITableViewCell()}
        cell.textLabel?.text = todos[indexPath.row].item
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
}








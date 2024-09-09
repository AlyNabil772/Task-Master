//
//  ToDoCell.swift
//  TaskMaster
//
//  Created by ALY NABIL on 30/08/2024.
//

import UIKit



protocol TodoCellDelegate: AnyObject {
    func didTapDeleteButton(todoId: String)
}

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var toDoNameLabel: UILabel!
    @IBOutlet weak var todoImage: UIImageView!
    
    weak var delegate: TodoCellDelegate?
    var todoID: String?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    @IBAction func deleteBtnTapped(_ sender: UIButton) {
        if let todoID = todoID {
            delegate?.didTapDeleteButton(todoId: todoID)
        }
    }
    
}






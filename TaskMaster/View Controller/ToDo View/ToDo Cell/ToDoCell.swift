//
//  ToDoCell.swift
//  TaskMaster
//
//  Created by ALY NABIL on 30/08/2024.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var toDoNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func deleteBtnTapped(_ sender: UIButton) {
    }
    
}

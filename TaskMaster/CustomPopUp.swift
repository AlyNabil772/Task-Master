//
//  CustomPopUp.swift
//  TaskMaster
//
//  Created by ALY NABIL on 30/08/2024.
//

import UIKit

class CustomPopUp: UIView {
    
    //MARK: - Properties
    var vc: UIViewController!
    var view: UIView!
    

    //MARK: - Outlets
    @IBOutlet weak var dateAndTimeTextField: UITextField!
    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var SaveBtn: UIButton!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
     init(frame: CGRect, inView: UIViewController) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
         self.vc = inView
    }
    
    func xibSetup(frame: CGRect) {
        self.view = loadNibView()
        view.frame = frame
        addSubview(view)
    }
    
    
    func loadNibView() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomPopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    
}

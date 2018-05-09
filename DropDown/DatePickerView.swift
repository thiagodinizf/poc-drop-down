//
//  DatePickerView.swift
//  DropDown
//
//  Created by Thiago Diniz on 08/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
    func didSelectDate(date: String)
}

class DatePickerView: UIView {
    
    let dates = ["14","15","16","17","18"]
    weak var delegate: DatePickerViewDelegate!
    
    @IBOutlet var labels: [UIButton]!
    @IBOutlet weak var stackView: UIStackView!
    
    func create() -> DatePickerView {
        let nib = Bundle.main.loadNibNamed(String(describing: DatePickerView.self), owner: nil, options: nil)
        let view = nib?.first as! DatePickerView
        return view
    }
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.darkGray
        for (index,button) in labels.enumerated() {
            button.tag = index
            let view = DateCellViewButton(frame: button.frame).create()
            view.dayOfMoth.text = dates[index]
            view.dayOfWeek.text = "SEG"
            view.isUserInteractionEnabled = false
            button.addSubview(view)
        }
    }
    
    @IBAction func click(_ sender: UIButton) {
        print(sender.tag)
        delegate.didSelectDate(date: dates[sender.tag])
    }
}

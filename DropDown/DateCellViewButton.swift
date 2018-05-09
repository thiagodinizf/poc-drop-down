//
//  DateCell.swift
//  DropDown
//
//  Created by Thiago Diniz on 09/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit

class DateCellViewButton: UIView {
    
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var dayOfMoth: UILabel!
    
    func create() -> DateCellViewButton {
        let nib = Bundle.main.loadNibNamed(String(describing: DateCellViewButton.self), owner: nil, options: nil)
        let view = nib?.first as! DateCellViewButton
        return view
    }
}

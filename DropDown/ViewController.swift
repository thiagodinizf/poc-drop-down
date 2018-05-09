//
//  ViewController.swift
//  DropDown
//
//  Created by Thiago Diniz on 08/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var height : CGFloat {
        return self.navigationController!.navigationBar.frame.height
    }
    var dateView: DatePickerView!
    @IBOutlet weak var selectedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tileView = DateTitleView(frame: navigationController!.navigationBar.frame, title: "15 Maio", font: UIFont.boldSystemFont(ofSize: 15))
        tileView.delegate = self
        navigationItem.titleView = tileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addDatePicker()
    }
    
    func addDatePicker(hidden: Bool = true) {
        if dateView != nil {
            dateView.removeFromSuperview()
        }
        dateView = DatePickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: height)).create()
        dateView.center.y -= 44
        dateView.delegate = self
        view.addSubview(dateView)
    }
}

extension ViewController: DateTitleViewDelegate {
    func didSelectDateTitle(show: Bool) {
        self.view.layoutIfNeeded()
        if show {
            
            UIView.animate(withDuration: 0.250) {
                self.view.transform = CGAffineTransform(translationX: 0.0, y: self.height)
            }

        } else {
            UIView.animate(withDuration: 0.250) {
                self.view.transform = CGAffineTransform.identity
            }
        }
    }
}

extension ViewController: DatePickerViewDelegate {
    func didSelectDate(date: String) {
        selectedLabel.text = date
    }
}


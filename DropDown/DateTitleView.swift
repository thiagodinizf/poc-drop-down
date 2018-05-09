//
//  DateTitleView.swift
//  DropDown
//
//  Created by Thiago Diniz on 08/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit

protocol DateTitleViewDelegate {
    func didSelectDateTitle(show: Bool)
}

class DateTitleView: UIView {
    
    var show = false
    var delegate: DateTitleViewDelegate!
    fileprivate var menuButton: UIButton!
    fileprivate var menuTitle: UILabel!
    fileprivate var menuArrow: UIImageView!
    fileprivate let arrowPadding: CGFloat = 15.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required convenience init(frame: CGRect, title: String, font: UIFont) {
        self.init(frame: frame)
        create(title: title, font: font)
    }

    override open func layoutSubviews() {
        self.menuTitle.sizeToFit()
        self.menuTitle.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        self.menuTitle.textColor = UIColor.black
        self.menuArrow.sizeToFit()
        self.menuArrow.center = CGPoint(x: self.menuTitle.frame.maxX + arrowPadding, y: self.frame.size.height/2)
    }
    
    private func create(title: String, font: UIFont) {
        menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        menuButton.addTarget(self, action: #selector(DateTitleView.menuButtonTapped), for: UIControlEvents.touchUpInside)
        self.addSubview(menuButton)
        
        let titleSize: CGSize = (title as NSString).size(withAttributes: [NSAttributedStringKey.font : font])
        
        menuArrow = UIImageView(image: UIImage(named: "arrow_down_icon")!.withRenderingMode(.alwaysTemplate))
        menuArrow.tintColor = .black
        let width = (titleSize.width + arrowPadding + menuArrow.frame.size.width)*2
        let height = self.frame.height
        
        menuTitle = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        menuTitle.text = title
        menuTitle.textColor = UIColor.black
        menuTitle.font = font
        menuTitle.textAlignment = NSTextAlignment.center
        menuButton.addSubview(menuTitle)
        
        menuButton.addSubview(menuArrow)
    }
    
    func rotateArrow() {
        UIView.animate(withDuration: 0.250, animations: {
            self.menuArrow.transform = self.menuArrow.transform.rotated(by: 180 * CGFloat(Double.pi/180))
        })
    }
    
    @objc func menuButtonTapped() {
        show = !show
        delegate.didSelectDateTitle(show: show)
        rotateArrow()
    }
}

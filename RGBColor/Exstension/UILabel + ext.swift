//
//  UILabel + ext.swift
//  RGBColor
//
//  Created by Айдар Оспанов on 06.02.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, textAligment: NSTextAlignment = .left) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = .black
        self.textAlignment = textAligment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

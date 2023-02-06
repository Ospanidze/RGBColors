//
//  UIStackView + ext.swift
//  RGBColor
//
//  Created by Айдар Оспанов on 06.02.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangedViews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution = .fillEqually) {
        self.init(arrangedSubviews: arrangedViews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

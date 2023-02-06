//
//  UISlider + ext.swift
//  RGBColor
//
//  Created by Айдар Оспанов on 06.02.2023.
//

import UIKit

extension UISlider {
    convenience init(minimumTrackTintColor: UIColor, value: Float, minValue: Float = 0, maxValue: Float = 1) {
        self.init()
    
        self.minimumTrackTintColor = minimumTrackTintColor
        self.value = value
        self.minimumValue = minValue
        self.maximumValue = maxValue
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  ViewController.swift
//  RGBColor
//
//  Created by Айдар Оспанов on 06.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.init(red: 0.05, green: 0.27, blue: 0.49, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let redLabel = UILabel(text: "0.05", font: UIFont.systemFont(ofSize: 17))
    private let greenLabel = UILabel(text: "0.27", font: UIFont.systemFont(ofSize: 17))
    private let blueLabel = UILabel(text: "0.49", font: UIFont.systemFont(ofSize: 17))
    
    private let redSlider = UISlider(minimumTrackTintColor: .red, value: 0.05)
    private let greenSlider = UISlider(minimumTrackTintColor: .green, value: 0.27)
    private let blueSlider = UISlider(minimumTrackTintColor: .blue, value: 0.49)
    
    private var stackViewForColors: UIStackView!
    private var stackViewForLabels: UIStackView!
    private var stacKViewForSliders: UIStackView!
    
    
    private let colors = ["Red:", "Green:", "Blue:"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
         
        setupStackViewForColors()
        setupStackViewForLabels()
        setupStackViewForSliders()
        setConstraints()
        
        addTarget(sliders: redSlider, greenSlider, blueSlider)
    }
    
    private func addTarget(sliders: UISlider...) {
        sliders.forEach { slider in
            slider.addTarget(self, action: #selector(sliderTapped(slider:)), for: .valueChanged)
        }
    }
    
    @objc private func sliderTapped(slider: UISlider) {
        let text = String(format: "%.2f", slider.value)
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        
        switch slider {
        case redSlider:
            redLabel.text = text
            baseView.backgroundColor = .init(red: CGFloat(slider.value), green: greenColor, blue: blueColor, alpha: 1)
        case greenSlider:
            greenLabel.text = text
            baseView.backgroundColor = .init(red: redColor, green: CGFloat(slider.value), blue: blueColor, alpha: 1)
        default:
            blueLabel.text = text
            baseView.backgroundColor = .init(red: redColor, green: greenColor, blue: CGFloat(slider.value), alpha: 1)
        }
    }

    private func makeLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        return label
    }
}

//MARK: SetupStackViews

extension MainViewController {
    func setupStackViewForColors() {
        stackViewForColors = UIStackView(arrangedViews: colors.map{ makeLabel($0) },
                                        axis: .vertical,
                                        spacing: 10)
    }
    
    func setupStackViewForLabels() {
        stackViewForLabels = UIStackView(arrangedViews: [redLabel, greenLabel, blueLabel],
                                        axis: .vertical,
                                        spacing: 10)
    }
    
    func  setupStackViewForSliders() {
        stacKViewForSliders = UIStackView(arrangedViews: [redSlider, greenSlider, blueSlider],
                                          axis: .vertical,
                                          spacing: 10)
    }
}
 
//MARK: SetConstraints

extension MainViewController {
    
    func setConstraints() {
        
        let top = view.frame.width * 0.18
        
        view.addSubview(baseView)
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.width * 0.12),
            baseView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            baseView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            baseView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        view.addSubview(stackViewForColors)
        NSLayoutConstraint.activate([
            stackViewForColors.topAnchor.constraint(equalTo: baseView.bottomAnchor, constant: top),
            stackViewForColors.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            stackViewForLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15)
        ])
        
        view.addSubview(stackViewForLabels)
        NSLayoutConstraint.activate([
            stackViewForLabels.topAnchor.constraint(equalTo: baseView.bottomAnchor, constant: top),
            stackViewForLabels.leadingAnchor.constraint(equalTo: stackViewForColors.trailingAnchor, constant: 20),
            stackViewForLabels.centerYAnchor.constraint(equalTo: stackViewForColors.centerYAnchor),
            stackViewForLabels.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15)
        ])
        
        view.addSubview(stacKViewForSliders)
        NSLayoutConstraint.activate([
            stacKViewForSliders.topAnchor.constraint(equalTo: baseView.bottomAnchor, constant: top),
            stacKViewForSliders.leadingAnchor.constraint(equalTo: stackViewForLabels.trailingAnchor, constant: 30),
            stacKViewForSliders.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stacKViewForSliders.centerYAnchor.constraint(equalTo: stackViewForLabels.centerYAnchor),
        ])
    }
}

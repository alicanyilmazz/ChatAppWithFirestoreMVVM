//
//  GradientExtension.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import UIKit

extension UIViewController{
    func configureGradientLayer(){
        let gradient = CAGradientLayer()
        gradient.colors = [ RGBColors.bottom.cgColor,RGBColors.top.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}

class RGBColors{
    static let darkBlue = #colorLiteral(red: 0.01960784314, green: 0.09803921569, blue: 0.2156862745, alpha: 1)
    static let midBlue = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.4784313725, alpha: 1)
    static let lightBlue = #colorLiteral(red: 0, green: 0.5294117647, blue: 0.5764705882, alpha: 1)
    static let lightGreen = #colorLiteral(red: 0, green: 0.7490196078, blue: 0.4470588235, alpha: 1)
    static let yellowGreen = #colorLiteral(red: 0.6588235294, green: 0.9215686275, blue: 0.07058823529, alpha: 1)
    static let top = #colorLiteral(red: 0.4156862745, green: 0.9529411765, blue: 0.7725490196, alpha: 1)
    static let bottom = #colorLiteral(red: 0.2392156863, green: 0.4823529412, blue: 0.9725490196, alpha: 1)
}

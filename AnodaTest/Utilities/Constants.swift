//
//  Constants.swift
//  AnodaTest
//
//  Created by Steven Vovchyna on 13.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

let ordinaryView = { () -> UIView in
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}

let ordinaryLabel = { (font: UIFont, textColor: UIColor, numberOfLines: Int) -> UILabel in
    let label = UILabel()
    label.font = font
    label.textColor = textColor
    label.numberOfLines = numberOfLines
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}

let ordinaryButton = { (imageName: String) -> UIButton in
    let button = UIButton()
    button.setImage(UIImage(named: imageName), for: .normal)
    button.imageView?.contentMode = .scaleAspectFill
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}

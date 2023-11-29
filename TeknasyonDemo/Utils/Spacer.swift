//
//  Spacer.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import UIKit

func spacer(_ height:CGFloat = 8) -> UIView {
    let view = UIView()
    view.backgroundColor = .clear
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        view.heightAnchor.constraint(equalToConstant: height)
    ])
    return view
}

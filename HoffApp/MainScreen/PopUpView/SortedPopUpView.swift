//
//  SortedPopUpView.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 19.04.2022.
//

import UIKit

class SortedPopUpView: UIView {

    override init(frame: CGRect) {

        super.init(frame: frame)
        backgroundColor = .systemRed
        heightAnchor.constraint(equalToConstant: 300).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

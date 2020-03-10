//
//  UiView+Constrain.swift
//  weathe
//
//  Created by Alex Rudoi on 53//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillSubview(_ subview: UIView) {
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor),
            subview.leftAnchor.constraint(equalTo: leftAnchor),
            subview.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}

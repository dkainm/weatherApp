//
//  LoadingSpinner.swift
//  weathe
//
//  Created by Alex Rudoi on 53//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class LoadingSpinner: UIViewController {
    
    let spinner = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        view.backgroundColor = .gray
        view.alpha = 0.9
        
        spinner.startAnimating()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinner.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        
    }
}

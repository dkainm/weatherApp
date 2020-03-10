//
//  WeatherViewController.swift
//  weathe
//
//  Created by Alex Rudoi on 53//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityTemp: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var highLowTemp: UILabel!
    @IBOutlet weak var percentRain: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var uvindex: UILabel!
    @IBOutlet weak var totallyDescription: UILabel!
    
    let spinner = LoadingSpinner()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner(true)
        config()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2) {
            self.showSpinner(false)
        }
        
    }

    func config() {
        ApiClient(responceType: .success, weatherViewController: self).fetchWeather()
    }

    func showSpinner(_ isLoding: Bool = true) {
        if isLoding {
            view.addSubview(spinner.view)
            view.fillSubview(spinner.view)
        } else {
            spinner.view.removeFromSuperview()
        }
    }
}


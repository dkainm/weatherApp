//
//  APIClient.swift
//  weathe
//
//  Created by Alex Rudoi on 53//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

struct ApiClient {
    
    let responceType: ResponceType
    let weatherViewController: WeatherViewController!
    
    enum ResponceType {
        case success
        case networkError
    }
    
    func fetchWeather() {
        guard let file = Bundle.main.path(forResource: "mockResponse", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: file), options: []),
            let weather = try? JSONDecoder().decode(Forcast.self, from: data) else { return }
        
        let temp = Int(weather.currently.apparentTemperature)
        let highTemp = Int(weather.daily.data.first!.temperatureHigh)
        let lowTemp = Int(weather.daily.data.first!.temperatureLow)
        let chanceOfRain = Int(weather.currently.precipProbability*10)
        let windSpeed = Int(weather.currently.windSpeed)
        let humidity = Int(weather.currently.humidity*10)
        
        weatherViewController.cityName.text = weather.timezone
        weatherViewController.cityTemp.text = String("\(temp)º")
        weatherViewController.weatherIcon.image = UIImage(named: weather.currently.icon)
        weatherViewController.weatherDescription.text = weather.currently.summary
        weatherViewController.highLowTemp.text = "\(highTemp)º / \(lowTemp)º"
        weatherViewController.percentRain.text = "Rain \(chanceOfRain)%"
        weatherViewController.windSpeed.text = "\(windSpeed) MPH"
        weatherViewController.humidity.text = "\(humidity)%"
        weatherViewController.uvindex.text = String(weather.currently.uvIndex)
        weatherViewController.totallyDescription.text = "Today: \(weather.daily.data.first!.summary)"
        
        print(weather.currently)
    }
    
}

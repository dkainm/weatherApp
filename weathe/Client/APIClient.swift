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
        
        let city = weather.timezone
        let temp = String("\(Int(weather.currently.apparentTemperature))º")
        let weatherIcon = UIImage(named: weather.currently.icon)
        let weatherDescription = weather.currently.summary
        let highTemp = Int(weather.daily.data.first!.temperatureHigh)
        let lowTemp = Int(weather.daily.data.first!.temperatureLow)
        let analyzeOfTemp = "\(highTemp)º / \(lowTemp)º"
        let chanceOfRain = "Rain \(Int(weather.currently.precipProbability*10))%"
        let windSpeed = "\(Int(weather.currently.windSpeed)) MPH"
        let humidity = "\(Int(weather.currently.humidity*10))%"
        let uxindex = String(weather.currently.uvIndex)
        let totallyDescription = "Today: \(weather.daily.data.first!.summary)"
        
        weatherViewController.cityName.text = city
        weatherViewController.cityTemp.text = temp
        weatherViewController.weatherIcon.image = weatherIcon
        weatherViewController.weatherDescription.text = weatherDescription
        weatherViewController.highLowTemp.text = analyzeOfTemp
        weatherViewController.percentRain.text = chanceOfRain
        weatherViewController.windSpeed.text = windSpeed
        weatherViewController.humidity.text = humidity
        weatherViewController.uvindex.text = uxindex
        weatherViewController.totallyDescription.text = totallyDescription
        
        print(weather.currently)
    }
    
}

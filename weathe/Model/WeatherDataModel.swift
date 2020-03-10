//
//  WeatherDataModel.swift
//  weathe
//
//  Created by Alex Rudoi on 53//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//


struct Forcast: Decodable {
    let timezone: String
    
    let currently: CurrentlyForcast
    let daily: DailyForcast
}

struct CurrentlyForcast: Decodable {
    let time: Int
    let summary: String
    let icon: String
    let apparentTemperature: Double
    let precipProbability: Double
    let windSpeed: Double
    let humidity: Double
    let uvIndex: Int
}

struct DailyForcast: Decodable {
    let data: [DataForcast]
}

struct DataForcast: Decodable {
    let summary: String
    let temperatureHigh: Double
    let temperatureLow: Double
}

enum TimeOfDay {
    case morning
    case noon
    case afternoon
    case evening
    case night
}

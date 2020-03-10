//
//  CurrentlyStruct.swift
//  weathe
//
//  Created by Alex Rudoi on 53//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

struct Currently: Decodable {
    let time: Int
    let summary: String
    let icon: String
    let apparentTemperature: Double
    let precipProbability: Double
    let windSpeed: Double
    let humidity: Double
    let uvIndex: Int
}

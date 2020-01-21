//
//  WeatherData.swift
//  Weather2
//
//  Created by Shyam K Patel on 1/20/20.
//  Copyright © 2020 Shyam K Patel. All rights reserved.
//

import SwiftyJSON

struct WeatherData {
    
    var temperature: String
    var description: String
    var icon: String
    
    init(data: Any) {
        let json = JSON(data)
        let currentWeather = json["currently"]

        if let temperature = currentWeather["temperature"].float {
            self.temperature = String(format: "%.0f", temperature) + " ºF"
        } else {
            self.temperature = "--"
        }
        self.description = currentWeather["summary"].string ?? "--"
        self.icon = currentWeather["icon"].string ?? "--"
    }
}

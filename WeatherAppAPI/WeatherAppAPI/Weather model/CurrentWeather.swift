//
//  CurrentWeather.swift
//  WeatherAppAPI
//
//  Created by Администратор on 21/01/2019.
//  Copyright © 2019 Администратор. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let appearantTemperature: Double
    let humidity: Double
    let pressure: Double
    let icon: UIImage
}

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure))" + " mm"
    }
    
    var humidityString: String {
        return "\(Int(humidity))" + "%"
    }
    
    var temperatureString: String {
        return "\(Int(temperature))" + "˚C"
    }
    
    var appearantTemperatureString: String {
        return "Feels like: " + "\(Int(appearantTemperature))" + "˚C"
    }
}

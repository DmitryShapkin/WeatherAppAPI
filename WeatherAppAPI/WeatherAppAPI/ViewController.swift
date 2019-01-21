//
//  ViewController.swift
//  WeatherAppAPI
//
//  Created by Администратор on 21/01/2019.
//  Copyright © 2019 Администратор. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = WeatherIconManager.Rain.image
        let currentWeather = CurrentWeather(temperature: 10.0, appearantTemperature: 5.0, humidity: 30.0, pressure: 750.0, icon: icon)
        updateUIWith(currentWeather: currentWeather)
        
//        //let urlString = "https://api.darksky.net/forecast/d48c2431a956eab26f90837b5fb15778/37.8267,-122.4233"
//        let baseURL = URL(string: "https://api.darksky.net/forecast/d48c2431a956eab26f90837b5fb15778/")
//        let fullURL = URL(string: "37.8267,-122.4233", relativeTo: baseURL)
//
//        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfiguration)
//
//        let request = URLRequest(url: fullURL!)
//        let dataTask = session.dataTask(with: fullURL!) { (data, response, error) in
//
//        }
//        dataTask.resume()
    }
    
    func updateUIWith(currentWeather: CurrentWeather) {
        self.imageView.image = currentWeather.icon
        self.pressureLabel.text = currentWeather.pressureString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperatureLabel.text = currentWeather.appearantTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
    }
}


//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ivan Akulov on 24/08/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var pressureLabel: UILabel!
  @IBOutlet weak var humidityLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var apparentTemperatureLabel: UILabel!
  @IBOutlet weak var refreshButton: UIButton!
  
  @IBAction func refreshButtonTapped(_ sender: UIButton) {
    
  }
  
  lazy var weatherManager = APIWeatherManager(apiKey: "d48c2431a956eab26f90837b5fb15778")
  let coordinates = Coordinates(latitude: 54.741704, longitude: 55.984471)
  
  override func viewDidLoad() {
    super.viewDidLoad()

    weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
      switch result {
      case .Success(let currentWeather):
        self.updateUIWith(currentWeather: currentWeather)
      case .Failure(let error as NSError):
        
        let alertController = UIAlertController(title: "Unable to get data ", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
      default: break
      }
    }
  }
  
  func updateUIWith(currentWeather: CurrentWeather) {
    
    self.imageView.image = currentWeather.icon
    self.pressureLabel.text = currentWeather.pressureString
    self.temperatureLabel.text = currentWeather.temperatureString
    self.apparentTemperatureLabel.text = currentWeather.appearentTemperatureString
    self.humidityLabel.text = currentWeather.humidityString
  }
}













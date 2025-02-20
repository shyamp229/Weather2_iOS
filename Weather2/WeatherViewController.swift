//
//  WeatherViewController.swift
//  Weather2
//
//  Created by Shyam K Patel on 1/19/20.
//  Copyright © 2020 Shyam K Patel. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var weatherLoction: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherIcon: UILabel!
//    let db = Firestore.firestore()
    var docRef: DocumentReference!
    
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        
        print("Refresh!")
        locationManager.requestLocation()
    }
    override func viewDidLoad() {
//        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        docRef = Firestore.firestore().document("sampleData/weatherData/")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let longitude = String(location.coordinate.longitude)
            let latitude = String(location.coordinate.latitude)
            
            DarkSkyService.weatherForCoordinates(latitude: latitude, longitude: longitude) { weatherData, error in
                
                if let weatherData = weatherData {
                    print(weatherData)
                    let dataToSave: [String: Any] = ["temperature": weatherData.temperature, "description": weatherData.description, "icon": weatherData.icon, "longitude": longitude, "latitude": latitude]
                    self.docRef.setData(dataToSave) { (error) in
                        if let error = error {
                            print("Got an error: \(error.localizedDescription)")
                        } else {
                            print("Weather Data has been saved!")
                        }
                    }
                    self.updateLabels(with: weatherData, at: location)
                }
                
                else if let _ = error {
                    self.handleError(message: "Unable to load the forecast for your location.")
                }
                
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        handleError(message: "Unable to load your location.")
    }

    func handleError(message: String) {
        let alert = UIAlertController(title: "Error Loading Forecast", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // Updating the UI
    let emojiIcons = [
        "clear-day" : "☀️",
        "clear-night" : "🌙",
        "rain" : "☔️",
        "snow" : "❄️",
        "sleet" : "🌨",
        "wind" : "🌬",
        "fog" : "🌫",
        "cloudy" : "☁️",
        "partly-cloudy-day" : "🌤",
        "partly-cloudy-night" : "🌥"
    ]
    
    func updateLabels(with data: WeatherData, at location: CLLocation) {
        self.temperature.text = data.temperature
        self.weatherDescription.text = data.description
        self.weatherIcon.text = emojiIcons[data.icon] ?? "❓"
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            let locationName = placemarks?.first?.locality ?? "Unknown Location"
            self.weatherLoction.text = locationName
        }
    }
    
}

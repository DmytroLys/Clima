//
//  WeatherManager.swift
//  Clima
//
//  Created by Dmytro on 09.08.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9dd04e42b8d5992cf994551684c493ad&units=metric"
    
    func fetchWeater (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        
        
    }
    
    func performRequest(urlString : String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                } else {
                    if let safeData = data {
                        parseJson(weatherData: safeData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(weatherData : Data) {
        let decoder = JSONDecoder()
        if let weather = try? decoder.decode(WeatherModel.self, from: weatherData) {
            print(weather)
        }
    }
}

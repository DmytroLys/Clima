//
//  WeatherModel.swift
//  Clima
//
//  Created by Dmytro on 09.08.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData : Decodable {
    var weather : [Weather]
    var main : Main
    var name : String
}

struct Weather: Decodable {
    
    var id : Int
    var main : String
    var icon: String
    var description: String
}

struct Main :Decodable {
    let temp : Double
}


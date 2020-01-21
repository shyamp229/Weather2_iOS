//
//  DarkSkyService.swift
//  Weather2
//
//  Created by Shyam K Patel on 1/20/20.
//  Copyright © 2020 Shyam K Patel. All rights reserved.
//

import Alamofire

public class DarkSkyService {
    private static let baseURL = "https://api.darksky.net/forecast/"
    private static let apiKey = "858db52f8e2037578ef6a518b52a0cc2"
    
    
    static func weatherForCoordinates(latitude: String, longitude: String, completion: @escaping (WeatherData?, Error?) -> ()) {
        let url = baseURL + apiKey + "/\(latitude),\(longitude)"
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let result):
                completion(WeatherData(data: result), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

//
//  API.swift
//  CovidStatistics
//
//  Created by Batuhan Baran on 3.07.2021.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

class API: NSObject {
    class func fetch<T: Decodable>(endPoint: String, with params: [String:String] = [:], httpMethod: HTTPMethod, completion: @escaping (Result<T,Error>) -> ()) {
        let url = URL(string: APIPaths.baseURL.rawValue + endPoint)!
        var components = URLComponents(string: "\(url)")!
        components.queryItems = params.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.addValue(Constants.ApiKey.key, forHTTPHeaderField: "authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let decoder = JSONDecoder()
            
            do {
                if let data = data {
                    let jsonData = try decoder.decode(T.self, from: data)
                    completion(.success(jsonData))
                }
            }catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


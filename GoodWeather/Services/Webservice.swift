//
//  Webservice.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 25/12/2021.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    func load<T>(resourse: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resourse.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resourse.parse(data))
                }
            } else {
                 completion(nil)
            }
        }.resume()
    }
}

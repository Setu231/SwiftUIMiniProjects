//
//  NetworkManager.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/1/24.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    let mockData = [Appetizer(name: "Asian Flank Steak", id: 1, calories: 300, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", carbs: 0, description: "This perfectly thin cut just melts in your mouth.", protein: 30, price: 23.5)]
    
    private init() {}
    
    func getURLData() async throws -> AppetizerWrapper {
        let urlString = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
        guard let url = URL(string: urlString) else {
            throw APIError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidStatusCode
        }
        
        do {
            return try JSONDecoder().decode(AppetizerWrapper.self, from: data)
        } catch {
            throw APIError.jsonError
        }
    }
    
    func downloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return }
            guard let data, let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }.resume()
    }
}

//
//  AppetizerModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/1/24.
//

import Foundation

struct Appetizer: Identifiable, Hashable, Codable {
    var name: String?
    var id: Int?
    var calories: Int?
    var imageURL: String?
    var carbs: Int?
    var description: String?
    var protein: Int?
    var price: Double?
}

struct AppetizerWrapper: Codable {
    var request: [Appetizer]?
}

struct UserDetail: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    var isNapkinRequired = false
    var isRefillRequired = false
}

enum APIError: Error {
    case invalidUrl, invalidStatusCode, jsonError, undetchedError
}

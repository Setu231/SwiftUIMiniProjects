//
//  CocktailModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/24/24.
//

import Foundation

enum JPError: Error {
    case urlError, jsonError, noResponseError, invalidError
    
    var errorString: String {
        switch self {
        case .urlError:
            return "Found an URL Error"
        case .jsonError:
            return "Found an JSON Decoding Error"
        case .noResponseError:
            return "Found an No Response Error"
        case .invalidError:
            return "Found an Unknown Error"
        }
    }
}

struct DrinkList: Hashable, Codable {
    var drinks: [Drinks]?
}

struct Drinks: Hashable, Codable {
    var strDrink: String?
    var strGlass: String?
    var strInstructions: String?
    var strInstructionsDE: String?
    var strInstructionsIT: String?
    var strImageSource: String?
    var strDrinkThumb: String?
}

extension Drinks: Identifiable {
  var id: String { strDrink ?? "" }
}

extension DrinkList: Identifiable {
    var id: [Drinks] { drinks ?? [Drinks]() }
}


//
//  FoodMartModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/28/24.
//

import Foundation

struct Food {
    var foodName: String?
    var foodQuantity: Int?
    var foodImage: String?
    var foodDescription: String?
}

struct FoodMartData {
    
    var foodModalData = [Food(foodName: "Vada Pav", foodQuantity: 0),
                                Food(foodName: "Handvo", foodQuantity: 0),
                                Food(foodName: "Khichdi", foodQuantity: 0),
                                Food(foodName: "Pav Bhajji", foodQuantity: 0),
                                Food(foodName: "Dabeli", foodQuantity: 0),
                                Food(foodName: "Misal Pav", foodQuantity: 0),
                                Food(foodName: "Pizza", foodQuantity: 0),
                                Food(foodName: "Sev Usal", foodQuantity: 0)]
}

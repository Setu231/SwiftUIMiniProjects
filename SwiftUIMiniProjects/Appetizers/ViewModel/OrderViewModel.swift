//
//  OrderViewModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/1/24.
//

import Foundation

final class OrderViewModel: ObservableObject {
    
    @Published var selectedAppetizersList = [Appetizer]()
    
    var isOrderListEmpty: Bool {
        selectedAppetizersList.isEmpty
    }
    
    var totalPrice: Double {
        selectedAppetizersList.reduce(0, { $0 + ($1.price ?? 0.0) })
    }
    
    func deleteItems(at offsets: IndexSet) {
        selectedAppetizersList.remove(atOffsets: offsets)
    }
    
    func addItems(of appetizer: Appetizer) {
        selectedAppetizersList.append(appetizer)
    }
}

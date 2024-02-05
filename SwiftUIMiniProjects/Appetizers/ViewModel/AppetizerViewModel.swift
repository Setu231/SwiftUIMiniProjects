//
//  AppetizerViewModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/28/24.
//

import Foundation
import UIKit

final class AppetizerViewModel: ObservableObject {
    
    @Published var appetizerList = [Appetizer]()
    @Published var isDetailViewShowing = false
    @Published var isLoading = false
    @Published var selectedAppetizersList = [Appetizer]()
    
    func fetchDataCall() {
        isLoading = true
        Task {
            let urlData = try await NetworkManager.shared.getURLData()
            self.isLoading = false
            self.appetizerList = urlData.request ?? []
        }
    }
}

final class AppetizerImageModel: ObservableObject {
    @Published var appetizerImage = UIImage()
    
    func getAppetizerImage(urlString: String?) {
        guard let urlString else {
            self.appetizerImage = UIImage(systemName: "house") ?? UIImage()
            return
        }
        
        NetworkManager.shared.downloadImage(urlString: urlString) { image in
            DispatchQueue.main.async {
                if let image {
                    self.appetizerImage = image
                } else {
                    self.appetizerImage = UIImage(systemName: "house") ?? UIImage()
                }
            }
        }
    }
}


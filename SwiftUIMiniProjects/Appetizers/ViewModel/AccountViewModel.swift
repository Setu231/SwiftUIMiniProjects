//
//  AccountViewModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/1/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") var userData: Data?
    @Published var userDetails = UserDetail()
    @Published var alertItem = AlertItem.noError
    @Published var isAlertRequired =  false
    
    var lowerBoundDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
    
    var isValidForm: Bool {
        guard !userDetails.firstName.isEmpty && !userDetails.lastName.isEmpty && !userDetails.email.isEmpty else {
            isAlertRequired = true
            alertItem = AlertItem.notFullyFilled
            return false
        }
        guard userDetails.email.isValidEmail else {
            isAlertRequired = true
            alertItem = AlertItem.invalidEmail
            return false
        }
        isAlertRequired = false
        alertItem = AlertItem.noError
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        do {
            userData = try JSONEncoder().encode(userDetails)
            alertItem = AlertItem.noError
        } catch {
            alertItem = AlertItem.notFullyFilled
        }
    }
    
    func retrieveUser() {
        guard let userData else { return }
        do {
            let data = try JSONDecoder().decode(UserDetail.self, from: userData)
            userDetails = data
        } catch {
            alertItem = AlertItem.notFullyFilled
        }
    }
}

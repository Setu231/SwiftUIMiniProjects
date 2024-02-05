//
//  AccountView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/30/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $accountViewModel.userDetails.firstName)
                    TextField("Last Name", text: $accountViewModel.userDetails.lastName)
                    TextField("Email", text: $accountViewModel.userDetails.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    DatePicker("Enter Birth Date", selection: $accountViewModel.userDetails.birthdate, in: ...(accountViewModel.lowerBoundDate ?? Date()), displayedComponents: .date)
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $accountViewModel.userDetails.isNapkinRequired)
                        .tint(Color.appetizerBrandColor)
                        .toggleStyle(.switch)
                    Toggle("Frequent Refill", isOn: $accountViewModel.userDetails.isRefillRequired)
                        .tint(Color.appetizerBrandColor)
                    Button {
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                            .foregroundColor(Color.appetizerBrandColor)
                    }
                }
            }
            .onAppear {
                accountViewModel.retrieveUser()
            }
            .navigationTitle("⌮ Account")
                .alert(isPresented: $accountViewModel.isAlertRequired) {
                    Alert(title: Text(accountViewModel.alertItem.title),
                          message: Text(accountViewModel.alertItem.message),
                          dismissButton: .default(Text("Ok")))
                }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

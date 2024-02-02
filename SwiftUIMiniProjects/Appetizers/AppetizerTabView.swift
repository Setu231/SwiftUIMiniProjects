//
//  AppetizerTabView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/30/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Orders")
                }
        }.tint(Color("brandColor"))
    }
}

struct AppetizerView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}

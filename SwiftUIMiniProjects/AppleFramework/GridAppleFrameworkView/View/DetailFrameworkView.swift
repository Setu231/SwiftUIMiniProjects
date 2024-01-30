//
//  DetailFrameworkView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/23/24.
//

import SwiftUI

struct DetailFrameworkView: View {
    
//    Warning: "Kept for Alternate Method"
//    @Environment(\.openURL) var openURL
//    @Environment(\.colorScheme) var colorScheme
    
    var frameworkDetail: Framework
    @Binding var isDetailViewPresented: Bool
    @State private var isSafariView = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                HStack {
                    Spacer()
                    Button {
                        isDetailViewPresented = false
                    } label: {
                        Image(systemName: "xmark")
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.black)
                    }
                }
                Spacer()
                FrameworkCollectionView(frameworkItem: frameworkDetail)
                Spacer()
                Text(frameworkDetail.description).padding()
                Spacer()
                Button {
                    //    Warning: "Kept for Alternate Method"
//                    if let url = URL(string: frameworkDetail.urlString) {
//                        openURL(url)
//                    }
                    isSafariView = true
                } label: {
                    Text("Learn More")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(width: 280, height: 50)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }.sheet(isPresented: $isSafariView) {
                SafariView(url: URL(string: frameworkDetail.urlString) ?? URL(fileURLWithPath: ""))
            }
        }
    }
}

struct DetailFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFrameworkView(frameworkDetail: MockData.sampleFramework, isDetailViewPresented: .constant(false))
    }
}

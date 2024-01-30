//
//  DetailListFrameworkView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/29/24.
//

import SwiftUI

struct DetailListFrameworkView: View {
    
    var frameworkDetail: Framework
    @Binding var isDetailViewPresented: Bool
    @State private var isSafariView = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                FrameworkCollectionView(frameworkItem: frameworkDetail)
                Spacer()
                Text(frameworkDetail.description).padding()
                Spacer()
                Button {
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

struct DetailListFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        DetailListFrameworkView(frameworkDetail: MockData.sampleFramework, isDetailViewPresented: .constant(false))
    }
}

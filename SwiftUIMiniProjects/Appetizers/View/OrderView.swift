//
//  OrderView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/30/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        ZStack {
            if orderViewModel.isOrderListEmpty {
                VStack {
                    Image(systemName: "scroll")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 200)
                        .tint(Color("brandColor"))
                    Text("The Order List is Empty")
                }
            } else {
                NavigationView {
                    VStack {
                        List {
                            ForEach(orderViewModel.selectedAppetizersList) { eachAppetizer in
                                AppetizerListCellView(appetizer: eachAppetizer)
                            }.onDelete(perform: orderViewModel.deleteItems)
                        }
                        .navigationTitle("🧾 Orders")
                        .listStyle(PlainListStyle())
                        
                        Button {
                            print("order")
                        } label: {
                            Text("$\(orderViewModel.totalPrice, specifier: "%.2f") Place Order")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(width: 260, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("brandColor"))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

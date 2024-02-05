//
//  GeometryView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/2/24.
//

import SwiftUI

struct GeometryColor: Hashable, Identifiable {
    let id = UUID()
    var redValue: Double
    var blueValue: Double
    var greenValue: Double
}

final class GeometryViewModel: ObservableObject {
    @Published var colorArrayList = [GeometryColor]()
}

struct GeometryView: View {
    
    @ObservedObject var geometryVM: GeometryViewModel
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack() {
                    Text("GeometryReader")
                        .font(.title)
                    List(geometryVM.colorArrayList, id: \.self) { color in
                        Rectangle()
                            .foregroundColor(Color(cgColor: CGColor(red: color.redValue, green: color.greenValue, blue: color.blueValue, alpha: 1)))
                            .frame(height: geometry.size.height/6)
                            .cornerRadius(20)
                    }.listStyle(.plain)
                }
            }.toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        let newBackgroundColor = GeometryColor(redValue: Double.random(in: 0...1), blueValue: Double.random(in: 0...1), greenValue: Double.random(in: 0.1...1))
                        geometryVM.colorArrayList.append(newBackgroundColor)
                        print(geometryVM.colorArrayList.count)
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                }
            })
        }
    }
}

struct GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryView(geometryVM: GeometryViewModel())
    }
}

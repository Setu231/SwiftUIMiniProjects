//
//  AdaptiveSwitchCaseView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/27/24.
//

import SwiftUI

struct AdaptiveSwitchCaseView: View {
    
    @StateObject var switchViewModel = AdaptiveSwitchViewModel()
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \AdaptiveSwitchData.dateOfAddition, ascending: true)],
        animation: .default)
    private var switchData: FetchedResults<AdaptiveSwitchData>
    
    var gridItem = [GridItem(.flexible()),
                    GridItem(.flexible())]
    
    @State var alertInput = ""
    @State var isShowingAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItem, spacing: 8) {
                    ForEach(switchData, id: \.self) { eachSwitch in
                        AdaptiveSwitchGridView(isValueChanged: $switchViewModel.isSwitchOn,
                                               frameworkItem: eachSwitch)
                            .onTapGesture {
                                switchViewModel.adaptiveData = eachSwitch
                                eachSwitch.isSwitchOn = !eachSwitch.isSwitchOn
                                saveData()
                            }
                    }
                }.padding(16)
            }
            .navigationTitle("Adaptive Switch")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }.alert("Add New Switch", isPresented: $isShowingAlert) {
                        TextField("", text: $alertInput)
                            .foregroundColor(Color.black)
                        Button("Add", action: {
                            saveTodo(name: alertInput, status: false)
                            alertInput = ""
                        })
                    }
                }
            }
        }
    }
    
    func saveTodo(name: String, status: Bool) {
        let switchData = AdaptiveSwitchData(context: self.viewContext)
        switchData.dateOfAddition = Date()
        switchData.switchName = name
        switchData.isSwitchOn = status
        saveData()
    }
    
    func saveData() {
        do {
            try self.viewContext.save()
            let getData = try viewContext.fetch(AdaptiveSwitchData.fetchRequest())
            print(getData)
        } catch {
            print("whoops \\(error.localizedDescription)")
        }
    }
}

struct AdaptiveSwitchGridView: View {
    
    @Binding var isValueChanged: Bool
    var frameworkItem: AdaptiveSwitchData
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    LinearGradient(colors: frameworkItem.isSwitchOn ? [.orange, .yellow] : [.gray.opacity(0.4), .gray.opacity(0.7)],
                           startPoint: .top,
                           endPoint: .bottom))
                .shadow(color: .black.opacity(0.01), radius: 6, x: 0, y: 0)
            
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: frameworkItem.isSwitchOn ? "lightswitch.on" : "lightswitch.off")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35, alignment: .leading)
                    
                Text(frameworkItem.switchName ?? "")
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(alignment: .leading)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.white)
                    .animation(frameworkItem.isSwitchOn ? .easeIn.delay(0.3) : .easeInOut.delay(0.3), value: frameworkItem.isSwitchOn)
                    .minimumScaleFactor(0.8)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 16)
        }
        .cornerRadius(20)
    }
}

struct AdaptiveSwitchCaseView_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveSwitchCaseView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

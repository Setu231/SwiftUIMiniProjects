//
//  DraggableView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/4/24.
//

import SwiftUI

struct DraggableView: View {
    
    var title: String
    var tasks: [TaskWorkData]
    var nameTitle: String
    var isNameView: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if isNameView {
                Spacer(minLength: 50)
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .overlay(alignment: .center) {
                            Text(nameTitle)
                                .multilineTextAlignment(.center)
                        }
                }.frame(width: 50)
            } else {
                Spacer(minLength: 30)
                Text(title)
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .foregroundColor(Color(.secondarySystemFill))
                        .cornerRadius(20)
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(tasks, id: \.taskName) {task in
                            Text(task.taskName ?? "")
                                .font(.body)
                                .padding(10)
                                .background(Color.white)
                                .cornerRadius(10)
                                .draggable(task)
                        }.padding(5)
                    }.padding(10)
                }
            }
        }.padding(10)
    }
}

//
//  DraggableJiraView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/2/24.
//

import SwiftUI

struct DraggableJiraView: View {
    
    @StateObject var draggableVM = draggableViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(draggableVM.developerNameList, id: \.self) { name in
                    HStack(alignment: .top) {
                        DraggableView(title: "", tasks: [], nameTitle: name.developerName ?? "", isNameView: true)
                        DraggableView(title: "To Do", tasks: draggableVM.toDoList.filter({$0.taskDeveloper == name}), nameTitle: "", isNameView: false)
                            .dropDestination(for: TaskWorkData.self) { droppedTasks, _ in
                                draggableVM.todoDropDestionation(droppedTasks: droppedTasks)
                                return true
                            }
                        DraggableView(title: "In Progress", tasks: draggableVM.inProgressList.filter({$0.taskDeveloper == name}), nameTitle: "", isNameView: false)
                            .dropDestination(for: TaskWorkData.self) { droppedTasks, _ in
                                draggableVM.inProgressDropDestionation(droppedTasks: droppedTasks)
                                return true
                            }
                        DraggableView(title: "Completed", tasks: draggableVM.completedList.filter({$0.taskDeveloper == name}), nameTitle: "", isNameView: false)
                            .dropDestination(for: TaskWorkData.self) { droppedTasks, _ in
                                draggableVM.completedDropDestionation(droppedTasks: droppedTasks)
                                return true
                            }
                    }
                }
            }.navigationTitle("Customized Jira")
        }
    }
}

struct DraggableJira_Previews: PreviewProvider {
    static var previews: some View {
        DraggableJiraView().previewInterfaceOrientation(.landscapeLeft)
    }
}

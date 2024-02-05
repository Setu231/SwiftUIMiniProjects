//
//  Jira.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/4/24.
//

//
//  DraggableJira.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/2/24.
//
//
//  DraggableJira.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/2/24.
//

//import SwiftUI
//import UniformTypeIdentifiers
//
//enum TaskStatus: Codable {
//    case toDo, inProgress, completed
//}
//
//struct TaskDeveloper: Hashable, Codable {
//    var developerName: String?
//    var developerSpeciality: String?
//}
//
//class TaskWorkData: Hashable, Codable, Transferable {
//    static var transferRepresentation: some TransferRepresentation {
//        CodableRepresentation(contentType: .taskWorkData)
//    }
//    
//    var taskName: String?
//    var taskDetail: String?
//    var taskDeveloper: TaskDeveloper?
//    
//    init(taskName: String? = nil, taskDetail: String? = nil, taskDeveloper: TaskDeveloper? = nil) {
//        self.taskName = taskName
//        self.taskDetail = taskDetail
//        self.taskDeveloper = taskDeveloper
//    }
//}
//
//extension TaskWorkData: Equatable {
//    static func == (lhs: TaskWorkData, rhs: TaskWorkData) -> Bool {
//        lhs.taskName == rhs.taskName &&
//        lhs.taskDetail == rhs.taskDetail &&
//        lhs.taskDeveloper == rhs.taskDeveloper
//    }
//    
//    func hash(into hasher: inout Hasher) {
//            hasher.combine(taskName)
//            hasher.combine(taskDetail)
//        }
//}
//
//struct TaskWorkDataList: Codable, Transferable {
//    var taskList: [TaskWorkData]
//    
//    static var transferRepresentation: some TransferRepresentation {
//        CodableRepresentation(contentType: .taskWorkDataList)
//    }
//}
//
//extension TaskWorkDataList: Equatable {
//    static func == (lhs: TaskWorkDataList, rhs: TaskWorkDataList) -> Bool {
//        lhs.taskList == rhs.taskList
//    }
//}
//
//
//extension UTType {
//    static var taskWorkDataList = UTType(exportedAs: "SD.SwiftUIMiniProjects")
//    static var taskWorkData = UTType(exportedAs: "SD.SwiftUIMiniProjects")
//}
//
//final class draggableViewModel: ObservableObject {
//    @Published var toDoList = [TaskWorkData(taskName: "Jupiter", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
//                           TaskWorkData(taskName: "Saturn", taskDeveloper: TaskDeveloper(developerName: "Samir", developerSpeciality: "iOS")),
//                           TaskWorkData(taskName: "Uranus", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
//                           TaskWorkData(taskName: "Neptune", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
//                           TaskWorkData(taskName: "Pluto", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
//                           TaskWorkData(taskName: "Earth", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
//                           TaskWorkData(taskName: "Mars", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
//                           TaskWorkData(taskName: "Venus", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
//                           TaskWorkData(taskName: "Mercury", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS"))]
//    @Published var inProgressList = [TaskWorkData]()
//    @Published var completedList = [TaskWorkData]()
//    
//    var tasksList: [TaskWorkData] {
//        return toDoList + inProgressList + completedList
//    }
//    
//    var developerNameList: [TaskDeveloper] {
//        return Array(Set(tasksList.map({
//            $0.taskDeveloper ?? TaskDeveloper()
//        }))).sorted(by: {
//            $0.developerName ?? "" < $1.developerName ?? ""
//        })
//    }
//    
//    func todoDropDestionation(droppedTasks: [TaskWorkData]) {
//        for droppedTask in droppedTasks {
//            inProgressList.removeAll { $0 == droppedTask }
//            completedList.removeAll { $0 == droppedTask }
//            toDoList.append(droppedTask)
//        }
//        let totalTask = toDoList
//        toDoList = Array(Set(totalTask))
//    }
//    
//    func inProgressDropDestionation(droppedTasks: [TaskWorkData]) {
//        for droppedTask in droppedTasks {
//            toDoList.removeAll { $0 == droppedTask }
//            completedList.removeAll { $0 == droppedTask }
//            inProgressList.append(droppedTask)
//        }
//        let totalTask = inProgressList
//        inProgressList = Array(Set(totalTask))
//    }
//    
//    func completedDropDestionation(droppedTasks: [TaskWorkData]) {
//        for droppedTask in droppedTasks {
//            toDoList.removeAll { $0 == droppedTask }
//            inProgressList.removeAll { $0 == droppedTask }
//            completedList.append(droppedTask)
//        }
//        let totalTask = completedList
//        completedList = Array(Set(totalTask))
//    }
//}
//
//struct ContentView: View {
//    
//    @StateObject var draggableVM = draggableViewModel()
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                ForEach(draggableVM.developerNameList, id: \.self) { name in
//                    HStack(alignment: .top) {
//                        DraggableView(title: "", tasks: [], nameTitle: name.developerName ?? "", isNameView: true)
//                        DraggableView(title: "To Do", tasks: draggableVM.toDoList.filter({$0.taskDeveloper == name}), nameTitle: "", isNameView: false)
//                            .dropDestination(for: TaskWorkData.self) { droppedTasks, _ in
//                                draggableVM.todoDropDestionation(droppedTasks: droppedTasks)
//                                return true
//                            }
//                        DraggableView(title: "In Progress", tasks: draggableVM.inProgressList.filter({$0.taskDeveloper == name}), nameTitle: "", isNameView: false)
//                            .dropDestination(for: TaskWorkData.self) { droppedTasks, _ in
//                                draggableVM.inProgressDropDestionation(droppedTasks: droppedTasks)
//                                return true
//                            }
//                        DraggableView(title: "Completed", tasks: draggableVM.completedList.filter({$0.taskDeveloper == name}), nameTitle: "", isNameView: false)
//                            .dropDestination(for: TaskWorkData.self) { droppedTasks, _ in
//                                draggableVM.completedDropDestionation(droppedTasks: droppedTasks)
//                                return true
//                            }
//                    }
//                }
//            }.navigationTitle("Customized Jira")
//        }
//    }
//}
//
//struct DraggableView: View {
//    
//    var title: String
//    var tasks: [TaskWorkData]
//    var nameTitle: String
//    var isNameView: Bool
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            if isNameView {
//                Spacer(minLength: 50)
//                ZStack(alignment: .topLeading) {
//                    Rectangle()
//                        .foregroundColor(Color.white)
//                        .cornerRadius(20)
//                        .overlay(alignment: .center) {
//                            Text(nameTitle)
//                                .multilineTextAlignment(.center)
//                        }
//                }.frame(width: 50)
//            } else {
//                Spacer(minLength: 30)
//                Text(title)
//                ZStack(alignment: .topLeading) {
//                    Rectangle()
//                        .foregroundColor(Color(.secondarySystemFill))
//                        .cornerRadius(20)
//                    VStack(alignment: .leading, spacing: 8) {
//                        ForEach(tasks, id: \.taskName) {task in
//                            Text(task.taskName ?? "")
//                                .font(.body)
//                                .padding(10)
//                                .background(Color.white)
//                                .cornerRadius(10)
//                                .draggable(task)
//                        }.padding(5)
//                    }.padding(10)
//                }
//            }
//        }.padding(10)
//    }
//}
//
//struct DraggableJira_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().previewInterfaceOrientation(.landscapeLeft)
//    }
//}

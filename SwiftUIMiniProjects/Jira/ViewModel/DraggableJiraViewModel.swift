//
//  DraggableJiraViewModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/4/24.
//

import SwiftUI

final class draggableViewModel: ObservableObject {
    @Published var toDoList = [TaskWorkData(taskName: "Jupiter", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
                           TaskWorkData(taskName: "Saturn", taskDeveloper: TaskDeveloper(developerName: "Samir", developerSpeciality: "iOS")),
                           TaskWorkData(taskName: "Uranus", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
                           TaskWorkData(taskName: "Neptune", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
                           TaskWorkData(taskName: "Pluto", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
                           TaskWorkData(taskName: "Earth", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
                           TaskWorkData(taskName: "Mars", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
                           TaskWorkData(taskName: "Venus", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS")),
                           TaskWorkData(taskName: "Mercury", taskDeveloper: TaskDeveloper(developerName: "Setu", developerSpeciality: "iOS"))]
    @Published var inProgressList = [TaskWorkData]()
    @Published var completedList = [TaskWorkData]()
    
    var tasksList: [TaskWorkData] {
        return toDoList + inProgressList + completedList
    }
    
    var developerNameList: [TaskDeveloper] {
        return Array(Set(tasksList.map({
            $0.taskDeveloper ?? TaskDeveloper()
        }))).sorted(by: {
            $0.developerName ?? "" < $1.developerName ?? ""
        })
    }
    
    func todoDropDestionation(droppedTasks: [TaskWorkData]) {
        for droppedTask in droppedTasks {
            inProgressList.removeAll { $0 == droppedTask }
            completedList.removeAll { $0 == droppedTask }
            toDoList.append(droppedTask)
        }
        let totalTask = toDoList
        toDoList = Array(Set(totalTask))
    }
    
    func inProgressDropDestionation(droppedTasks: [TaskWorkData]) {
        for droppedTask in droppedTasks {
            toDoList.removeAll { $0 == droppedTask }
            completedList.removeAll { $0 == droppedTask }
            inProgressList.append(droppedTask)
        }
        let totalTask = inProgressList
        inProgressList = Array(Set(totalTask))
    }
    
    func completedDropDestionation(droppedTasks: [TaskWorkData]) {
        for droppedTask in droppedTasks {
            toDoList.removeAll { $0 == droppedTask }
            inProgressList.removeAll { $0 == droppedTask }
            completedList.append(droppedTask)
        }
        let totalTask = completedList
        completedList = Array(Set(totalTask))
    }
}

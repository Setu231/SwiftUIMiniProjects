//
//  DraggableJiraModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/4/24.
//

import SwiftUI
import UniformTypeIdentifiers

enum TaskStatus: Codable {
    case toDo, inProgress, completed
}

struct TaskDeveloper: Hashable, Codable {
    var developerName: String?
    var developerSpeciality: String?
}

class TaskWorkData: Hashable, Codable, Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .taskWorkData)
    }
    
    var taskName: String?
    var taskDetail: String?
    var taskDeveloper: TaskDeveloper?
    
    init(taskName: String? = nil, taskDetail: String? = nil, taskDeveloper: TaskDeveloper? = nil) {
        self.taskName = taskName
        self.taskDetail = taskDetail
        self.taskDeveloper = taskDeveloper
    }
}

extension TaskWorkData: Equatable {
    static func == (lhs: TaskWorkData, rhs: TaskWorkData) -> Bool {
        lhs.taskName == rhs.taskName &&
        lhs.taskDetail == rhs.taskDetail &&
        lhs.taskDeveloper == rhs.taskDeveloper
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(taskName)
            hasher.combine(taskDetail)
        }
}

struct TaskWorkDataList: Codable, Transferable {
    var taskList: [TaskWorkData]
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .taskWorkDataList)
    }
}

extension TaskWorkDataList: Equatable {
    static func == (lhs: TaskWorkDataList, rhs: TaskWorkDataList) -> Bool {
        lhs.taskList == rhs.taskList
    }
}


extension UTType {
    static var taskWorkDataList = UTType(exportedAs: "SD.SwiftUIMiniProjects")
    static var taskWorkData = UTType(exportedAs: "SD.SwiftUIMiniProjects")
}

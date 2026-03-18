//
//  ContentView.swift
//  ToDoApp
//
//  Created by Ghost Buster on 3/3/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var tasksGroups = TaskGroup.sampleData
    @State private var selectedGroup: TaskGroup?
    @State private var ColumnVisibility: NavigationSplitViewVisibility =
        .all
    @State private var isShowingAddGroup = false
    
    var body: some View {
        NavigationSplitView(columnVisibility: $ColumnVisibility) {
            List(selection: $selectedGroup) {
                ForEach(tasksGroups) { group in
                    NavigationLink(value: group) {
                        Label(group.title, systemImage: group.symbolName)
                    }
                }
            }
            .navigationTitle ("To Do")
            .listStyle(.sidebar)
        } detail: {
            
            if let selectedGroup = selectedGroup {
//                if let index = tasksGroups.firstIndex(where:{$0.id == group.id}){
//                    
//                }
                
                if let index = tasksGroups.firstIndex(where: { $0.id == selectedGroup.id }) {
                    
                    
                    TaskGroupDetailView(group: $tasksGroups[index])
                    
                }
            } else {
                ContentUnavailableView("Select a group", systemImage: "sidebar.left")
            }
        }
    }
    
    
    
    
}

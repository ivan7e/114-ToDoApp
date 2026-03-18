import SwiftUI

struct TaskGroupDetailView: View {
    @Binding var group: TaskGroup
    
    
    var body: some View {
        List {
            ForEach($group.tasks) { $task in
                HStack {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill " : "circle")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            withAnimation{
                                task.isCompleted.toggle()
                            }
                            
                        }
                    TextField("Task Title", text: $task.title)
                        .strikethrough(task.isCompleted)
                        .foregroundStyle(task.isCompleted ? .gray : .primary)
                    
                }
                
            }
            .onDelete{ indexSet in
                group.tasks.remove(atOffsets: indexSet)
            }
        }
        .navigationTitle(group.title)
        .toolbar {
            Button ("Add Task") {
                withAnimation{
                    group.tasks.append(TaskItem(title: ""))
                }
            }
    }
}

}

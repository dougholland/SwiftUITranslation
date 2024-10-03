//
//  BatchTranslationView.swift
//  SwifUITranslation
//
//  Created by Doug Holland on 10/3/24.
//

import SwiftUI
import Translation

struct BatchTranslationView: View {
    @State private var task: String = ""
    
    @State private var tasks: [String] = []
    
    @State private var configuration: TranslationSession.Configuration?
    
    var body: some View {
        VStack {
            TextField("enter a new task", text: $task, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(minHeight: 200)
            
            Button(action: {
                if !task.isEmpty {
                    tasks.append(task)
                    task = ""
                }
            }) {
                Text("Add Task")
                    .frame(minWidth: 80, maxWidth: .infinity)
                    .padding()
                    .cornerRadius(8)
            }
            
            Button(action: {
                Task {
                    try await performTranslation()
                }
            }) {
                Text("Translate")
                    .frame(minWidth: 80, maxWidth: .infinity)
                    .padding()
                    .cornerRadius(8)
            }
            .padding()
            
            List(tasks, id: \.self) { task in
                Text(task)
            }
        }
        .translationTask(configuration) { session in
            let requests: [TranslationSession.Request] = tasks.map {
                TranslationSession.Request(sourceText: $0)
            }
            
            do {
                let responses = try await session.translations(from: requests)
                
                tasks = responses.map {
                    $0.targetText
                }
            } catch {
                // TODO: handle errors
            }
        }
    }
    
    func performTranslation() async throws {
        if configuration == nil {
            configuration = TranslationSession.Configuration()
        }
        
        configuration?.invalidate()
    }
}

#Preview {
    BatchTranslationView()
}

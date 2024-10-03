//
//  SimpleTranslationView.swift
//  SwifUITranslation
//
//  Created by Doug Holland on 10/3/24.
//

import SwiftUI
import Translation

struct SimpleTranslationView: View {
    @State private var text: String = ""
    
    @State private var translatedText: String = ""
    
    @State private var configuration: TranslationSession.Configuration?
    
    var body: some View {
        VStack {
            TextField("enter text to translate", text: $text, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(minHeight: 200)
            
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
            
            TextField("translated text", text: $translatedText, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(minHeight: 200)
                
        }
        .translationTask(configuration) { session in
            do {
                let response = try await session.translate(text)
                
                translatedText = response.targetText
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
    SimpleTranslationView()
}

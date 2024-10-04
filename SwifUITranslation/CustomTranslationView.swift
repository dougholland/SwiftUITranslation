//
//  CustomTranslationView.swift
//  SwifUITranslation
//
//  Created by Doug Holland on 10/3/24.
//

import SwiftUI
import Translation

struct CustomTranslationView: View {
    @State private var text: String = ""
    
    @State private var translatedText: String = ""
    
    @State private var configuration: TranslationSession.Configuration?
    
    @State private var selectedLanguage: Language = .french
    
    @FocusState private var focus: Bool
    
    var body: some View {
        VStack {
            TextField("enter text to translate", text: $text, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(minHeight: 200)
                .focused($focus)
            
            Picker("select target language", selection: $selectedLanguage) {
                ForEach(Language.allCases, id: \.self) { language in
                    Text(language.name)
                        .tag(language)
                }
            }
            
            Button(action: {
                Task {
                    focus = false
                    
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
                
                configuration = nil
            } catch {
                // TODO: handle errors
            }
        }
    }
    
    func performTranslation() async throws {
        if configuration == nil {
            configuration = TranslationSession.Configuration(source: Locale.Language(identifier: "en-US"), target: Locale.Language(identifier: selectedLanguage.rawValue))
        }
        
        configuration?.invalidate()
    }
}

#Preview {
    CustomTranslationView()
}

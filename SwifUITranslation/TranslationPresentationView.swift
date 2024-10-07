//
//  TranslationPresentationView.swift
//  SwifUITranslation
//
//  Created by Doug Holland on 10/3/24.
//

import SwiftUI
import Translation

struct TranslationPresentationView: View {
    @State private var text: String = ""
    
    @State private var showTranslation: Bool = false
    
    @FocusState private var focus: Bool
    
    var body: some View {
        VStack {
            TextField("enter text to translate", text: $text, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(minHeight: 200)
                .focused($focus)
            
            Button(action: {
                Task {
                    showTranslation = true
                }
            }) {
                Text("Translate")
                    .frame(minWidth: 80, maxWidth: .infinity)
                    .padding()
                    .cornerRadius(8)
            }
            .padding()
        }
        .translationPresentation(isPresented: $showTranslation, text: text) { translated in
            text = translated
        }
    }
}

#Preview {
    TranslationPresentationView()
}

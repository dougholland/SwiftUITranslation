//
//  ContentView.swift
//  SwifUITranslation
//
//  Created by Doug Holland on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SimpleTranslationView()
                .tabItem {
                    Image(systemName: "1.circle")
                }
            
            BatchTranslationView()
                .tabItem {
                    Image(systemName: "2.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}

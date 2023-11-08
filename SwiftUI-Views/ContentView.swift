//
//  ContentView.swift
//  SwiftUI-Views
//
//  Created by Hangyeol on 11/3/23.
//

import SwiftUI

enum NavigationDestination: CaseIterable {
    case observeScrollViewOffset
    case getViewSize
    
    var title: String {
        switch self {
        case .observeScrollViewOffset:  return "Observe ScrollView Offset"
        case .getViewSize:              return "Get View Size"
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(NavigationDestination.allCases, id: \.self) {
                    NavigationLink($0.title, value: $0)
                }
            }
            .navigationDestination(for: NavigationDestination.self) {
                switch $0 {
                case .observeScrollViewOffset:  ObserveScrollViewOffsetView()
                case .getViewSize:              GetViewSizeView()
                }
            }
            .navigationTitle("Views & ViewModifiers")
        }
    }
}

#Preview {
    ContentView()
}
